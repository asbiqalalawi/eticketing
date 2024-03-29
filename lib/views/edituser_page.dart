import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:eticketing/services/auth.dart';
import 'package:form_field_validator/form_field_validator.dart';

class EditUserPage extends StatefulWidget {
  // const EditUserPage({Key key}) : super(key: key);
  final String name;
  final String originName;
  final String email;
  final String uid;
  EditUserPage({this.name, this.originName, this.email, this.uid});

  @override
  _EditUserPageState createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  bool isLoading = false;
  bool _obsecureText = true;
  // bool _obsecureText2 = true;

  void _toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  List<String> suggestions = [
    'Admin',
    'Bapenda',
    'Samsat Bandar Lampung',
    'Samsat Gunung Sugih',
    'Samsat Kotabumi',
    'Samsat Kalianda',
    'Samsat Menggala',
    'Samsat Sukadana',
    'Samsat Metro',
    'Samsat Way kanan',
    'Samsat Liwa',
    'Samsat Tanggamus',
    'Samsat Mesuji',
    'Samsat Pringsewu',
    'Samsat Pesawaran',
    'Samsat Tulang Bawang Barat',
    'Samsat Pesisir Barat',
  ];

  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  SimpleAutoCompleteTextField textField;

  AuthMethods authMethods = new AuthMethods();

  final formKey = GlobalKey<FormState>();
  TextEditingController userNameTextEditingController =
      new TextEditingController();
  TextEditingController originNameTextEditingController =
      new TextEditingController();
  TextEditingController emailTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();

  signMeUp() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      authMethods.signUp(
          emailTextEditingController.text,
          passwordTextEditingController.text,
          originNameTextEditingController.text,
          userNameTextEditingController.text,
          context);
    }
  }

  @override
  void initState() {
    userNameTextEditingController.text = widget.name;
    originNameTextEditingController.text = widget.originName;
    emailTextEditingController.text = widget.email;

    super.initState();
  }

  String _chosenValue;

  @override
  Widget build(BuildContext context) {
    // print(authMethods.getCurrentUser().toString());
    // print(widget.uid);
    // print('XXXXXXXXXX');
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference _users = firestore.collection('users');
    _chosenValue = originNameTextEditingController.text;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFFFFCE00),
        title: Text(
          "Edit Pengguna",
          style: TextStyle(color: Colors.black, fontFamily: "RedHatDisplay"),
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
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : Stack(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: SizedBox(
                            height: 70,
                            child: TextFormField(
                              controller: userNameTextEditingController,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'Nama tidak boleh kosong'),
                              ]),
                              decoration: InputDecoration(
                                  fillColor: Color.fromARGB(255, 255, 249, 224),
                                  filled: true,
                                  hintText: "Nama",
                                  hintStyle: TextStyle(
                                      fontFamily: "PublicSans",
                                      fontWeight: FontWeight.bold),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 249, 224),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: _chosenValue,
                                items: [
                                  'Admin',
                                  'Bapenda',
                                  'Samsat Bandar Lampung',
                                  'Samsat Gunung Sugih',
                                  'Samsat Kotabumi',
                                  'Samsat Kalianda',
                                  'Samsat Menggala',
                                  'Samsat Sukadana',
                                  'Samsat Metro',
                                  'Samsat Way kanan',
                                  'Samsat Liwa',
                                  'Samsat Tanggamus',
                                  'Samsat Mesuji',
                                  'Samsat Pringsewu',
                                  'Samsat Pesawaran',
                                  'Samsat Tulang Bawang Barat',
                                  'Samsat Pesisir Barat',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem(
                                    child: Text(value),
                                    value: value,
                                  );
                                }).toList(),
                                hint: Text("Pilih"),
                                onChanged: (value) {
                                  setState(() {
                                    _chosenValue = value;
                                    originNameTextEditingController.text =
                                        _chosenValue;
                                  });
                                },
                              ),
                            ),
                          ),
                        )
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
                          onTap: () {
                            //TODO
                            // signMeUp();
                            _users.doc(widget.uid).update({
                              'name': userNameTextEditingController.text,
                              'originName':
                                  originNameTextEditingController.text,
                              'email': emailTextEditingController.text
                            });

                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Text(
                              "Simpan",
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
