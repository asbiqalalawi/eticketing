import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticketing/helper/sharedpref_helper.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatefulWidget {
  final String description;
  final String nopol;
  final String note;
  final String originName;
  final Timestamp doneAt;
  final Timestamp takenAt;
  final Timestamp ticketIn;
  final String petugas;

  //// Pointer to Update Function
  // final Function onUpdate;
  // //// Pointer to Delete Function
  // final Function onDelete;

  HistoryCard(this.description, this.nopol, this.note, this.originName,
      this.doneAt, this.takenAt, this.ticketIn, this.petugas);

  @override
  _HistoryCardState createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(widget.nopol,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "RedHatDisplay",
                                fontSize: 15)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, left: 10),
                        child: Text(widget.originName,
                            style: TextStyle(
                                fontFamily: "RedHatDisplay", fontSize: 15)),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 5),
                        child: Text(
                          "In : ",
                          style: TextStyle(
                              color: Colors.grey, fontFamily: "RedHatDisplay"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, left: 5),
                        child: Text(
                          "Take : ",
                          style: TextStyle(
                              color: Colors.grey, fontFamily: "RedHatDisplay"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, left: 5),
                        child: Text(
                          "Done : ",
                          style: TextStyle(
                              color: Colors.grey, fontFamily: "RedHatDisplay"),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              widget.ticketIn
                                      .toDate()
                                      .toString()
                                      .substring(11, 16) +
                                  ", ",
                              style: TextStyle(fontFamily: "RedHatDisplay"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20, right: 10),
                            child: Text(
                              widget.ticketIn
                                  .toDate()
                                  .toString()
                                  .substring(0, 11),
                              style: TextStyle(fontFamily: "RedHatDisplay"),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                widget.takenAt
                                        .toDate()
                                        .toString()
                                        .substring(11, 16) +
                                    ", ",
                                style: TextStyle(fontFamily: "RedHatDisplay"),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 5, right: 10),
                              child: Text(
                                widget.takenAt
                                    .toDate()
                                    .toString()
                                    .substring(0, 11),
                                style: TextStyle(fontFamily: "RedHatDisplay"),
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              widget.doneAt
                                      .toDate()
                                      .toString()
                                      .substring(11, 16) +
                                  ", ",
                              style: TextStyle(fontFamily: "RedHatDislay"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5, right: 10),
                            child: Text(
                              widget.doneAt
                                  .toDate()
                                  .toString()
                                  .substring(0, 11),
                              style: TextStyle(fontFamily: "RedHatDislay"),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 20, left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.description,
                    style: TextStyle(
                        fontFamily: "RedHatDisplay", color: Colors.grey),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 20, left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.note,
                    style: TextStyle(fontFamily: "RedHatDisplay"),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 20, right: 20, bottom: 20),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Petugas : " + widget.petugas,
                    style: TextStyle(fontFamily: "RedHatDisplay"),
                  )),
            ],
          ),
        ));
  }
}
