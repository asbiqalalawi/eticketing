import 'package:flutter/material.dart';

class PicketSchedule extends StatefulWidget {
  @override
  _PicketScheduleState createState() => _PicketScheduleState();
}

class _PicketScheduleState extends State<PicketSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: Text(
          "Picket Schedule",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFFFCE00),
      ),
      body: Center(),
    );
  }
}
