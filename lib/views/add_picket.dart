import 'package:flutter/material.dart';

class AddPicket extends StatefulWidget {
  @override
  _AddPicketState createState() => _AddPicketState();
}

class _AddPicketState extends State<AddPicket> {
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
        /* builder: (context, child) {
          return Theme(
            data: ThemeData.dark(),
            child: child,
          );
        }, */
      );
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tambah Jadwal Piket",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFFFCE00),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "${selectedDate.toLocal()}".split(' ')[0],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  RaisedButton(
                    onPressed: () => _selectDate(context),
                    child: Icon(
                      Icons.date_range,
                      color: Colors.black,
                    ),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            child: Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(),
                      SizedBox(),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Grup: "),
                      Spacer(
                        flex: 1,
                      ),
                      Text("Merah"),
                      Spacer(
                        flex: 9,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
