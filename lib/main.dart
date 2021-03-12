import 'package:eticketing/views/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'views/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // User user = Provider.of<User>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      // home: (user == null) ? LoginPage() : DashboardSamsat(),
    );
  }
}
