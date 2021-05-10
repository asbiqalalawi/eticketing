import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticketing/services/database.dart';
import 'package:eticketing/widgets/full_photo.dart';
import 'package:flutter/material.dart';

import '../helper/sharedpref_helper.dart';

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
  final Timestamp takenAt;

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
      this.myOriginName,
      this.takenAt);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String note, myUserName, myEmail, myOriginName;
  var petugas = [];

  var defImage = AssetImage("assets/kosong.png");

  getMyInfoFromSharedPreferences() async {
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
    myOriginName = await SharedPreferenceHelper().getOriginName();
    setState(() {});
  }

  void initState() {
    getMyInfoFromSharedPreferences();
    super.initState();
  }

  getChatRoomId(String nopol) {
    return "$nopol";
  }

  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "Detail",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0xFFFFCE00),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                return Navigator.pop(context);
              }),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          margin: EdgeInsets.all(10),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
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
                            widget.createdAt
                                .toDate()
                                .toString()
                                .substring(0, 16),
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
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
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
                                  image: (widget.gambar == null)
                                      ? defImage
                                      : NetworkImage(widget.gambar),
                                  fit: BoxFit.cover))),
                    )
                  ],
                ),
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
              onTap: () async {
                print('XXXXXXXXXXXX');
                print(petugas);
                await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      title: Text('Catatan'),
                      content: TextField(
                        controller: noteController,
                        textInputAction: TextInputAction.done,
                      ),
                      actions: [
                        // TextButton(
                        //   onPressed: () {

                        //     Navigator.pop(context);
                        //     //
                        //   },
                        //   child: Text(
                        //     'Batal',
                        //     style: TextStyle(
                        //         color: Colors.blue,
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        TextButton(
                          onPressed: () {
                            note = noteController.text;
                            noteController.text = '';
                            Navigator.pop(context);
                            //
                          },
                          child: Text(
                            'Selesai',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  },
                );

                ///
                Map<String, dynamic> ticketSelesaiMap = {
                  "status": "Selesai",
                };

                var chatRoomId = getChatRoomId(widget.nopol);
                DatabaseMethods().deleteChat(chatRoomId);

                DatabaseMethods()
                    .updateTicketTaken(widget.nopol, ticketSelesaiMap);
                DatabaseMethods().updateFinishMyTicketBapenda(myEmail);
                DatabaseMethods().updateFinishMyTicketSamsat(widget.pengirim);

                // petugas.add(widget.myUserName);

                Map<String, dynamic> historydoneMap = {
                  "nopol": widget.nopol,
                  "originName": widget.originName,
                  "ticketIn": widget.createdAt,
                  "takenAt": widget.takenAt,
                  "doneAt": DateTime.now(),
                  "description": widget.deskripsi,
                  'petugas': myEmail,
                  "note": note
                };

//                 var washingtonRef = FirebaseFirestore.instance
//                     .collection('history')
//                     .doc(widget.nopol);

// // Atomically add a new region to the "regions" array field.
//                 var arrUnion = washingtonRef.update({
//                   // "petugas": admin.firestore.FieldValue.arrayUnion('greater_virginia')
//                   'petugas': FieldValue.arrayUnion([]),
//                 });

                DatabaseMethods().updatehistory(widget.nopol, historydoneMap);

                DatabaseMethods().deleteTicket(widget.nopol);

                Navigator.pop(context);
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
                  "petugas": " "
                };

                var chatRoomId = getChatRoomId(widget.nopol);
                DatabaseMethods().deleteChat(chatRoomId);

                DatabaseMethods()
                    .updateTicketTaken(widget.nopol, ticketCancelMap);
                DatabaseMethods().updateCancelMyTicketSamsat(widget.pengirim);
                DatabaseMethods().updateCancelMyTicketBapenda(myEmail);

                Map<String, dynamic> historycanceledMap = {
                  "nopol": widget.nopol,
                  "originName": widget.originName,
                  "ticketIn": widget.createdAt,
                  "takenAt": widget.takenAt,
                  "description": widget.deskripsi,
                  "petugas": myEmail
                };
                DatabaseMethods()
                    .createHistory(widget.nopol, historycanceledMap);

                Navigator.pop(context);
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
                Map<String, dynamic> ticketTaken = {
                  "status": "Diproses",
                  "petugas": myEmail,
                  "takenAt": DateTime.now(),
                };
                DatabaseMethods().updateTicketTaken(widget.nopol, ticketTaken);
                DatabaseMethods()
                    .updateMyTicketBapenda(widget.myOriginName, myEmail);
                DatabaseMethods().updateMyTicketSamsat(widget.pengirim);

                var chatRoomId = getChatRoomId(widget.nopol);
                Map<String, dynamic> chatRoomInfoMap = {
                  "users": [widget.pengirim, myEmail],
                  "nopol": widget.nopol,
                  "lastMessage": "Ketik Pesan disini...",
                  "antrian": widget.antrian
                };
                DatabaseMethods().createChatRoom(chatRoomId, chatRoomInfoMap);

                Navigator.pop(context);
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
