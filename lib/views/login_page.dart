import 'package:eticketing/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import "package:form_field_validator/form_field_validator.dart";

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password;
  final auth = FirebaseAuth.instance;
  bool _obsecureText = true;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 255, 206, 0),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: EdgeInsets.only(top: 150, left: 15, right: 15),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.33,
                color: Colors.white38,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 27, fontFamily: "RedHatDisplay"),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Email harus diisi'),
                          EmailValidator(errorText: 'Email tidak valid')
                        ]),
                        autocorrect: true,
                        // autofocus: true,
                        cursorColor: Colors.black,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          setState(() {
                            email = value.trim();
                          });
                        },
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            hintText: "Email",
                            hintStyle: TextStyle(
                                fontFamily: "PublicSans",
                                fontWeight: FontWeight.bold),
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Password harus diisi'),
                          MinLengthValidator(6,
                              errorText: 'Password kurang dari 6')
                        ]),
                        cursorColor: Colors.black,
                        textInputAction: TextInputAction.done,
                        obscureText: _obsecureText,
                        onChanged: (value) {
                          setState(() {
                            password = value.trim();
                          });
                        },
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
                            hintText: "Password",
                            hintStyle: TextStyle(
                                fontFamily: "PublicSans",
                                fontWeight: FontWeight.bold),
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 220),
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
                          if (_formKey.currentState.validate()) {
                            print('Validated');
                            AuthMethods().signIn(email, password, context);
                          } else {
                            print('Not Validated');
                          }
                        },
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "PublicSans",
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return "Password harus diisi";
    } else if (value.length < 6) {
      return "Password kurang dari 6";
    } else
      return null;
  }

  String validateEmail(String value) {
    if (value.isEmpty) {
      return "Email harus diisi";
    } else if (value.endsWith('bapenda.com')) {
      return "Password should be atleast 6 characters";
    } else if (value.endsWith('samsat.com')) {
      return "Password should be atleast 6 characters";
    } else if (value.endsWith('admin.com')) {
      return "Password should be atleast 6 characters";
    } else
      return null;
  }
}
