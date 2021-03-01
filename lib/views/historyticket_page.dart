import 'package:flutter/material.dart';

class HistoryTicketPage extends StatefulWidget {
  HistoryTicketPage({Key key}) : super(key: key);

  @override
  _HistoryTicketPAgeState createState() => _HistoryTicketPAgeState();
}

class _HistoryTicketPAgeState extends State<HistoryTicketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 206, 0, 1),
        title: Text(
          "Log Tiket",
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
            margin: EdgeInsets.fromLTRB(10, 70, 10, 0),
            child: ListView(
              children: [
                Card(
                    elevation: 5,
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    // margin: EdgeInsets.only(top: 20, left: 20),
                                    child: Text("BE 3212 NR",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "RedHatDisplay",
                                            fontSize: 15)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5, left: 20),
                                    child: Text("Samsat Pringsewu",
                                        style: TextStyle(
                                            fontFamily: "RedHatDisplay",
                                            fontSize: 15)),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    child: Text(
                                      "Masuk : ",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "RedHatDisplay"),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Diambil : ",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "RedHatDisplay"),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Selesai : ",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "RedHatDisplay"),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    child: Text(
                                      "10.12  ",
                                      style: TextStyle(
                                          fontFamily: "RedHatDisplay"),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "14.45  ",
                                        style: TextStyle(
                                            fontFamily: "RedHatDisplay"),
                                      )),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text(
                                      "14.45  ",
                                      style:
                                          TextStyle(fontFamily: "RedHatDislay"),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 20, right: 20),
                                    child: Text(
                                      "1 Februari 2021",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "RedHatDisplay"),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5, right: 20),
                                    child: Text(
                                      "1 Februari 2021",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "RedHatDisplay"),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5, right: 20),
                                    child: Text(
                                      "2 Februari 2021",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "RedHatDisplay"),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 20, left: 20),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Pesan laporan",
                                style: TextStyle(
                                    fontFamily: "RedHatDisplay",
                                    color: Colors.grey),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 20, left: 20),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Pesan laporan",
                                style: TextStyle(fontFamily: "RedHatDisplay"),
                              )),
                          Container(
                              margin: EdgeInsets.only(
                                  top: 20, right: 20, bottom: 20),
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "Petugas : Asbiq Al Alawi",
                                style: TextStyle(fontFamily: "RedHatDisplay"),
                              )),
                        ],
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}