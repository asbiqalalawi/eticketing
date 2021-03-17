import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticketing/helper/sharedpref_helper.dart';
import 'package:eticketing/services/database.dart';
import 'package:eticketing/views/bottom_navigation.dart';
import 'package:eticketing/views/manageuser_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await auth.currentUser;
  }

  signUp(String email, String password, String samsat, String name,
      BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User userDetail = userCredential.user;

      if (userCredential != null) {
        SharedPreferenceHelper().saveUserEmail(userDetail.email);
        SharedPreferenceHelper().saveUserId(userDetail.uid);
        SharedPreferenceHelper().saveUserName(name);
        SharedPreferenceHelper().saveSamsatName(samsat);

        Map<String, dynamic> userInfoMap = {
          "email": userDetail.email,
          "name": name,
          "samsatname": samsat
        };
        if (samsat == "Bapenda" || samsat == "Admin") {
          Map<String, dynamic> bapenda = {
            "ticket": 0,
            "lastUpdate": DateTime.now(),
            "onProcess": 0,
            "finish": 0
          };
          DatabaseMethods().addUserMyTicketToDB(name, bapenda, samsat);
        } else {
          Map<String, dynamic> userTicketMap = {
            "ticket": 0,
            "lastUpdate": DateTime.now(),
            "onProcess": 0,
            "available": 0
          };
          DatabaseMethods().addUserMyTicketToDB(name, userTicketMap, samsat);
        }
        DatabaseMethods()
            .addUserInfoToDB(userDetail.uid, userInfoMap)
            .then((value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => ManageUserPage()));
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  signIn(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User userDetail = userCredential.user;

      QuerySnapshot querySnapshot =
          await DatabaseMethods().getUserInfo(userDetail.email);

      if (userCredential != null) {
        SharedPreferenceHelper().saveUserEmail(userDetail.email);
        SharedPreferenceHelper().saveUserId(userDetail.uid);
        SharedPreferenceHelper().saveUserName(querySnapshot.docs[0]["name"]);
        SharedPreferenceHelper()
            .saveSamsatName(querySnapshot.docs[0]["samsatname"]);

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => BottomNavigation()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    await auth.signOut();
  }
}
