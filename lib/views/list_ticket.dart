import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticketing/views/item_card.dart';
import 'package:flutter/material.dart';

class ListTicket extends StatefulWidget {
  @override
  _ListTicketState createState() => _ListTicketState();
}

class _ListTicketState extends State<ListTicket> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(255, 206, 0, 1),
            title: Text(
              "All Ticket",
              style:
                  TextStyle(color: Colors.black, fontFamily: "RedHatDisplay"),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.history,
                  color: Colors.black,
                ),
                onPressed: () {},
              )
            ],
          ),
          body: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("ticket").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data.docs[index];
                        return ItemCard(
                            documentSnapshot["nomorPolisi"],
                            documentSnapshot["deskripsi"],
                            documentSnapshot["status"],
                            documentSnapshot["antrian"],
                            documentSnapshot["createdAt"],
                            documentSnapshot["pengirim"],
                            documentSnapshot["asalSamsat"],
                            documentSnapshot["gambar"]);
                      });
                } else {
                  return Text('Loading');
                }
              })),
    );
  }
}
