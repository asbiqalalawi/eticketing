import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticketing/helper/sharedpref_helper.dart';
import 'package:eticketing/services/database.dart';
import 'package:eticketing/views/dashboard.dart';
import 'package:eticketing/widgets/full_photo.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String nopol;
  final String deskripsi;
  final String status;
  final int antrian;
  final Timestamp createdAt;
  final String pengirim;
  final String originName;
  final String gambar;
  final String myUserName;
  final String myOriginName;

  //// Pointer to Update Function
  // final Function onUpdate;
  // //// Pointer to Delete Function
  // final Function onDelete;

  DetailPage(
      this.nopol,
      this.deskripsi,
      this.status,
      this.antrian,
      this.createdAt,
      this.pengirim,
      this.originName,
      this.gambar,
      this.myUserName,
      this.myOriginName);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    print(widget.status);
    print(widget.myOriginName);
    super.initState();
  }

  getChatRoomId(String nopol) {
    return "$nopol";
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
                          widget.originName,
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FullPhoto(url: widget.gambar)));
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 50),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(color: Colors.black),
                            image: DecorationImage(
                                image: NetworkImage(widget.gambar),
                                fit: BoxFit.cover))),
                  )
                ],
              ),
              //button

              Container(
                  child: (widget.status.toString() == "Tersedia" &&
                          (widget.myOriginName == "Bapenda" ||
                              widget.myOriginName == "Admin"))
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildKerjakan(context),
                          ],
                        )
                      : (widget.status.toString() == "Diproses" &&
                              (widget.myOriginName == "Bapenda" ||
                                  widget.myOriginName == "Admin"))
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                  buildBatalkan(context),
                                  buildSelesai(context)
                                ])
                          : Container(
                              alignment: Alignment(0, 0.9),
                              margin: EdgeInsets.only(top: 220),
                              child: Text(
                                "*Hanya Petugas Bapenda yang dapat ambil tiket",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontFamily: "PublicSans",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              )))
            ],
          ),
        ));
  }

  Container buildSelesai(BuildContext context) {
    return Container(
      alignment: Alignment(1, 0.9),
      margin: EdgeInsets.only(top: 220),
      child: Material(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: 110,
          height: 43,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.green),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                Map<String, dynamic> ticketSelesaiMap = {
                  "status": "Selesai",
                };

                var chatRoomId = getChatRoomId(widget.nopol);
                DatabaseMethods().deleteChat(chatRoomId);

                DatabaseMethods()
                    .updateTicketTaken(widget.nopol, ticketSelesaiMap);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
              child: Center(
                child: Text(
                  "Selesai",
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
    );
  }

  Container buildBatalkan(BuildContext context) {
    return Container(
      alignment: Alignment(1, 0.9),
      margin: EdgeInsets.only(top: 220),
      child: Material(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: 110,
          height: 43,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.red),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                Map<String, dynamic> ticketCancelMap = {
                  "status": "Tersedia",
                  "petugas": ""
                };

                var chatRoomId = getChatRoomId(widget.nopol);
                DatabaseMethods().deleteChat(chatRoomId);

                DatabaseMethods()
                    .updateTicketTaken(widget.nopol, ticketCancelMap);

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
              child: Center(
                child: Text(
                  "Batalkan",
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
    );
  }

  Container buildKerjakan(BuildContext context) {
    return Container(
      alignment: Alignment(1, 0.9),
      margin: EdgeInsets.only(top: 220),
      child: Material(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: 110,
          height: 43,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.blue),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                Map<String, dynamic> ticketTakenBapenda = {
                  "status": "Diproses",
                  "petugas": widget.myUserName
                };
                Map<String, dynamic> ticketTakenSamsat = {
                  "status": "Diproses",
                  "petugas": widget.myUserName
                };
                DatabaseMethods().updateTicketTakenMyTicketBapenda(
                    widget.myOriginName, widget.myUserName, ticketTakenBapenda);
                DatabaseMethods().updateTicketTakenMyTicketSamsat(
                    widget.pengirim, ticketTakenSamsat);
                DatabaseMethods()
                    .updateTicketTaken(widget.nopol, ticketTakenBapenda);

                var chatRoomId = getChatRoomId(widget.nopol);
                Map<String, dynamic> chatRoomInfoMap = {
                  "users": [widget.pengirim, widget.myUserName],
                  "nopol": widget.nopol,
                  "lastMessage": "Ketik Pesan disini...",
                  "antrian": widget.antrian
                };
                DatabaseMethods().createChatRoom(chatRoomId, chatRoomInfoMap);

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
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
    );
  }
}
