import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticketing/helper/sharedpref_helper.dart';
import 'package:eticketing/services/auth.dart';

import 'package:eticketing/views/manageuser_page.dart';
import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  String myOriginName, myUserName, myEmail;

  getMyInfoFromSharedPreferences() async {
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
    myOriginName = await SharedPreferenceHelper().getOriginName();
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
                  : SizedBox(),
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
                                DocumentReference antrian = FirebaseFirestore
                                    .instance
                                    .collection("nomor")
                                    .doc("antrian");
                                DocumentReference totalTicket =
                                    FirebaseFirestore.instance
                                        .collection("nomor")
                                        .doc("totalTicket");
                                Map<String, dynamic> noAntrian = {
                                  "noAntrian": 0
                                };
                                Map<String, dynamic> total = {"total": 0};
                                antrian.update(noAntrian);
                                totalTicket.update(total);
                              },
                              child: Text(
                                "Reset Tiket",
                                style: TextStyle(
                                    fontFamily: "PublicSans",
                                    fontWeight: FontWeight.bold),
                              ),
                              color: Color(0xFFFFF0B2),
                            ),
                          )
                        : SizedBox(),
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
                        AuthMethods().toSignOut(context);
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
