import 'package:eticketing/views/detail_tiket.dart';
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
            style: TextStyle(color: Colors.black, fontFamily: "RedHatDisplay"),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.history,
                color: Colors.black,
              ), onPressed: () {  },
            )
          ],
        ),
        body: ListView(children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailTiket();
              }));
            },
            child: Card(
              elevation: 5,
              color: Color.fromRGBO(255, 249, 224, 1),
              child: Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                          child: Text(
                            "BE 3557 AN",
                            style: TextStyle(
                                fontFamily: "RedHatDisplay",
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            "1",
                            style: TextStyle(
                                fontFamily: "PublicSans",
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                          child: Text(
                            "Samsat Origin",
                            style: TextStyle(
                              fontFamily: "PublicSans",
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            "12:53",
                            style: TextStyle(
                              fontFamily: "PublicSans",
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        )
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 50),
                          child: Text(
                            "Description of the ticket",
                            style: TextStyle(
                              fontFamily: "PublicSans",
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 50),
                          child: Text(
                            "Sedang dikerjakan",
                            style: TextStyle(
                                fontFamily: "PublicSans",
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        )
                      ])
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailTiket();
              }));
            },
            child: Card(
              elevation: 5,
              color: Color.fromRGBO(255, 249, 224, 1),
              child: Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                          child: Text(
                            "BE 1234 AH",
                            style: TextStyle(
                                fontFamily: "RedHatDisplay",
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            "1",
                            style: TextStyle(
                                fontFamily: "PublicSans",
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                          child: Text(
                            "Samsat Origin",
                            style: TextStyle(
                              fontFamily: "PublicSans",
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            "12:53",
                            style: TextStyle(
                              fontFamily: "PublicSans",
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 50),
                          child: Text(
                            "Description of the ticket",
                            style: TextStyle(
                              fontFamily: "PublicSans",
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 50),
                          child: Text(
                            "Sedang dikerjakan",
                            style: TextStyle(
                                fontFamily: "PublicSans",
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        )
                      ])
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailTiket();
              }));
            },
            child: Card(
              elevation: 5,
              color: Color.fromRGBO(255, 249, 224, 1),
              child: Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                          child: Text(
                            "BE 4321 OH",
                            style: TextStyle(
                                fontFamily: "RedHatDisplay",
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            "1",
                            style: TextStyle(
                                fontFamily: "PublicSans",
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                          child: Text(
                            "Samsat Origin",
                            style: TextStyle(
                              fontFamily: "PublicSans",
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            "12:53",
                            style: TextStyle(
                              fontFamily: "PublicSans",
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 50),
                          child: Text(
                            "Description of the ticket",
                            style: TextStyle(
                              fontFamily: "PublicSans",
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 50),
                          child: Text(
                            "Sedang dikerjakan",
                            style: TextStyle(
                                fontFamily: "PublicSans",
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        )
                      ])
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailTiket();
              }));
            },
            child: Card(
              elevation: 5,
              color: Color.fromRGBO(255, 249, 224, 1),
              child: Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                          child: Text(
                            "BE 6969 AN",
                            style: TextStyle(
                                fontFamily: "RedHatDisplay",
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            "1",
                            style: TextStyle(
                                fontFamily: "PublicSans",
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                          child: Text(
                            "Samsat Origin",
                            style: TextStyle(
                              fontFamily: "PublicSans",
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            "12:53",
                            style: TextStyle(
                              fontFamily: "PublicSans",
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 50),
                          child: Text(
                            "Description of the ticket",
                            style: TextStyle(
                              fontFamily: "PublicSans",
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 50),
                          child: Text(
                            "Sedang dikerjakan",
                            style: TextStyle(
                                fontFamily: "PublicSans",
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        )
                      ])
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailTiket();
              }));
            },
            child: Card(
              elevation: 5,
              color: Color.fromRGBO(255, 249, 224, 1),
              child: Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                          child: Text(
                            "BE 2314 AH",
                            style: TextStyle(
                                fontFamily: "RedHatDisplay",
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            "1",
                            style: TextStyle(
                                fontFamily: "PublicSans",
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                          child: Text(
                            "Samsat Origin",
                            style: TextStyle(
                              fontFamily: "PublicSans",
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            "12:53",
                            style: TextStyle(
                              fontFamily: "PublicSans",
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 50),
                          child: Text(
                            "Description of the ticket",
                            style: TextStyle(
                              fontFamily: "PublicSans",
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 50),
                          child: Text(
                            "Sedang dikerjakan",
                            style: TextStyle(
                                fontFamily: "PublicSans",
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        )
                      ])
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailTiket();
              }));
            },
            child: Card(
              elevation: 5,
              color: Color.fromRGBO(255, 249, 224, 1),
              child: Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                          child: Text(
                            "BE 7029 VQ",
                            style: TextStyle(
                                fontFamily: "RedHatDisplay",
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            "1",
                            style: TextStyle(
                                fontFamily: "PublicSans",
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                          child: Text(
                            "Samsat Origin",
                            style: TextStyle(
                              fontFamily: "PublicSans",
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            "12:53",
                            style: TextStyle(
                              fontFamily: "PublicSans",
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 50),
                          child: Text(
                            "Description of the ticket",
                            style: TextStyle(
                              fontFamily: "PublicSans",
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 50),
                          child: Text(
                            "Sedang dikerjakan",
                            style: TextStyle(
                                fontFamily: "PublicSans",
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        )
                      ])
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
