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
              Container(
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
                        "User name",
                        style: TextStyle(
                            fontFamily: "RedHatDisplay",
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "Samsat Taggamus",
                      style: TextStyle(
                          fontFamily: "RedHatDisplay",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
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
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: RaisedButton(
                        elevation: 5,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ChangePassword();
                          }));
                        },
                        child: Text(
                          "Ubah Kata Sandi",
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
                        AuthMethods().signOut();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                      },
                      child: Text("Keluar",
                          style: TextStyle(
                              fontFamily: "PublicSans",
                              fontWeight: FontWeight.bold)),
                      color: Color(0xFFFFCE00),
                    ),
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
