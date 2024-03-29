import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticketing/helper/sharedpref_helper.dart';
import 'package:eticketing/services/database.dart';
import 'package:eticketing/views/bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  getCurrentUser() async {
    return auth.currentUser;
  }

  signUp(String email, String password, String origin, String name,
      BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User userDetail = userCredential.user;

      if (userCredential != null) {
        // SharedPreferenceHelper().saveUserEmail(userDetail.email);
        // SharedPreferenceHelper().saveUserId(userDetail.uid);
        // SharedPreferenceHelper().saveUserName(name);
        // SharedPreferenceHelper().saveOriginName(origin);

        Map<String, dynamic> userInfoMap = {
          "email": userDetail.email,
          "name": name,
          "originName": origin,
          "logedIn": "false",
        };
        if (origin == "Bapenda" || origin == "Admin") {
          Map<String, dynamic> bapenda = {
            "lastUpdate": DateTime.now(),
            "onProcess": 0,
            "finish": 0
          };
          DatabaseMethods().addUserMyTicketToDB(email, bapenda, origin);
        } else {
          Map<String, dynamic> userTicketMap = {
            "ticket": 0,
            "lastUpdate": DateTime.now(),
            "onProcess": 0,
            "available": 0
          };
          DatabaseMethods().addUserMyTicketToDB(email, userTicketMap, origin);
        }
        DatabaseMethods()
            .addUserInfoToDB(userDetail.uid, userInfoMap)
            .then((value) {
          Navigator.pop(context);
          Navigator.pop(context);
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text('Gagal membuat akun'),
              content: Text('Email tersebut sudah terdaftar'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);

                    //
                  },
                  child: Text(
                    'Kembali',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          },
        );
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
        CollectionReference _users = _firestore.collection('users');
        _users
            .doc(userDetail.uid)
            .update({
              'logedIn': "true",
            })
            .then((value) => print("User Login"))
            .catchError((error) => print("Gagal login"));
        String myBool = "LOGEDIN";
        SharedPreferenceHelper().saveUserEmail(userDetail.email);
        SharedPreferenceHelper().saveUserId(userDetail.uid);
        SharedPreferenceHelper().saveUserName(querySnapshot.docs[0]["name"]);
        SharedPreferenceHelper()
            .saveOriginName(querySnapshot.docs[0]["originName"]);
        SharedPreferenceHelper().saveLogedIn(querySnapshot.docs[0]['logedIn']);

        myBool = await SharedPreferenceHelper().getLogedIn();

        /* print('XXXXXXXXXX disini');
        print(myBool);
        print('XXXXXXXXXX disini'); */

        if (myBool == 'false') {
          print("1 login");
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => BottomNavigation()));
        } else {
          print("2 login");
          AuthMethods().toSignOut(context);
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text('Gagal masuk'),
              content: Text('Email tidak ditemukan'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Kembali',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          },
        );
      } else if (e.code == 'wrong-password') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text('Gagal masuk'),
              content: Text('Password salah'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Kembali',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          },
        );
      }
    }
  }

  Future toSignOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    auth.signOut();
    preferences.clear();
    Future.delayed(const Duration(milliseconds: 500), () {
      RestartWidget.restartApp(context);
    });

    //return new LoginPage();
  }
  // await auth.signOut();

}

class RestartWidget extends StatefulWidget {
  RestartWidget({this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>().restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
