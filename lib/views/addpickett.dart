import 'package:flutter/material.dart';

// class AddPickett extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Dynamic TextFormFields',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyForm(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController;
  static List<String> friendsList = [null];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

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
//
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
          'Tambah Piket',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFFFCE00),
      ),
      body: Form(
        key: _formKey,
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
                Card(
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
                              DropdownButton(
                                dropdownColor: Colors.white,
                                // focusColor: Colors.red,
                                hint: Text("Pilih grup"),
                                value: group,
                                items: theGroup
                                    .map(
                                      (value) => DropdownMenuItem(
                                        child: Text(value),
                                        value: value,
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(
                                    () {
                                      group = value;
                                    },
                                  );
                                },
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
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                        ..._getFriends(),
                        SizedBox(
                          height: 40,
                        ),
                        FlatButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                            }
                          },
                          child: Text(
                            'Simpan',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.black,
                        ),
                      ],
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

  /// get firends text-fields
  List<Widget> _getFriends() {
    List<Widget> friendsTextFields = [];
    for (int i = 0; i < friendsList.length; i++) {
      friendsTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Expanded(child: FriendTextFields(i)),
            SizedBox(
              width: 16,
            ),
            // we need add button at last friends row
            _addRemoveButton(i == friendsList.length - 1, i),
          ],
        ),
      ));
    }
    return friendsTextFields;
  }

  /// add / remove button
  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          // add new text-fields at the top of all friends textfields
          friendsList.insert(0, null);
        } else
          friendsList.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.lightGreen : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}

class FriendTextFields extends StatefulWidget {
  final int index;
  FriendTextFields(this.index);
  @override
  _FriendTextFieldsState createState() => _FriendTextFieldsState();
}

class _FriendTextFieldsState extends State<FriendTextFields> {
  TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameController.text = _MyFormState.friendsList[widget.index] ?? '';
    });

    return TextFormField(
      controller: _nameController,
      onChanged: (v) => _MyFormState.friendsList[widget.index] = v,
      decoration: InputDecoration(hintText: 'Nama petugas piket'),
      validator: (v) {
        if (v.trim().isEmpty) return 'Tidak boleh kosong';
        return null;
      },
    );
  }
}
