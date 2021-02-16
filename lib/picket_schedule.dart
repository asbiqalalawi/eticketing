import 'package:eticketing/add_picket.dart';
import 'package:flutter/material.dart';

class PicketSchedule extends StatefulWidget {
  @override
  _PicketScheduleState createState() => _PicketScheduleState();
}

class _PicketScheduleState extends State<PicketSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Picket Schedule",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFFFCE00),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_circle_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddPicket();
              }));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.info,
              color: Colors.black,
            ),
            onPressed: () {
              return showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Untuk pindah"),
                  content: Text("Geser ke kanan atau kiri"),
                  actions: [
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("OK"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: PageView(
        children: [
          buildContainer("1 Januari 2021"),
          buildContainer("2 Januari 2021"),
          buildContainer("3 Januari 2021"),
          buildContainer("4 Januari 2021"),
        ],
      ),
    );
  }

  Container buildContainer(String date) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(
            elevation: 5,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.navigate_before),
                      Text(
                        date,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.65,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          Text(
                            "Group",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Text(
                            "Red",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Spacer(
                            flex: 9,
                          )
                        ],
                      ),
                    ),
                    Text(
                      "Fikri",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text(
                      "Mulya",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text(
                      "Permana",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
