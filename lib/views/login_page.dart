import 'package:eticketing/views/bottom_navigation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 206, 0),
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, -0.40),
            child: Container(
              // margin: EdgeInsets.fromLTRB(20, 120, 20, 320),
              width: MediaQuery.of(context).size.width * 0.92,
              height: MediaQuery.of(context).size.height * 0.38,
              color: Colors.white24,
            ),
          ),
          Container(
              alignment: Alignment(0, -0.5),
              child: Text(
                "Login",
                style: TextStyle(fontSize: 27, fontFamily: "RedHatDisplay"),
              )),
          Align(
            alignment: Alignment(0, -0.18),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.82,
              height: MediaQuery.of(context).size.height * 0.18,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Username",
                        hintStyle: TextStyle(
                            fontFamily: "PublicSans",
                            fontWeight: FontWeight.bold),
                        fillColor: Colors.white,
                        filled: true,
                        border: InputBorder.none),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                            fontFamily: "PublicSans",
                            fontWeight: FontWeight.bold),
                        fillColor: Colors.white,
                        filled: true,
                        border: InputBorder.none),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.7),
            child: Material(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 230,
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return Bottom_Navigation();
                      }));
                    },
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "PublicSans",
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
