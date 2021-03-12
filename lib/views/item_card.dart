import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticketing/views/detail_ticket_page.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
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

  ItemCard(
      this.nopol, this.deskripsi, this.status, this.antrian, this.createdAt, this.pengirim);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailPage(nopol, deskripsi, status, antrian, createdAt, pengirim);
        }));
      },
      child: Card(
        elevation: 5,
        color: Color.fromRGBO(255, 249, 224, 1),
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                    child: Text(
                      nopol,
                      style: TextStyle(
                          fontFamily: "RedHatDisplay",
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text(
                      antrian.toString(),
                      style: TextStyle(
                          fontFamily: "PublicSans",
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                    child: Text(
                      "Samsat Origin",
                      style: TextStyle(
                        fontFamily: "PublicSans",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text(
                      createdAt.toDate().toString().substring(11, 16),
                      style: TextStyle(
                        fontFamily: "PublicSans",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  )
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    margin: EdgeInsets.fromLTRB(5, 5, 0, 50),
                    child: Text(
                      deskripsi.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "PublicSans",
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 0, 50),
                    child: Text(
                      status,
                      style: TextStyle(
                          fontFamily: "PublicSans",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  )
                ])
          ],
        ),
      ),
    );
  }
}
