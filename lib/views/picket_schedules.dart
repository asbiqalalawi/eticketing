import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticketing/helper/sharedpref_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class PicketSchedules extends StatefulWidget {
  @override
  _PicketSchedulesState createState() => _PicketSchedulesState();
}

class _PicketSchedulesState extends State<PicketSchedules> {
  CalendarController _controller;
  TextEditingController _scheduleController;
  String datepick;
  String myOriginName = " ", myUserName = " ", myEmail = " ";

  getMyInfoFromSharedPreferences() async {
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
    myOriginName = await SharedPreferenceHelper().getOriginName();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getMyInfoFromSharedPreferences();
    _controller = CalendarController();
    _scheduleController = TextEditingController();
    datepick = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString() +
        ' 12:00:00.000Z';
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference schedule = firestore.collection('schedule');

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(255, 206, 0, 1),
          title: Text(
            'Jadwal Piket',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                return Navigator.pop(context);
              }),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(8),
                child: Card(
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                    child: TableCalendar(
                      initialCalendarFormat: CalendarFormat.month,
                      calendarStyle: CalendarStyle(
                          canEventMarkersOverflow: true,
                          todayColor: Colors.orange,
                          selectedColor: Theme.of(context).primaryColor,
                          todayStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.white)),
                      headerStyle: HeaderStyle(
                        centerHeaderTitle: true,
                        formatButtonDecoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        formatButtonTextStyle: TextStyle(color: Colors.white),
                        formatButtonShowsNext: false,
                      ),
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      onDaySelected: (date, event, holidays) {
                        setState(() {
                          // _selectedEvents = ;
                          datepick = _controller.selectedDay.toString();
                        });
                      },
                      builders: CalendarBuilders(
                        selectedDayBuilder: (context, date, events) =>
                            Container(
                                margin: const EdgeInsets.all(4.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Text(
                                  date.day.toString(),
                                  style: TextStyle(color: Colors.white),
                                )),
                        todayDayBuilder: (context, date, events) => Container(
                            margin: const EdgeInsets.all(4.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                              date.day.toString(),
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      calendarController: _controller,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: StreamBuilder<QuerySnapshot>(
                  stream: schedule
                      .orderBy('event', descending: false)
                      .where('date', isEqualTo: datepick)
                      .snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: snapshot.data.docs
                            .map((e) => Center(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Card(
                                          elevation: 5,
                                          shape: StadiumBorder(
                                            side: BorderSide(
                                                color: Colors.black26,
                                                width: 1),
                                          ),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7,
                                            margin: EdgeInsets.all(20),
                                            child: Text(
                                              e.data()['event'].toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow.clip,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        (myOriginName == "Admin")
                                            ? IconButton(
                                                icon: Icon(
                                                  Icons.delete,
                                                  size: 30,
                                                  color: Colors.red,
                                                ),
                                                onPressed: () async {
                                                  await showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          backgroundColor:
                                                              Colors.white,
                                                          title: Text(
                                                              'Hapus jadwal'),
                                                          content: Text(e
                                                              .data()['event']),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                                //
                                                              },
                                                              child: Text(
                                                                'Batal',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blue,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                            TextButton(
                                                              onPressed: () {
                                                                schedule
                                                                    .doc(e.id)
                                                                    .delete();
                                                                Navigator.pop(
                                                                    context);
                                                                //
                                                              },
                                                              child: Text(
                                                                'Ya',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blue,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      });

                                                  //schedule.doc(e.id).delete();
                                                })
                                            : Container()
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      );
                    } else {
                      return Text('');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: (myOriginName == "Admin")
            ? FloatingActionButton(
                backgroundColor: Colors.black,
                child: Icon(Icons.add),
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text('Nama Petugas'),
                        content: TextField(
                          controller: _scheduleController,
                          textInputAction: TextInputAction.go,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              schedule.add({
                                'date': _controller.selectedDay.toString(),
                                'event': _scheduleController.text
                              });
                              _scheduleController.text = '';

                              Navigator.pop(context);
                              //
                            },
                            child: Text(
                              'Simpan',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              )
            : SizedBox());
  }
}
