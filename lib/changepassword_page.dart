import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFFCE00),
          title: Text(
            "Ubah Kata Sandi",
            style: TextStyle(color: Colors.black, fontFamily: "RedHatDisplay"),
          ),
        ),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 255, 249, 224),
                          filled: true,
                          hintText: "Kata Sandi Lama",
                          hintStyle: TextStyle(
                              fontFamily: "PublicSans",
                              fontWeight: FontWeight.bold),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 255, 249, 224),
                          filled: true,
                          hintText: "Kata Sandi Baru",
                          hintStyle: TextStyle(
                              fontFamily: "PublicSans",
                              fontWeight: FontWeight.bold),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 255, 249, 224),
                          filled: true,
                          hintText: "Konfirmasi Kata Sandi",
                          hintStyle: TextStyle(
                              fontFamily: "PublicSans",
                              fontWeight: FontWeight.bold),
                          border: InputBorder.none),
                    ),
                  ),
                ],
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
                      onTap: () {},
                      child: Center(
                        child: Text(
                          "Simpan",
                          style: TextStyle(
                              fontFamily: "PublicSans",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
