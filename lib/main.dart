import 'package:eticketing/services/auth.dart';
import 'package:eticketing/views/bottom_navigation.dart';
import 'package:eticketing/views/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'services/auth.dart';
import 'views/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    RestartWidget(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // User user = Provider.of<User>(context);

    return MaterialApp(
      // theme: ThemeData(accentColor: Colors.black, primaryColor: Colors.black),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: AuthMethods().getCurrentUser(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return BottomNavigation();
          } else {
            return LoginPage();
          }
        },
      ),
      // home: (user == null) ? LoginPage() : DashboardSamsat(),
    );
  }
}
