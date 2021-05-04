import 'package:eticketing/helper/sharedpref_helper.dart';
import 'package:eticketing/services/auth.dart';

import 'package:eticketing/views/manageuser_page.dart';
import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  String myOriginName, myUserName, myEmail, displayName;

  getMyInfoFromSharedPreferences() async {
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
    myOriginName = await SharedPreferenceHelper().getOriginName();
    displayName = await SharedPreferenceHelper().getDisplayName();
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
                              displayName.toString(),
                              style: TextStyle(
                                  fontFamily: "RedHatDisplay",
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            myOriginName.toString(),
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
                          (myOriginName == "Admin")
                              ? Container(
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
                                )
                              : SizedBox(),
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
