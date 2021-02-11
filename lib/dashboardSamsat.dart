import 'package:flutter/material.dart';

class DashboardSamsat extends StatefulWidget {
  @override
  _DashboardSamsatState createState() => _DashboardSamsatState();
}

class _DashboardSamsatState extends State<DashboardSamsat> {
  @override
  Widget build(BuildContext context) {
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
                onPressed: () {}),
            IconButton(
                color: Colors.black,
                icon: Icon(Icons.calendar_today_sharp),
                onPressed: () {}),
            IconButton(
                color: Colors.black,
                icon: Icon(Icons.add_circle_rounded),
                onPressed: () {}),
          ],
          backgroundColor: Color.fromRGBO(255, 206, 0, 1),
        ),
        body: Stack(children: <Widget>[
          Column(
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
                                  fontSize: 36)),
                          Text(
                            "21",
                            style: TextStyle(
                                fontFamily: "RedHatDisplay",
                                color: Colors.black,
                                fontSize: 48,
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
                    margin: EdgeInsets.fromLTRB(11, 0, 3, 5),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "On Process",
                            style: TextStyle(
                                fontFamily: "RedHatDisplay",
                                color: Color.fromRGBO(157, 153, 135, 1),
                                fontSize: 23),
                          ),
                          Text(
                            "14",
                            style: TextStyle(
                                fontFamily: "RedHatDisplay",
                                color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  )),
                  Flexible(
                      child: Container(
                    color: Color.fromRGBO(255, 249, 224, 1),
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.12,
                    margin: EdgeInsets.fromLTRB(3, 0, 11, 5),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Available",
                            style: TextStyle(
                                fontFamily: "RedHatDisplay",
                                color: Color.fromRGBO(157, 153, 135, 1),
                                fontSize: 23),
                          ),
                          Text(
                            "7",
                            style: TextStyle(
                                fontFamily: "RedHatDisplay",
                                color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  )),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(11, 23, 230, 18),
                    child: Text(
                      "Ticket",
                      style: TextStyle(
                          fontFamily: "RedHatDisplay",
                          fontSize: 22,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  RaisedButton(
                    color: Color.fromRGBO(255, 249, 224, 1),
                    onPressed: () {},
                    child: Text(
                      "Show All",
                      style: TextStyle(
                          fontFamily: "PublicSans",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.95,
                child: ListView(children: <Widget>[
                  Card(
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
                                  "Unprocessed",
                                  style: TextStyle(
                                      fontFamily: "PublicSans",
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
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
                            ])
                      ],
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(19)),
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
                                    "Nomor Polisi",
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
                                    "Unprocessed",
                                    style: TextStyle(
                                        fontFamily: "PublicSans",
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
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
                              ])
                        ],
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),

          //bagian lain
          //bagian
        ]),
      ),
    );
  }
}
