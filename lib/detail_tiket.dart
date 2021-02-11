import 'package:flutter/material.dart';

class DetailTiket extends StatefulWidget {
  @override
  _DetailTiketState createState() => _DetailTiketState();
}

class _DetailTiketState extends State<DetailTiket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_outlined,
          color: Colors.black,
        ),
        title: Text(
          "Detail",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFFFCE00),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                children: [
                  Text(
                    "Samsat Tanggamus",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 25),
              child: Row(
                children: [
                  Text(
                    "12:23, ",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  Text(
                    "12 Desember 2020",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                children: [
                  Text(
                    "Nopol",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 0, 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "BE 1234 EE",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  Text(
                    "Processed",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                children: [
                  Text(
                    "Description",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              child: Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Text(
                        "The EUSRR’s IHM guidance recommends using a software tool to keep maintenance up to date. Our cloud-based IHM Maintenance Software is designed by hazmat experts to ensure fully documented conformity for the full lifecycle of the ship via an easy to use dashboard. Once uploaded to the database, your initial IHM (from any Class Society) can be updated with documents of compliance from suppliers, certificates, image etc. whenever changes are required.Available as standalone software or integrated with your existing procurement system for seamless updates.The EUSRR’s IHM guidance recommends using a software tool to keep maintenance up to date. Our cloud-based IHM Maintenance Software is designed by hazmat experts to ensure fully documented conformity for the full lifecycle of the ship via an easy to use dashboard. Once uploaded to the database, your initial IHM (from any Class Society) can be updated with documents of compliance from suppliers, certificates, image etc. whenever changes are required.Available as standalone software or integrated with your existing procurement system for seamless updates. The EUSRR’s IHM guidance recommends using a software tool to keep maintenance up to date. Our cloud-based IHM Maintenance Software is designed by hazmat experts to ensure fully documented conformity for the full lifecycle of the ship via an easy to use dashboard. Once uploaded to the database, your initial IHM (from any Class Society) can be updated with documents of compliance from suppliers, certificates, image etc. whenever changes are required.Available as standalone software or integrated with your existing procurement system for seamless updates.",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
