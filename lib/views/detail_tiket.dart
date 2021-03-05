import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticketing/views/detail_ticket_page.dart';
import 'package:flutter/material.dart';

class DetailTiket extends StatefulWidget {
  @override
  _DetailTiketState createState() => _DetailTiketState();
}

class _DetailTiketState extends State<DetailTiket> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference ticket = firestore.collection('ticket');
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_outlined,
          color: Colors.black,
        ),
        title: Text(
          "Detail",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFFFCE00),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: ticket.snapshots(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: snapshot.data.docs
                          .map((e) => DetailPage(
                              e.data()['Nopol'], e.data()['Description']))
                          .toList(),
                    );
                  } else {
                    return Text("Loading");
                  }
                })
          ],
        ),
      ),
    );
  }
}
