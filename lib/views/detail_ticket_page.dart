import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticketing/helper/sharedpref_helper.dart';
import 'package:eticketing/services/database.dart';
import 'package:eticketing/views/dashboardSamsat.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String nopol;
  final String deskripsi;
  final String status;
  final int antrian;
  final Timestamp createdAt;
  final String pengirim;
  //// Pointer to Update Function
  // final Function onUpdate;
  // //// Pointer to Delete Function
  // final Function onDelete;

  DetailPage(this.nopol, this.deskripsi, this.status, this.antrian,
      this.createdAt, this.pengirim);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String mySamsatName, myUserName, myEmail;

  getMyInfoFromSharedPreferences() async {
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
    mySamsatName = await SharedPreferenceHelper().getSamsatName();
  }

  getChatRoomId(String nopol) {
    return "$nopol";
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
          title: Text(
            "Detail",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0xFFFFCE00),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          margin: EdgeInsets.all(10),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      children: [
                        Text(
                          "Samsat Tanggamus",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 25),
                    child: Row(
                      children: [
                        Text(
                          widget.createdAt.toDate().toString().substring(0, 16),
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      children: [
                        Text(
                          "Nopol",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.nopol.toString(),
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          widget.status,
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Text(
                              widget.deskripsi,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //button
              Container(
                alignment: Alignment(1, 0.9),
                margin: EdgeInsets.only(top: 220),
                child: Material(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 110,
                    height: 43,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          Map<String, dynamic> ticketTakenMap = {
                            "status": "Diproses",
                            "petugas": myUserName
                          };
                          DatabaseMethods()
                              .updateTicketTaken(widget.nopol, ticketTakenMap);

                          var chatRoomId = getChatRoomId(widget.nopol);
                          Map<String, dynamic> chatRoomInfoMap = {
                            "users": [widget.pengirim, myUserName],
                            "nopol": widget.nopol
                          };
                          DatabaseMethods()
                              .createChatRoom(chatRoomId, chatRoomInfoMap);

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashboardSamsat()));
                        },
                        child: Center(
                          child: Text(
                            "Kerjakan",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "PublicSans",
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
