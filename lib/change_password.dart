import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xFFFFCE00),
        title: Text(
          "Change Password",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
