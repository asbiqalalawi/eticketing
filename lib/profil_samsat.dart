import 'package:eticketing/changepassword_page.dart';
import 'package:eticketing/login_page.dart';
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
          style: TextStyle(color: Colors.black),
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
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "Samsat Taggamus",
                      style: TextStyle(
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
                            return ChangePassword();
                          }));
                        },
                        child: Text("Change Password"),
                        color: Color(0xFFFFF0B2),
                      ),
                    ),
                    RaisedButton(
                      elevation: 5,
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                      },
                      child: Text("Logout"),
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
