import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:eticketing/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({Key key}) : super(key: key);

  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  bool isLoading = false;
  bool _obsecureText = true;

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
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFFFFCE00),
        title: Text(
          "Tambah Pengguna",
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
                          child: SizedBox(
                            height: 70,
                            child: SimpleAutoCompleteTextField(
                              key: key,
                              suggestions: suggestions,
                              controller: originNameTextEditingController,
                              /* validator: MultiValidator([
                                RequiredValidator(
                                    errorText:
                                        'Nama samsat tidak boleh kosong'),
                              ]), */
                              decoration: InputDecoration(
                                  fillColor: Color.fromARGB(255, 255, 249, 224),
                                  filled: true,
                                  hintText: "Petugas (*Bapenda/Samsat...)",
                                  hintStyle: TextStyle(
                                      fontFamily: "PublicSans",
                                      fontWeight: FontWeight.bold),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        // Container(
                        //   margin: EdgeInsets.only(bottom: 10),
                        //   color: Color.fromARGB(255, 255, 249, 224),
                        //   padding: EdgeInsets.symmetric(horizontal: 10),
                        //   child: DropdownButtonFormField(
                        //     decoration: InputDecoration(
                        //         hintText: "Samsat/Petugas Bapenda",
                        //         hintStyle: TextStyle(
                        //             fontFamily: "PublicSans",
                        //             fontWeight: FontWeight.bold),
                        //         border: InputBorder.none),
                        //     value: list,
                        //     onChanged: (value) {
                        //       setState(() {
                        //         list = value;
                        //       });
                        //     },
                        //     items: droplist
                        //         .map((droplist) => DropdownMenuItem(
                        //               value: droplist,
                        //               child: Text(
                        //                 "$droplist",
                        //                 style: TextStyle(
                        //                     fontFamily: "PublicSans",
                        //                     fontWeight: FontWeight.bold),
                        //               ),
                        //             ))
                        //         .toList(),
                        //   ),
                        // ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: SizedBox(
                            height: 70,
                            child: TextFormField(
                              controller: emailTextEditingController,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'Email tidak boleh kosong'),
                                EmailValidator(errorText: 'Format email salah')
                              ]),
                              decoration: InputDecoration(
                                  fillColor: Color.fromARGB(255, 255, 249, 224),
                                  filled: true,
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                      fontFamily: "PublicSans",
                                      fontWeight: FontWeight.bold),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            controller: passwordTextEditingController,
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'Password tidak boleh kosong'),
                              MinLengthValidator(6,
                                  errorText:
                                      'Password tidak boleh kurang dari 6')
                            ]),
                            obscureText: _obsecureText,
                            decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    _toggle();
                                  },
                                  child: Icon(
                                    _obsecureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                ),
                                fillColor: Color.fromARGB(255, 255, 249, 224),
                                filled: true,
                                hintText: "Kata Sandi",
                                hintStyle: TextStyle(
                                    fontFamily: "PublicSans",
                                    fontWeight: FontWeight.bold),
                                border: InputBorder.none),
                          ),
                        ),
                        /* Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextField(
                            obscureText: _obsecureText2,
                            decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    _toggle2();
                                  },
                                  child: Icon(
                                    _obsecureText2
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                ),
                                fillColor: Color.fromARGB(255, 255, 249, 224),
                                filled: true,
                                hintText: "Konfirmasi Kata Sandi",
                                hintStyle: TextStyle(
                                    fontFamily: "PublicSans",
                                    fontWeight: FontWeight.bold),
                                border: InputBorder.none),
                          ),
                        ), */
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
                          onTap: () async {
                            //TODO
                            await showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: Text('Buat akun'),
                                    content: Container(
                                      height: 110,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              userNameTextEditingController
                                                  .text,
                                              overflow: TextOverflow.ellipsis),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                              originNameTextEditingController
                                                  .text,
                                              overflow: TextOverflow.ellipsis),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(emailTextEditingController.text,
                                              overflow: TextOverflow.ellipsis),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                              passwordTextEditingController
                                                  .text,
                                              overflow: TextOverflow.ellipsis),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          //
                                        },
                                        child: Text(
                                          'Batal',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          signMeUp();
                                          //
                                        },
                                        child: Text(
                                          'Ya',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                            // signMeUp();
                          },
                          child: Center(
                            child: Text(
                              "Daftar",
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
