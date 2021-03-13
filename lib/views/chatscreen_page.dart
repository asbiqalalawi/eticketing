import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String nopol;
  ChatScreen(this.nopol);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nopol),
      ),
    );
  }
}
