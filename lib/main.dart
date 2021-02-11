// import 'package:eticketing/bottom_navigation.dart';
// import 'package:eticketing/detail_tiket.dart';
import 'package:eticketing/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatefulWidget {
//   @override
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Bottom_Navigation(),
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
