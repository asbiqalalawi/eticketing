import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticketing/helper/sharedpref_helper.dart';
import 'package:eticketing/views/addticket_page.dart';
import 'package:eticketing/views/item_card.dart';
import 'package:eticketing/views/list_ticket.dart';
import 'package:eticketing/views/notification.dart';
// import 'package:eticketing/views/picket_schedule.dart';
import 'package:eticketing/views/picket_schedules.dart';
import 'package:flutter/material.dart';

class DashboardSamsat extends StatefulWidget {
  @override
  _DashboardSamsatState createState() => _DashboardSamsatState();
}

class _DashboardSamsatState extends State<DashboardSamsat> {
  String mySamsatName, myUserName, myEmail;
  String nomorPolisi, deskripsi, nameCollection;
  int newValue;

  getMyInfoFromSharedPreferences() async {
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
    mySamsatName = await SharedPreferenceHelper().getSamsatName();
  }

  void initState() {
    getMyInfoFromSharedPreferences();

    super.initState();
  }

  getCounter() {
    if (mySamsatName == "Bapenda" || mySamsatName == "Admin") {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('myTicketBapenda')
          .doc(myUserName);

      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(documentReference);
        newValue = snapshot.data()['ticket'];
        return newValue;
      });
    } else {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('myTicketSamsat')
          .doc(myUserName);

      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(documentReference);
        newValue = snapshot.data()['ticket'];
        return newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore dbfirebase = FirebaseFirestore.instance;
    CollectionReference nomor = dbfirebase.collection('nomor');
    CollectionReference bapenda = dbfirebase.collection('myTicketBapenda');
    CollectionReference samsat = dbfirebase.collection('myTicketSamsat');
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
                    return PicketSchedules();
                  }));
                }),
            IconButton(
                color: Colors.black,
                icon: Icon(Icons.add_circle_rounded),
                onPressed: () {
                  setState(() {});
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ListTicket();
                    }));
                  },
                  child: Container(
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
                          StreamBuilder<DocumentSnapshot>(
                              stream: nomor.doc("totalTicket").snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData)
                                  return Text(
                                    snapshot.data.data()['total'].toString(),
                                    style: TextStyle(
                                        fontFamily: "RedHatDisplay",
                                        color: Colors.black,
                                        fontSize: 42,
                                        fontWeight: FontWeight.bold),
                                  );
                                else {
                                  return Text("Loading");
                                }
                              }),
                        ]),
                  ),
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
                        (mySamsatName == "Bapenda" || mySamsatName == "Admin")
                            ? StreamBuilder<DocumentSnapshot>(
                                stream: bapenda.doc(myUserName).snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData)
                                    return Text(
                                      snapshot.data.data()['ticket'].toString(),
                                      style: TextStyle(
                                          fontFamily: "RedHatDisplay",
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    );
                                  else {
                                    return Text("Loading");
                                  }
                                })
                            : StreamBuilder<DocumentSnapshot>(
                                stream: samsat.doc(myUserName).snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData)
                                    return Text(
                                      snapshot.data.data()['ticket'].toString(),
                                      style: TextStyle(
                                          fontFamily: "RedHatDisplay",
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    );
                                  else {
                                    return Text("Loading");
                                  }
                                })
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
                        (mySamsatName == "Bapenda" || mySamsatName == "Admin")
                            ? StreamBuilder<DocumentSnapshot>(
                                stream: bapenda.doc(myUserName).snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData)
                                    return Text(
                                      snapshot.data
                                          .data()['onProcess']
                                          .toString(),
                                      style: TextStyle(
                                          fontFamily: "RedHatDisplay",
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    );
                                  else {
                                    return Text("Loading");
                                  }
                                })
                            : StreamBuilder<DocumentSnapshot>(
                                stream: samsat.doc(myUserName).snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData)
                                    return Text(
                                      snapshot.data
                                          .data()['onProcess']
                                          .toString(),
                                      style: TextStyle(
                                          fontFamily: "RedHatDisplay",
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    );
                                  else {
                                    return Text("Loading");
                                  }
                                })
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
                        (mySamsatName == "Bapenda" || mySamsatName == "Admin")
                            ? StreamBuilder<DocumentSnapshot>(
                                stream: bapenda.doc(myUserName).snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData)
                                    return Text(
                                      snapshot.data.data()['finish'].toString(),
                                      style: TextStyle(
                                          fontFamily: "RedHatDisplay",
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    );
                                  else {
                                    return Text("Loading");
                                  }
                                })
                            : StreamBuilder<DocumentSnapshot>(
                                stream: samsat.doc(myUserName).snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData)
                                    return Text(
                                      snapshot.data
                                          .data()['available']
                                          .toString(),
                                      style: TextStyle(
                                          fontFamily: "RedHatDisplay",
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    );
                                  else {
                                    return Text("Loading");
                                  }
                                })
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
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.95,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("ticket")
                      .orderBy('antrian' /* , descending: true */)
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
                                documentSnapshot["asalSamsat"],
                                documentSnapshot["gambar"]);
                          });
                    } else {
                      return Text('Loading');
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
