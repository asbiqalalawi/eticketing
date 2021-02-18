import 'package:eticketing/detail_tiket.dart';
import 'package:flutter/material.dart';

class HistoriTiket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 206, 0, 1),
          title: Text(
            "Riwayat",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "RedHatDisplay",
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(5),
          child: ListView(
            children: <Widget>[buildLog(context)],
          ),
        ),
      ),
    );
  }

  GestureDetector buildLog(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailTiket();
        }));
      },
      child: Card(
        color: Color.fromRGBO(255, 249, 224, 1),
        elevation: 5,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Spacer(),
                Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Text(
                      "BE 3557",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "RedHatDisplay",
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                Spacer(flex: 8),
                Container(
                  child: Text(
                    "11:45",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "RedHatDisplay",
                        fontSize: 12),
                  ),
                ),
                Spacer(flex: 1),
                Container(
                  child: Text(
                    "18 Februari 2021",
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "RedHatDisplay",
                        fontSize: 12),
                  ),
                ),
                Spacer(flex: 1),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15, top: 10),
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    "Mohon dikerjakan dengan cara seksama dan dalam tempo yang sesingkat singkatnya",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "RedHatDisplay",
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15, top: 10, bottom: 15),
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    "Maaf harus saya cancel karna data kurang",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: "RedHatDisplay",
                        color: Colors.black,
                        fontSize: 12),
                  ),
                ),
                Spacer(flex: 3),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 15),
                  child: Text(
                    "Petugas : Yuan Ferdinand",
                    style: TextStyle(
                        fontFamily: "RedHatDisplay",
                        color: Colors.black,
                        fontSize: 12),
                  ),
                ),
                Spacer()
              ],
            )
          ],
        ),
      ),
    );
  }
}
