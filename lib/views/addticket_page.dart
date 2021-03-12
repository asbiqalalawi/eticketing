import 'package:eticketing/views/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddTicketPage extends StatefulWidget {
  AddTicketPage({Key key}) : super(key: key);

  @override
  _AddTicketPageState createState() => _AddTicketPageState();
}

class _AddTicketPageState extends State<AddTicketPage> {
  String nomorPolisi, deskripsi, status = "Tersedia";

  int antrian = 1;

  getNopol(nopol) {
    this.nomorPolisi = nopol;
  }

  getDeskripsi(desk) {
    this.deskripsi = desk;
  }

  createData(int count) {
    this.antrian = count;
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("ticket").doc(nomorPolisi);

    Map<String, dynamic> tiket = {
      "nomorPolisi": nomorPolisi,
      "deskripsi": deskripsi,
      "status": status,
      "antrian": antrian,
      "createdAt": DateTime.now(),
    };
    documentReference.set(tiket);
  }

  getCounter() {
    FirebaseFirestore dbfirebase = FirebaseFirestore.instance;
    CollectionReference nomor = dbfirebase.collection('nomor');
    DocumentReference noReference =
        FirebaseFirestore.instance.collection("nomor").doc('antrian');

    Map<String, dynamic> counter = {
      "noAntrian": FieldValue.increment(1),
    };
    noReference.update(counter);
    return StreamBuilder<DocumentSnapshot>(
        stream: nomor.doc('antrian').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return createData(int.tryParse(snapshot.data.data()['noAntrian']));
          } else
            return createData(1);
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
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextField(
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
                  TextField(
                    onChanged: (String desk) {
                      getDeskripsi(desk);
                    },
                    maxLines: 14,
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
                  //Upload File
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
                    onTap: () {
                      getCounter();

                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return BottomNavigation();
                      }));
                    },
                    child: Center(
                      child: Text(
                        "Send",
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
