import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticketing/helper/sharedpref_helper.dart';
import 'package:eticketing/services/database.dart';
import 'package:eticketing/views/chatscreen_page.dart';
import 'package:flutter/material.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  Stream chatRoomStream;
  String mySamsatName, myUserName, myEmail;

  getMyInfoFromSharedPreferences() async {
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
    mySamsatName = await SharedPreferenceHelper().getSamsatName();
  }

  Widget chatRoomListTile(nopol, lastMessage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ChatScreen(nopol)));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 7, 0, 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nopol,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "RedHatDisplay"),
                ),
                Text(
                  lastMessage,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontFamily: "PublicSans",
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Icon(
              Icons.navigate_next,
              size: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget chatRoomList() {
    return StreamBuilder(
      stream: chatRoomStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
                  return chatRoomListTile(documentSnapshot["nopol"],
                      documentSnapshot["lastMessage"]);
                },
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  getChatRoom() async {
    chatRoomStream = await DatabaseMethods().getChatRooms();
    setState(() {});
  }

  @override
  void initState() {
    getChatRoom();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFFFCE00),
      ),
      body: Container(
        margin: EdgeInsets.all(13),
        child: ListView(
          children: [
            chatRoomList(),
          ],
        ),
      ),
    );
  }
}
