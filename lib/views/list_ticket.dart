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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(255, 206, 0, 1),
            title: Text(
              "All Ticket",
              style:
                  TextStyle(color: Colors.black, fontFamily: "RedHatDisplay"),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                return Navigator.pop(context);
              }),
            // actions: <Widget>[
            //   IconButton(
            //     icon: Icon(
            //       Icons.history,
            //       color: Colors.black,
            //     ),
            //     onPressed: () {},
            //   )
            // ],
          ),
          body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("ticket")
                  .orderBy('antrian', descending: false)
                  .snapshots(),
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
                            documentSnapshot["asal"],
                            documentSnapshot["gambar"],
                            documentSnapshot["takenAt"]);
                      });
                } else {
                  return Text('Loading');
                }
              })),
    );
  }
}
