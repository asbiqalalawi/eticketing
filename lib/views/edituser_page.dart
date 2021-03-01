import 'package:flutter/material.dart';

class EditUserPage extends StatefulWidget {
  const EditUserPage({Key key}) : super(key: key);

  @override
  _EditUserPageState createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  String list;
  List droplist = [
    "Samsat Tanggamus",
    "Samsat Pringsewu",
    "Samsat Bandar Lampung"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFCE00),
        title: Text(
          "Mengubah Akun",
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
                    decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 255, 249, 224),
                        filled: true,
                        hintText: "Nama Lengkap",
                        hintStyle: TextStyle(
                            fontFamily: "PublicSans",
                            fontWeight: FontWeight.bold),
                        border: InputBorder.none),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  color: Color.fromARGB(255, 255, 249, 224),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        hintText: "Samsat/Petugas Bapenda",
                        hintStyle: TextStyle(
                            fontFamily: "PublicSans",
                            fontWeight: FontWeight.bold),
                        border: InputBorder.none),
                    value: list,
                    onChanged: (value) {
                      setState(() {
                        list = value;
                      });
                    },
                    items: droplist
                        .map((droplist) => DropdownMenuItem(
                              value: droplist,
                              child: Text(
                                "$droplist",
                                style: TextStyle(
                                    fontFamily: "PublicSans",
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 255, 249, 224),
                        filled: true,
                        hintText: "Username",
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
                        hintText: "Kata Sandi",
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
      ),
    );
  }
}
