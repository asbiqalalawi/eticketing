import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticketing/views/adduser_page.dart';
import 'package:eticketing/views/edituser_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HistoryTicket extends StatefulWidget {
  HistoryTicket({Key key}) : super(key: key);

  @override
  _HistoryTicketState createState() => _HistoryTicketState();
}

class _HistoryTicketState extends State<HistoryTicket> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference _users = firestore.collection('users');
    final FirebaseAuth _auth = FirebaseAuth.instance;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 206, 0, 1),
          title: Text(
            "History Ticket",
            style: TextStyle(color: Colors.black, fontFamily: "RedHatDisplay"),
          ),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                return Navigator.pop(context);
              }),
          actions: [
            IconButton(
                icon: Icon(Icons.person_add),
                color: Colors.black,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AddUserPage();
                  }));
                })
          ],
        ),
        body: Stack(
          children: <Widget>[
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
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                      // controller: searchController,
                      onChanged: (val) {
                        // initiateSearch(val);
                        // searchController.text = val;
                      },
                      decoration: InputDecoration(border: InputBorder.none),
                    ))
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 70, 10, 0),
              child: ListView(
                children: <Widget>[
                  StreamBuilder<QuerySnapshot>(
                    stream: _users
                        // .where('name', arrayContains: searchController.text)
                        .orderBy('name', descending: false)
                        .snapshots(),
                    builder: (_, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Center(child: CircularProgressIndicator());
                        return Container();
                      } else {
                        if (snapshot.hasData) {
                          return Column(
                            children: snapshot.data.docs.map((e) {
                              return Card(
                                elevation: 5,
                                child: Column(
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.only(left: 20, top: 20),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          e.data()['name'].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "RedHatDisplay"),
                                        )),
                                    Container(
                                      margin: EdgeInsets.only(left: 20, top: 5),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        e.data()['originName'].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontFamily: "RedHatDisplay"),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, top: 20),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Email:  " +
                                            e.data()['email'].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey,
                                            fontFamily: "RedHatDisplay"),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(20, 5, 20, 20),
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Text(
                                            "Kata sandi : *****...",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey,
                                                fontFamily: "RedHatDisplay"),
                                          ),
                                          Spacer(),
                                          Row(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 5),
                                                child: Material(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  child: Container(
                                                    width: 70,
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: Colors.black),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      child: InkWell(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            return EditUserPage(
                                                              name: e.data()[
                                                                  'name'],
                                                              originName: e
                                                                      .data()[
                                                                  'originName'],
                                                              email: e.data()[
                                                                  'email'],
                                                              uid: e.id,
                                                            );
                                                          }));
                                                        },
                                                        child: Center(
                                                          child: Text(
                                                            "Edit",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    "RedHatDisplay",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Material(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Container(
                                                  width: 70,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.black),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      onTap: () async {
                                                        await showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return AlertDialog(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                title: Text(
                                                                    'Hapus akun'),
                                                                content: Text(e
                                                                        .data()[
                                                                    'name']),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      print(_auth
                                                                          .currentUser);
                                                                      Navigator.pop(
                                                                          context);
                                                                      //
                                                                    },
                                                                    child: Text(
                                                                      'Batal',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .blue,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),

                                                                  ///button delete user
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      _users
                                                                          .doc(e
                                                                              .id)
                                                                          .delete();
                                                                      _auth
                                                                          .currentUser
                                                                          .delete();

                                                                      Navigator.pop(
                                                                          context);

                                                                      //
                                                                    },
                                                                    child: Text(
                                                                      'Ya',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .blue,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            });
                                                      },
                                                      child: Center(
                                                        child: Text(
                                                          "Delete",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  "RedHatDisplay",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          );
                        } else {
                          return Container();
                        }
                      }
                    },
                  ),
                  /* SizedBox(height: 20),
                  GridView.count(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      primary: false,
                      shrinkWrap: true,
                      children: tempSearchStore.map((element) {
                        return buildResultCard(element);
                      }).toList()) */
                ],
              ),
            ),
          ],
        ));
  }
}
