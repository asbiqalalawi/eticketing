import 'package:flutter/material.dart';

class AddTicketPage extends StatelessWidget {
  const AddTicketPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 206, 0),
        title: Text(
          "Add ticket",
          style: TextStyle(fontFamily: "RedHatDisplay", color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, -0.85),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.42,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextField(
                    decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 255, 249, 224),
                        filled: true,
                        hintText: "Nopol",
                        hintStyle: TextStyle(
                            fontFamily: "PublicSans",
                            fontWeight: FontWeight.bold),
                        border: InputBorder.none),
                  ),
                  TextField(
                    maxLines: 14,
                    decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 255, 249, 224),
                        filled: true,
                        hintText: "Description",
                        hintStyle: TextStyle(
                          fontFamily: "PublicSans",
                          fontWeight: FontWeight.bold,
                        ),
                        border: InputBorder.none),
                  ),
                  //Upload File
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
                    onTap: () {},
                    child: Center(
                      child: Text(
                        "Send",
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
