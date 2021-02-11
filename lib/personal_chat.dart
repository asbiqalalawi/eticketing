import 'package:flutter/material.dart';

class PersonalChat extends StatefulWidget {
  @override
  _PersonalChatState createState() => _PersonalChatState();
}

class _PersonalChatState extends State<PersonalChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFCE00),
        leading: Icon(
          Icons.arrow_back_outlined,
          color: Colors.black,
        ),
        title: Text(
          "Back",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(),
    );
  }
}
