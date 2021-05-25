import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticketing/views/history_card.dart';
import 'package:flutter/material.dart';

class HistoryTicketPage extends StatefulWidget {
  HistoryTicketPage({Key key}) : super(key: key);

  @override
  _HistoryTicketPAgeState createState() => _HistoryTicketPAgeState();
}

class _HistoryTicketPAgeState extends State<HistoryTicketPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 206, 0, 1),
        title: Text(
          "Riwayat Tiket",
          style: TextStyle(fontFamily: "RedHatDisplay", color: Colors.black),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.print), color: Colors.black, onPressed: () {})
        ],
      ),
      body: Stack(
        children: [
          Card(
            elevation: 5,
            margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                  )),
                  Icon(
                    Icons.filter_list,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
          Container(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("history")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot documentSnapshot =
                              snapshot.data.docs[index];
                          return HistoryCard(
                              documentSnapshot["description"],
                              documentSnapshot["nopol"],
                              documentSnapshot["note"],
                              documentSnapshot["originName"],
                              documentSnapshot["doneAt"],
                              documentSnapshot["takenAt"],
                              documentSnapshot["ticketIn"],
                              documentSnapshot["petugas"]);
                        });
                  } else {
                    return Center(
                        child: Text(
                      'Loading',
                      style:
                          TextStyle(fontFamily: "RedHatDisplay", fontSize: 15),
                    ));
                  }
                }),
          )
        ],
      ),
    );
  }
}
