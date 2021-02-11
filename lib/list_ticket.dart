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
          title: Text(
            "All Ticket",
            style: TextStyle(color: Colors.black, fontFamily: "RedHatDisplay"),
          ),
        ),
      ),
    );
  }
}
