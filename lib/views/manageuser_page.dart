// import 'package:eticketing/views/adduser_page.dart';
// import 'package:eticketing/views/edituser_page.dart';
// import 'package:flutter/material.dart';

// class ManageUserPage extends StatefulWidget {
//   ManageUserPage({Key key}) : super(key: key);

//   @override
//   _ManageUserPageState createState() => _ManageUserPageState();
// }

// class _ManageUserPageState extends State<ManageUserPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color.fromRGBO(255, 206, 0, 1),
//           title: Text(
//             "Kelola Pengguna",
//             style: TextStyle(color: Colors.black, fontFamily: "RedHatDisplay"),
//           ),
//           actions: [
//             IconButton(
//                 icon: Icon(Icons.person_add),
//                 color: Colors.black,
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                     return AddUserPage();
//                   }));
//                 })
//           ],
//         ),
//         body: Stack(
//           children: <Widget>[
//             Card(
//               elevation: 5,
//               margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
//               child: Container(
//                 padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.all(Radius.circular(5))),
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.search,
//                       color: Colors.black,
//                     ),
//                     Expanded(
//                         child: TextField(
//                       decoration: InputDecoration(border: InputBorder.none),
//                     ))
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.fromLTRB(10, 70, 10, 0),
//               child: ListView(
//                 children: <Widget>[
//                   Card(
//                     elevation: 5,
//                     child: Column(
//                       children: [
//                         Container(
//                             margin: EdgeInsets.only(left: 20, top: 20),
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "Fikri Mulya Permana",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: "RedHatDisplay"),
//                             )),
//                         Container(
//                           margin: EdgeInsets.only(left: 20, top: 5),
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             "Samsat Tanggamus",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.normal,
//                                 fontFamily: "RedHatDisplay"),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(left: 20, top: 20),
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             "Nama pengguna : fikrimulya",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.normal,
//                                 color: Colors.grey,
//                                 fontFamily: "RedHatDisplay"),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.fromLTRB(20, 5, 20, 20),
//                           alignment: Alignment.centerLeft,
//                           child: Row(
//                             children: [
//                               Text(
//                                 "Kata sandi : ********",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.normal,
//                                     color: Colors.grey,
//                                     fontFamily: "RedHatDisplay"),
//                               ),
//                               Spacer(),
//                               Row(
//                                 children: [
//                                   Container(
//                                     margin: EdgeInsets.only(right: 5),
//                                     child: Material(
//                                       borderRadius: BorderRadius.circular(5),
//                                       child: Container(
//                                         width: 70,
//                                         height: 25,
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(5),
//                                             color: Colors.black),
//                                         child: Material(
//                                           color: Colors.transparent,
//                                           child: InkWell(
//                                             borderRadius:
//                                                 BorderRadius.circular(5),
//                                             onTap: () {
//                                               Navigator.push(context,
//                                                   MaterialPageRoute(
//                                                       builder: (context) {
//                                                 return EditUserPage();
//                                               }));
//                                             },
//                                             child: Center(
//                                               child: Text(
//                                                 "Edit",
//                                                 style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontFamily: "RedHatDisplay",
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 12),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Material(
//                                     borderRadius: BorderRadius.circular(5),
//                                     child: Container(
//                                       width: 70,
//                                       height: 25,
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           color: Colors.black),
//                                       child: Material(
//                                         color: Colors.transparent,
//                                         child: InkWell(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           onTap: () {},
//                                           child: Center(
//                                             child: Text(
//                                               "Delete",
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontFamily: "RedHatDisplay",
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 12),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Card(
//                     elevation: 5,
//                     child: Column(
//                       children: [
//                         Container(
//                             margin: EdgeInsets.only(left: 20, top: 20),
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "Fikri Mulya Permana",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: "RedHatDisplay"),
//                             )),
//                         Container(
//                           margin: EdgeInsets.only(left: 20, top: 5),
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             "Samsat Tanggamus",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.normal,
//                                 fontFamily: "RedHatDisplay"),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(left: 20, top: 20),
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             "Nama pengguna : fikrimulya",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.normal,
//                                 color: Colors.grey,
//                                 fontFamily: "RedHatDisplay"),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.fromLTRB(20, 5, 20, 20),
//                           alignment: Alignment.centerLeft,
//                           child: Row(
//                             children: [
//                               Text(
//                                 "Kata sandi : ********",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.normal,
//                                     color: Colors.grey,
//                                     fontFamily: "RedHatDisplay"),
//                               ),
//                               Spacer(),
//                               Row(
//                                 children: [
//                                   Container(
//                                     margin: EdgeInsets.only(right: 5),
//                                     child: Material(
//                                       borderRadius: BorderRadius.circular(5),
//                                       child: Container(
//                                         width: 70,
//                                         height: 25,
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(5),
//                                             color: Colors.black),
//                                         child: Material(
//                                           color: Colors.transparent,
//                                           child: InkWell(
//                                             borderRadius:
//                                                 BorderRadius.circular(5),
//                                             onTap: () {
//                                               Navigator.push(context,
//                                                   MaterialPageRoute(
//                                                       builder: (context) {
//                                                 return EditUserPage();
//                                               }));
//                                             },
//                                             child: Center(
//                                               child: Text(
//                                                 "Edit",
//                                                 style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontFamily: "RedHatDisplay",
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 12),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Material(
//                                     borderRadius: BorderRadius.circular(5),
//                                     child: Container(
//                                       width: 70,
//                                       height: 25,
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           color: Colors.black),
//                                       child: Material(
//                                         color: Colors.transparent,
//                                         child: InkWell(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           onTap: () {},
//                                           child: Center(
//                                             child: Text(
//                                               "Delete",
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontFamily: "RedHatDisplay",
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 12),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Card(
//                     elevation: 5,
//                     child: Column(
//                       children: [
//                         Container(
//                             margin: EdgeInsets.only(left: 20, top: 20),
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "Fikri Mulya Permana",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: "RedHatDisplay"),
//                             )),
//                         Container(
//                           margin: EdgeInsets.only(left: 20, top: 5),
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             "Samsat Tanggamus",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.normal,
//                                 fontFamily: "RedHatDisplay"),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(left: 20, top: 20),
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             "Nama pengguna : fikrimulya",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.normal,
//                                 color: Colors.grey,
//                                 fontFamily: "RedHatDisplay"),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.fromLTRB(20, 5, 20, 20),
//                           alignment: Alignment.centerLeft,
//                           child: Row(
//                             children: [
//                               Text(
//                                 "Kata sandi : ********",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.normal,
//                                     color: Colors.grey,
//                                     fontFamily: "RedHatDisplay"),
//                               ),
//                               Spacer(),
//                               Row(
//                                 children: [
//                                   Container(
//                                     margin: EdgeInsets.only(right: 5),
//                                     child: Material(
//                                       borderRadius: BorderRadius.circular(5),
//                                       child: Container(
//                                         width: 70,
//                                         height: 25,
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(5),
//                                             color: Colors.black),
//                                         child: Material(
//                                           color: Colors.transparent,
//                                           child: InkWell(
//                                             borderRadius:
//                                                 BorderRadius.circular(5),
//                                             onTap: () {
//                                               Navigator.push(context,
//                                                   MaterialPageRoute(
//                                                       builder: (context) {
//                                                 return EditUserPage();
//                                               }));
//                                             },
//                                             child: Center(
//                                               child: Text(
//                                                 "Edit",
//                                                 style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontFamily: "RedHatDisplay",
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 12),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Material(
//                                     borderRadius: BorderRadius.circular(5),
//                                     child: Container(
//                                       width: 70,
//                                       height: 25,
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           color: Colors.black),
//                                       child: Material(
//                                         color: Colors.transparent,
//                                         child: InkWell(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           onTap: () {},
//                                           child: Center(
//                                             child: Text(
//                                               "Delete",
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontFamily: "RedHatDisplay",
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 12),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Card(
//                     elevation: 5,
//                     child: Column(
//                       children: [
//                         Container(
//                             margin: EdgeInsets.only(left: 20, top: 20),
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "Fikri Mulya Permana",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: "RedHatDisplay"),
//                             )),
//                         Container(
//                           margin: EdgeInsets.only(left: 20, top: 5),
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             "Samsat Tanggamus",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.normal,
//                                 fontFamily: "RedHatDisplay"),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(left: 20, top: 20),
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             "Nama pengguna : fikrimulya",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.normal,
//                                 color: Colors.grey,
//                                 fontFamily: "RedHatDisplay"),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.fromLTRB(20, 5, 20, 20),
//                           alignment: Alignment.centerLeft,
//                           child: Row(
//                             children: [
//                               Text(
//                                 "Kata sandi : ********",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.normal,
//                                     color: Colors.grey,
//                                     fontFamily: "RedHatDisplay"),
//                               ),
//                               Spacer(),
//                               Row(
//                                 children: [
//                                   Container(
//                                     margin: EdgeInsets.only(right: 5),
//                                     child: Material(
//                                       borderRadius: BorderRadius.circular(5),
//                                       child: Container(
//                                         width: 70,
//                                         height: 25,
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(5),
//                                             color: Colors.black),
//                                         child: Material(
//                                           color: Colors.transparent,
//                                           child: InkWell(
//                                             borderRadius:
//                                                 BorderRadius.circular(5),
//                                             onTap: () {
//                                               Navigator.push(context,
//                                                   MaterialPageRoute(
//                                                       builder: (context) {
//                                                 return EditUserPage();
//                                               }));
//                                             },
//                                             child: Center(
//                                               child: Text(
//                                                 "Edit",
//                                                 style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontFamily: "RedHatDisplay",
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 12),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Material(
//                                     borderRadius: BorderRadius.circular(5),
//                                     child: Container(
//                                       width: 70,
//                                       height: 25,
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           color: Colors.black),
//                                       child: Material(
//                                         color: Colors.transparent,
//                                         child: InkWell(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           onTap: () {},
//                                           child: Center(
//                                             child: Text(
//                                               "Delete",
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontFamily: "RedHatDisplay",
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 12),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Card(
//                     elevation: 5,
//                     child: Column(
//                       children: [
//                         Container(
//                             margin: EdgeInsets.only(left: 20, top: 20),
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "Fikri Mulya Permana",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: "RedHatDisplay"),
//                             )),
//                         Container(
//                           margin: EdgeInsets.only(left: 20, top: 5),
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             "Samsat Tanggamus",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.normal,
//                                 fontFamily: "RedHatDisplay"),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(left: 20, top: 20),
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             "Nama pengguna : fikrimulya",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.normal,
//                                 color: Colors.grey,
//                                 fontFamily: "RedHatDisplay"),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.fromLTRB(20, 5, 20, 20),
//                           alignment: Alignment.centerLeft,
//                           child: Row(
//                             children: [
//                               Text(
//                                 "Kata sandi : ********",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.normal,
//                                     color: Colors.grey,
//                                     fontFamily: "RedHatDisplay"),
//                               ),
//                               Spacer(),
//                               Row(
//                                 children: [
//                                   Container(
//                                     margin: EdgeInsets.only(right: 5),
//                                     child: Material(
//                                       borderRadius: BorderRadius.circular(5),
//                                       child: Container(
//                                         width: 70,
//                                         height: 25,
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(5),
//                                             color: Colors.black),
//                                         child: Material(
//                                           color: Colors.transparent,
//                                           child: InkWell(
//                                             borderRadius:
//                                                 BorderRadius.circular(5),
//                                             onTap: () {
//                                               Navigator.push(context,
//                                                   MaterialPageRoute(
//                                                       builder: (context) {
//                                                 return EditUserPage();
//                                               }));
//                                             },
//                                             child: Center(
//                                               child: Text(
//                                                 "Edit",
//                                                 style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontFamily: "RedHatDisplay",
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 12),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Material(
//                                     borderRadius: BorderRadius.circular(5),
//                                     child: Container(
//                                       width: 70,
//                                       height: 25,
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           color: Colors.black),
//                                       child: Material(
//                                         color: Colors.transparent,
//                                         child: InkWell(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           onTap: () {},
//                                           child: Center(
//                                             child: Text(
//                                               "Delete",
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontFamily: "RedHatDisplay",
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 12),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ));
//   }
// }
