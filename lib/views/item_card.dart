import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticketing/helper/sharedpref_helper.dart';
import 'package:eticketing/views/detail_ticket_page.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final String nopol;
  final String deskripsi;
  final String status;
  final int antrian;
  final String originName;
  final String gambar;
  final String pengirim;
  final String petugas;
  final Timestamp createdAt;
  final Timestamp takenAt;

  //// Pointer to Update Function
  // final Function onUpdate;
  // //// Pointer to Delete Function
  // final Function onDelete;

  ItemCard(
      this.nopol,
      this.deskripsi,
      this.status,
      this.antrian,
      this.originName,
      this.gambar,
      this.pengirim,
      this.petugas,
      this.createdAt,
      this.takenAt);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  String myOriginName = " ", myUserName = " ", myEmail = " ";

  getMyInfoFromSharedPreferences() async {
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
    myOriginName = await SharedPreferenceHelper().getOriginName();
    setState(() {});
  }

  void initState() {
    getMyInfoFromSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailPage(
              widget.nopol,
              widget.deskripsi,
              widget.status,
              widget.antrian,
              widget.originName,
              widget.gambar,
              widget.pengirim,
              widget.petugas,
              widget.createdAt,
              widget.takenAt,
              myUserName,
              myOriginName);
        }));
      },
      child: Card(
        elevation: 5,
        color: Color.fromRGBO(255, 249, 224, 1),
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                    child: Text(
                      widget.nopol,
                      style: TextStyle(
                          fontFamily: "RedHatDisplay",
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text(
                      widget.antrian.toString(),
                      style: TextStyle(
                          fontFamily: "PublicSans",
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                    child: Text(
                      widget.originName,
                      style: TextStyle(
                        fontFamily: "PublicSans",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text(
                      widget.createdAt.toDate().toString().substring(11, 16),
                      style: TextStyle(
                        fontFamily: "PublicSans",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  )
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    margin: EdgeInsets.fromLTRB(5, 5, 0, 20),
                    child: Text(
                      widget.deskripsi.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "PublicSans",
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 0, 20),
                    child: Text(
                      widget.status,
                      style: TextStyle(
                          fontFamily: "PublicSans",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  )
                ]),
          ],
        ),
      ),
    );
  }
}
