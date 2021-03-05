import 'package:eticketing/views/detail_ticket_page.dart';
import 'package:eticketing/views/detail_tiket.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String nopol;
  final String deskripsi;
  final int counter;
  //// Pointer to Update Function
  // final Function onUpdate;
  // //// Pointer to Delete Function
  // final Function onDelete;

  ItemCard(this.nopol, this.deskripsi, this.counter);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailPage(nopol, deskripsi);
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
                      nopol,
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
                      counter.toString(),
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
                      "Samsat Origin",
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
                      "12:53",
                      style: TextStyle(
                        fontFamily: "PublicSans",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    margin: EdgeInsets.fromLTRB(5, 5, 0, 50),
                    child: Text(
                      deskripsi.toString(),
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
                    margin: EdgeInsets.fromLTRB(5, 5, 0, 50),
                    child: Text(
                      "Sedang dikerjakan",
                      style: TextStyle(
                          fontFamily: "PublicSans",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  )
                ])
          ],
        ),
      ),
    );
  }
}
