import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticketing/helper/sharedpref_helper.dart';
import 'package:eticketing/services/database.dart';
import 'package:eticketing/widgets/full_photo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ChatScreen extends StatefulWidget {
  final String nopol;
  ChatScreen(this.nopol);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String chatRoomId, messageId = "";
  String myOriginName, myUserName, myEmail;
  Stream messageStream;
  bool isLoading;
  TextEditingController messageEditingController = TextEditingController();

  File image;
  String imageUrl;
  final picker = ImagePicker();

  getMyInfoFromSharedPreferences() async {
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
    myOriginName = await SharedPreferenceHelper().getOriginName();

    chatRoomId = widget.nopol;
  }

  addMessage(bool sendClicked, String message, int type) {
    var lastMessageTs = DateTime.now();

    Map<String, dynamic> messageInfoMap = {
      "message": message,
      "sendBy": myEmail,
      "ts": lastMessageTs,
      "type": type
    };

    //Set messageId
    if (messageId == "") {
      messageId = randomAlphaNumeric(12);
    }

    DatabaseMethods()
        .addMessage(chatRoomId, messageId, messageInfoMap)
        .then((value) {
      Map<String, dynamic> lastMessageInfoMap = {
        "lastMessage": message,
        "lastMessageSendTs": lastMessageTs,
        "lastMessageSendBy": myEmail
      };

      DatabaseMethods().updateLastMessageSend(chatRoomId, lastMessageInfoMap);

      if (sendClicked) {
        //Menghapus teks dari TextField
        messageEditingController.text = "";
      }
      //Mengosongkan messageId
      messageId = "";
    });
  }

  Widget chatMessageTile(String message, bool sendByMe, int type) {
    return type == 0
        //Pesan Teks
        ? Container(
            alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              // width: message.length > 20 ? 200 : ,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft:
                        sendByMe ? Radius.circular(16) : Radius.circular(0),
                    bottomRight:
                        sendByMe ? Radius.circular(0) : Radius.circular(24)),
                color: sendByMe ? Color(0xFFFFF0B2) : Color(0xFFFFCE00),
              ),
              child: Text(
                message,
                style: TextStyle(color: Colors.black),
              ),
            ),
          )
        // Pesan Gambar
        : Container(
            child: FlatButton(
              child: Material(
                child: CachedNetworkImage(
                  placeholder: (context, url) => Container(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                    ),
                    width: 200.0,
                    height: 200.0,
                    padding: EdgeInsets.all(70.0),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Material(
                    child: Image.asset(
                      'images/img_not_available.jpeg',
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    clipBehavior: Clip.hardEdge,
                  ),
                  imageUrl: message,
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                clipBehavior: Clip.hardEdge,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FullPhoto(url: message)));
              },
              padding: EdgeInsets.all(0),
            ),
            margin: EdgeInsets.all(10),
            alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
          );
  }

  Widget chatMessage() {
    return StreamBuilder(
      stream: messageStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                padding: EdgeInsets.only(bottom: 80, top: 8),
                reverse: true,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
                  return chatMessageTile(
                      documentSnapshot["message"],
                      myEmail == documentSnapshot["sendBy"],
                      documentSnapshot["type"]);
                })
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  Future uploadFile() async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = reference.putFile(image);
    TaskSnapshot storageTaskSnapshot = await uploadTask;
    storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
      imageUrl = downloadUrl;
      setState(() {
        isLoading = false;
        // onSendMessage(imageUrl, 1);
        addMessage(true, imageUrl, 1);
      });
    }, onError: (err) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: 'This file is not an image');
    });
  }

  Future getImageFromGallery() async {
    ImagePicker imagePicker = ImagePicker();
    PickedFile pickedFile;

    pickedFile = await imagePicker.getImage(
        source: ImageSource.gallery, imageQuality: 50);
    image = File(pickedFile.path);

    if (image != null) {
      setState(() {
        isLoading = true;
      });
      uploadFile();
    }
  }

  Future getImageFromCamera() async {
    ImagePicker imagePicker = ImagePicker();
    PickedFile pickedFile;

    pickedFile = await imagePicker.getImage(
        source: ImageSource.camera, imageQuality: 50);
    image = File(pickedFile.path);

    if (image != null) {
      setState(() {
        isLoading = true;
      });
      uploadFile();
    }
  }

  _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        getImageFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      getImageFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  getAndSetMessage() async {
    messageStream = await DatabaseMethods().getChatRoomMessages(chatRoomId);
    setState(() {});
  }

  doThisOnLaunch() async {
    await getMyInfoFromSharedPreferences();
    getAndSetMessage();
  }

  @override
  void initState() {
    doThisOnLaunch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFCE00),
        title: Text(
          widget.nopol,
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
      body: Container(
        child: Stack(
          children: [
            chatMessage(),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromARGB(255, 255, 249, 224)),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: messageEditingController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Ketik disini...",
                      ),
                    )),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                        onTap: () {
                          _showPicker(context);
                        },
                        child: Icon(
                          Icons.image,
                        )),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                        onTap: () {
                          String message = messageEditingController.text;
                          if (message != "") {
                            addMessage(true, message, 0);
                          }
                        },
                        child: Icon(Icons.send_rounded))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
