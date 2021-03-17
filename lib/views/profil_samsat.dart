import 'package:eticketing/helper/sharedpref_helper.dart';
import 'package:eticketing/services/auth.dart';
import 'package:eticketing/views/changepassword_page.dart';
import 'package:eticketing/views/login_page.dart';

import 'package:eticketing/views/manageuser_page.dart';
import 'package:flutter/material.dart';

class ProfilSamsat extends StatefulWidget {
  @override
  _ProfilSamsatState createState() => _ProfilSamsatState();
}

class _ProfilSamsatState extends State<ProfilSamsat> {
  String mySamsatName, myUserName, myEmail;

  getMyInfoFromSharedPreferences() async {
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
    mySamsatName = await SharedPreferenceHelper().getSamsatName();
    setState(() {});
  }

  @override
  void initState() {
    getMyInfoFromSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFCE00),
        title: Text(
          "Profil",
          style: TextStyle(fontFamily: "RedHatDisplay", color: Colors.black),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              myUserName != null
                  ? Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Column(
                        children: [
                          Icon(
                            Icons.account_circle_outlined,
                            size: 200,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 7),
                            child: Text(
                              myUserName.toString(),
                              style: TextStyle(
                                  fontFamily: "RedHatDisplay",
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            mySamsatName.toString(),
                            style: TextStyle(
                                fontFamily: "RedHatDisplay",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 60),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: RaisedButton(
                              elevation: 5,
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ManageUserPage();
                                }));
                              },
                              child: Text(
                                "Manajemen User",
                                style: TextStyle(
                                    fontFamily: "PublicSans",
                                    fontWeight: FontWeight.bold),
                              ),
                              color: Color(0xFFFFF0B2),
                            ),
                          ),
                          RaisedButton(
                            elevation: 5,
                            onPressed: () {
                              AuthMethods().signOut(context);
                            },
                            child: Text("Keluar",
                                style: TextStyle(
                                    fontFamily: "PublicSans",
                                    fontWeight: FontWeight.bold)),
                            color: Color(0xFFFFCE00),
                          ),
                        ],
                      ),
                    ), //fic
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
