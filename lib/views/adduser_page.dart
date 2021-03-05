// import 'package:eticketing/services/auth.dart';
// import 'package:flutter/material.dart';

// class AddUserPage extends StatefulWidget {
//   const AddUserPage({Key key}) : super(key: key);

//   @override
//   _AddUserPageState createState() => _AddUserPageState();
// }

// class _AddUserPageState extends State<AddUserPage> {
//   String list;
//   List droplist = [
//     "Samsat Tanggamus",
//     "Samsat Pringsewu",
//     "Samsat Bandar Lampung"
//   ];

//   bool isLoading = false;

//   AuthMethods authMethods = new AuthMethods();

//   final formKey = GlobalKey<FormState>();
//   TextEditingController userNameTextEditingController =
//       new TextEditingController();
//   TextEditingController samsatNameTextEditingController =
//       new TextEditingController();
//   TextEditingController emailTextEditingController =
//       new TextEditingController();
//   TextEditingController passwordTextEditingController =
//       new TextEditingController();

//   signMeUp() {
//     if (formKey.currentState.validate()) {
//       setState(() {
//         isLoading = true;
//       });
//       authMethods
//           .singUpWithEmailAndPassword(emailTextEditingController.text,
//               passwordTextEditingController.text)
//           .then((val) {
//         print("$val");
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFFFFCE00),
//         title: Text(
//           "Menambah Akun",
//           style: TextStyle(color: Colors.black, fontFamily: "RedHatDisplay"),
//         ),
//       ),
//       body: isLoading
//           ? Container(
//               child: Center(child: CircularProgressIndicator()),
//             )
//           : Stack(
//               children: [
//                 Container(
//                   margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
//                   child: Form(
//                     key: formKey,
//                     child: Column(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(bottom: 10),
//                           child: TextFormField(
//                             validator: (val) {
//                               return val.isEmpty || val.length < 2
//                                   ? "Username tidak valid"
//                                   : null;
//                             },
//                             controller: userNameTextEditingController,
//                             decoration: InputDecoration(
//                                 fillColor: Color.fromARGB(255, 255, 249, 224),
//                                 filled: true,
//                                 hintText: "Username",
//                                 hintStyle: TextStyle(
//                                     fontFamily: "PublicSans",
//                                     fontWeight: FontWeight.bold),
//                                 border: InputBorder.none),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(bottom: 10),
//                           child: TextFormField(
//                             controller: samsatNameTextEditingController,
//                             decoration: InputDecoration(
//                                 fillColor: Color.fromARGB(255, 255, 249, 224),
//                                 filled: true,
//                                 hintText: "Nama Samsat",
//                                 hintStyle: TextStyle(
//                                     fontFamily: "PublicSans",
//                                     fontWeight: FontWeight.bold),
//                                 border: InputBorder.none),
//                           ),
//                         ),
//                         // Container(
//                         //   margin: EdgeInsets.only(bottom: 10),
//                         //   color: Color.fromARGB(255, 255, 249, 224),
//                         //   padding: EdgeInsets.symmetric(horizontal: 10),
//                         //   child: DropdownButtonFormField(
//                         //     decoration: InputDecoration(
//                         //         hintText: "Samsat/Petugas Bapenda",
//                         //         hintStyle: TextStyle(
//                         //             fontFamily: "PublicSans",
//                         //             fontWeight: FontWeight.bold),
//                         //         border: InputBorder.none),
//                         //     value: list,
//                         //     onChanged: (value) {
//                         //       setState(() {
//                         //         list = value;
//                         //       });
//                         //     },
//                         //     items: droplist
//                         //         .map((droplist) => DropdownMenuItem(
//                         //               value: droplist,
//                         //               child: Text(
//                         //                 "$droplist",
//                         //                 style: TextStyle(
//                         //                     fontFamily: "PublicSans",
//                         //                     fontWeight: FontWeight.bold),
//                         //               ),
//                         //             ))
//                         //         .toList(),
//                         //   ),
//                         // ),
//                         Container(
//                           margin: EdgeInsets.only(bottom: 10),
//                           child: TextFormField(
//                             controller: emailTextEditingController,
//                             decoration: InputDecoration(
//                                 fillColor: Color.fromARGB(255, 255, 249, 224),
//                                 filled: true,
//                                 hintText: "Email",
//                                 hintStyle: TextStyle(
//                                     fontFamily: "PublicSans",
//                                     fontWeight: FontWeight.bold),
//                                 border: InputBorder.none),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(bottom: 10),
//                           child: TextFormField(
//                             controller: passwordTextEditingController,
//                             obscureText: true,
//                             decoration: InputDecoration(
//                                 fillColor: Color.fromARGB(255, 255, 249, 224),
//                                 filled: true,
//                                 hintText: "Kata Sandi",
//                                 hintStyle: TextStyle(
//                                     fontFamily: "PublicSans",
//                                     fontWeight: FontWeight.bold),
//                                 border: InputBorder.none),
//                           ),
//                         ),
//                         // Container(
//                         //   margin: EdgeInsets.only(bottom: 10),
//                         //   child: TextField(
//                         //     obscureText: true,
//                         //     decoration: InputDecoration(
//                         //         fillColor: Color.fromARGB(255, 255, 249, 224),
//                         //         filled: true,
//                         //         hintText: "Konfirmasi Kata Sandi",
//                         //         hintStyle: TextStyle(
//                         //             fontFamily: "PublicSans",
//                         //             fontWeight: FontWeight.bold),
//                         //         border: InputBorder.none),
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment(0, 0.7),
//                   child: Material(
//                     borderRadius: BorderRadius.circular(50),
//                     child: Container(
//                       width: 230,
//                       height: 55,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           color: Colors.black),
//                       child: Material(
//                         color: Colors.transparent,
//                         child: InkWell(
//                           borderRadius: BorderRadius.circular(50),
//                           onTap: () {
//                             //TODO
//                             signMeUp();
//                           },
//                           child: Center(
//                             child: Text(
//                               "Daftar",
//                               style: TextStyle(
//                                   fontFamily: "PublicSans",
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                   fontSize: 18),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//     );
//   }
// }
