import 'package:flutter/material.dart';

class ChatSamsat extends StatefulWidget {
  @override
  _ChatSamsatState createState() => _ChatSamsatState();
}

class _ChatSamsatState extends State<ChatSamsat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFFFCE00),
      ),
      body: Container(
        margin: EdgeInsets.all(13),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 7, 0, 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BE 1234 EE",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: "RedHatDisplay"),
                      ),
                      Text(
                        "I have som question about...",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontFamily: "PublicSans",
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.navigate_next,
                    size: 30,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 7, 0, 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BE 1234 EE",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: "RedHatDisplay"),
                      ),
                      Text(
                        "I have som question about...",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontFamily: "PublicSans",
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.navigate_next,
                    size: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
