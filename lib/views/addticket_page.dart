import 'dart:io';

import 'package:eticketing/helper/sharedpref_helper.dart';
import 'package:eticketing/services/database.dart';
import 'package:eticketing/views/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class AddTicketPage extends StatefulWidget {
  AddTicketPage({Key key}) : super(key: key);

  @override
  _AddTicketPageState createState() => _AddTicketPageState();
}

class _AddTicketPageState extends State<AddTicketPage> {
  String nomorPolisi, deskripsi, status = "Tersedia";
  String myOriginName, myUserName, myEmail;
  String imagePath;
  var imageDir;

  int antrian = 1;
  @override
  void initState() {
    getMyInfoFromSharedPreferences();
    super.initState();
  }

  getMyInfoFromSharedPreferences() async {
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
    myOriginName = await SharedPreferenceHelper().getOriginName();
  }

  getNopol(nopol) {
    this.nomorPolisi = nopol;
  }

  getDeskripsi(desk) {
    this.deskripsi = desk;
  }

  Future<File> getImage() async {
    var imageFile;
    final picker = ImagePicker();
    PickedFile pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      return imageDir = imageFile;
    } else {
      return imageDir = imageFile;
    }
  }

  createData(angka) {
    this.antrian = angka;
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("ticket").doc(nomorPolisi);
    DocumentReference jumlahReference =
        FirebaseFirestore.instance.collection("nomor").doc('totalTicket');

    Map<String, dynamic> tiket = {
      "nomorPolisi": nomorPolisi,
      "deskripsi": deskripsi,
      "status": status,
      "antrian": antrian,
      "createdAt": DateTime.now(),
      "pengirim": myUserName,
      "asal": myOriginName,
      "gambar": imagePath,
    };

    Map<String, dynamic> total = {
      "total": antrian,
    };
    jumlahReference.update(total);
    documentReference.set(tiket);
  }

  getTotalMyTicket(myUserName, myOriginName) {
    if (myOriginName == "Bapenda" || myOriginName == "Admin") {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('myTicketBapenda')
          .doc(myUserName);
      Map<String, dynamic> total = {
        "totalTicket": FieldValue.increment(1),
        "lastUpdate": DateTime.now(),
        "available": FieldValue.increment(1),
      };
      documentReference.update(total);
    } else {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('myTicketSamsat')
          .doc(myUserName);
      Map<String, dynamic> total = {
        "totalTicket": FieldValue.increment(1),
        "lastUpdate": DateTime.now(),
        "available": FieldValue.increment(1),
      };
      documentReference.update(total);
    }
  }

  getCounter() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('nomor').doc('antrian');

    return FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      int newValue = snapshot.data()['noAntrian'] + 1;
      transaction.update(documentReference, {'noAntrian': newValue});
      return createData(newValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 206, 0),
        title: Text(
          "Add ticket",
          style: TextStyle(fontFamily: "RedHatDisplay", color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, -0.85),
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
              width: MediaQuery.of(context).size.width * 0.95,
              // height: MediaQuery.of(context).size.height * 0.50,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      onChanged: (String nopol) {
                        getNopol(nopol);
                      },
                      decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 255, 249, 224),
                          filled: true,
                          hintText: "Nopol",
                          hintStyle: TextStyle(
                              fontFamily: "PublicSans",
                              fontWeight: FontWeight.bold),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      onChanged: (String desk) {
                        getDeskripsi(desk);
                      },
                      maxLines: 12,
                      decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 255, 249, 224),
                          filled: true,
                          hintText: "Description",
                          hintStyle: TextStyle(
                            fontFamily: "PublicSans",
                            fontWeight: FontWeight.bold,
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 13),
                      alignment: Alignment.centerLeft,
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.95,
                      color: Color.fromARGB(255, 255, 249, 224),
                      margin: EdgeInsets.only(bottom: 10),
                      child: (imageDir == null)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Upload file",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "PublicSans",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17)),
                                IconButton(
                                    icon: Icon(Icons.upload_file),
                                    onPressed: () {
                                      getImage();
                                    })
                              ],
                            )
                          : Text(
                              imageDir.toString(),
                              style: TextStyle(
                                  fontFamily: "PublicSans",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            )),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.7),
            child: Material(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 230,
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () async {
                      if (imageDir != null) {
                        imagePath = await DatabaseMethods.uploadImage(imageDir);
                      }
                      getCounter();
                      getTotalMyTicket(myUserName, myOriginName);

                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return BottomNavigation();
                      }));
                    },
                    child: Center(
                      child: Text(
                        "Kirim",
                        style: TextStyle(
                            fontFamily: "PublicSans",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
