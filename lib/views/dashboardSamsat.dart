import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticketing/views/addticket_page.dart';
import 'package:eticketing/views/item_card.dart';
import 'package:eticketing/views/list_ticket.dart';
import 'package:eticketing/views/notification.dart';
import 'package:eticketing/views/picket_schedule.dart';
import 'package:flutter/material.dart';

class DashboardSamsat extends StatefulWidget {
  @override
  _DashboardSamsatState createState() => _DashboardSamsatState();
}

class _DashboardSamsatState extends State<DashboardSamsat> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference ticket = firestore.collection('ticket');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Dashboard",
            style: TextStyle(fontFamily: "RedHatDisplay", color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
                color: Colors.black,
                icon: Icon(Icons.notifications),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Notifikasi();
                  }));
                }),
            IconButton(
                color: Colors.black,
                icon: Icon(Icons.calendar_today_sharp),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PicketSchedule();
                  }));
                }),
            IconButton(
                color: Colors.black,
                icon: Icon(Icons.add_circle_rounded),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AddTicketPage();
                  }));
                }),
          ],
          backgroundColor: Color.fromRGBO(255, 206, 0, 1),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: Stack(children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.15,
                  color: Color.fromRGBO(255, 249, 224, 1),
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 8),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Total Ticket",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontFamily: "RedHatDisplay",
                                color: Color.fromRGBO(157, 153, 135, 1),
                                fontSize: 30)),
                        Text(
                          "21",
                          style: TextStyle(
                              fontFamily: "RedHatDisplay",
                              color: Colors.black,
                              fontSize: 42,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                ),
              ]),
            ),
            Row(
              children: <Widget>[
                Flexible(
                    child: Container(
                  color: Color.fromRGBO(255, 249, 224, 1),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.12,
                  margin: EdgeInsets.fromLTRB(3, 0, 10, 15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "My Ticket",
                          style: TextStyle(
                              fontFamily: "RedHatDisplay",
                              color: Color.fromRGBO(157, 153, 135, 1),
                              fontSize: 17),
                        ),
                        Text(
                          "3",
                          style: TextStyle(
                              fontFamily: "RedHatDisplay",
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                )),
                Flexible(
                    child: Container(
                  color: Color.fromRGBO(255, 249, 224, 1),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.12,
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "On Process",
                          style: TextStyle(
                              fontFamily: "RedHatDisplay",
                              color: Color.fromRGBO(157, 153, 135, 1),
                              fontSize: 17),
                        ),
                        Text(
                          "14",
                          style: TextStyle(
                              fontFamily: "RedHatDisplay",
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                )),
                Flexible(
                    child: Container(
                  color: Color.fromRGBO(255, 249, 224, 1),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.12,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Available",
                          style: TextStyle(
                              fontFamily: "RedHatDisplay",
                              color: Color.fromRGBO(157, 153, 135, 1),
                              fontSize: 17),
                        ),
                        Text(
                          "7",
                          style: TextStyle(
                              fontFamily: "RedHatDisplay",
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 18, top: 23, right: 200),
                  child: Text(
                    "Ticket",
                    style: TextStyle(
                        fontFamily: "RedHatDisplay",
                        fontSize: 22,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ListTicket();
                    }));
                  },
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(bottom: 18, top: 23),
                    child: Text(
                      "Show All",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "RedHatDisplay",
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width * 0.95,
              child: ListView(children: <Widget>[
                StreamBuilder<QuerySnapshot>(
                    stream: ticket.snapshots(),
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
            )
          ],
        ),
      ),
    );
  }
}
