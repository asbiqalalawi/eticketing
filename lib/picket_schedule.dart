import 'package:eticketing/addpickett.dart';
import 'package:flutter/material.dart';

class PicketSchedule extends StatefulWidget {
  @override
  _PicketScheduleState createState() => _PicketScheduleState();
}

class _PicketScheduleState extends State<PicketSchedule> {
  //
  DateTime selectedDate = DateTime.now();

  String group;
  List theGroup = [
    'Merah',
    'Biru',
    'Kuning',
    'Hijau',
  ];

  @override
  Widget build(BuildContext context) {
    _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2018),
        lastDate: DateTime(2050),
        helpText: 'Pilih tanggal',
        cancelText: 'Batal',
        confirmText: 'OK',
        errorFormatText: 'Format tanggal salah',
        fieldLabelText: 'Masukkan tanggal',
        fieldHintText: 'bulan/tanggal/tahun',
      );
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    }

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
              Icons.edit,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyForm();
              }));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.info,
              color: Colors.black,
            ),
            onPressed: () {
              /* Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyForm();
              })); */
              return showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Lihat jadwal hari lain"),
                  content: Text("Klik icon kalender"),
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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  child: Stack(
                    children: [
                      Card(
                        elevation: 7,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 70,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${selectedDate.toLocal()}".split(' ')[0],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  icon: Icon(Icons.date_range),
                                  tooltip: 'Pilih tanggal',
                                  onPressed: () {
                                    _selectDate(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // name textfield
                Container(
                  height: MediaQuery.of(context).size.height * 0.74,
                  child: Card(
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 10, 20),
                      child: Column(
                        children: [
                          //
                          Padding(
                            padding: const EdgeInsets.only(right: 32.0),
                            child: Row(
                              children: [
                                Text("Grup: "),
                                Spacer(
                                  flex: 1,
                                ),
                                Text(
                                  "Merah",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Spacer(
                                  flex: 9,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Petugas piket',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Fikri',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Mulya',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Permana',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
