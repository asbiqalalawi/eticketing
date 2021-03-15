import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticketing/views/detail_ticket_page.dart';
import 'package:flutter/material.dart';

class Notifikasi extends StatelessWidget {
  String nopol;
  String deskripsi;
  String status;
  int antrian;
  Timestamp createdAt;
  String pengirim;
  String samsatName;
  String gambar;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 206, 0, 1),
          title: Text(
            "Notifikasi",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "RedHatDisplay",
            ),
          ),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[buildLog(context)],
          ),
        ),
      ),
    );
  }

  GestureDetector buildLog(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailPage(nopol, deskripsi, status, antrian, createdAt,
              pengirim, samsatName, gambar);
        }));
      },
      child: Card(
        color: Color.fromRGBO(255, 249, 224, 1),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Spacer(),
                Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Text(
                      "BE 3557",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "RedHatDisplay",
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                Spacer(flex: 8),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Text(
                    "11:45",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "RedHatDisplay",
                        fontSize: 12),
                  ),
                ),
                Spacer(flex: 1),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Text(
                    "18 Februari 2021",
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "RedHatDisplay",
                        fontSize: 12),
                  ),
                ),
                Spacer(flex: 1),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15, top: 10),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    "Mohon dikerjakan dengan cara seksama dan dalam tempo yang sesingkat singkatnya",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "RedHatDisplay",
                      fontSize: 12,
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15, top: 10, bottom: 5),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    "Maaf harus saya cancel karna data kurang",
                    maxLines: 2,
                    style: TextStyle(
                        fontFamily: "RedHatDisplay",
                        color: Colors.black,
                        fontSize: 12),
                  ),
                ),
                Spacer(flex: 1),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 5),
                  child: Text(
                    "Petugas : Yuan Ferdinand",
                    style: TextStyle(
                        fontFamily: "RedHatDisplay",
                        color: Colors.black,
                        fontSize: 12),
                  ),
                ),
                Spacer()
              ],
            )
          ],
        ),
      ),
    );
  }
}
