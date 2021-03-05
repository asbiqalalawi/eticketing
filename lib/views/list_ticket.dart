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
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference ticket = firestore.collection('ticket');

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 206, 0, 1),
          title: Text(
            "All Ticket",
            style: TextStyle(color: Colors.black, fontFamily: "RedHatDisplay"),
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
        body: ListView(children: <Widget>[
          StreamBuilder<QuerySnapshot>(
              stream: ticket.orderBy('Antrian', descending: true).snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data.docs
                        .map((e) => ItemCard(e.data()['Nopol'],
                            e.data()['Description'], e.data()['Antrian']))
                        .toList(),
                  );
                } else {
                  return Text("Loading");
                }
              })
        ]),
      ),
    );
  }
}
