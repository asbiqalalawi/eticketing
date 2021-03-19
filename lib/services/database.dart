import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticketing/helper/sharedpref_helper.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class DatabaseMethods {
  String name;

  /// Menambah Info User ke Cloud Firestore
  Future addUserInfoToDB(
      String userId, Map<String, dynamic> userInfoMap) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userInfoMap);
  }

  Future addUserMyTicketToDB(
      String userId, Map<String, dynamic> userTicketMap, origin) async {
    if (origin == "Bapenda" || origin == "Admin") {
      return FirebaseFirestore.instance
          .collection("myTicketBapenda")
          .doc(userId)
          .set(userTicketMap);
    } else {
      return FirebaseFirestore.instance
          .collection("myTicketSamsat")
          .doc(userId)
          .set(userTicketMap);
    }
  }

  /// Mengambil data User berdasarkan Email
  Future<QuerySnapshot> getUserInfo(String email) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .get();
  }

  Future<Stream<QuerySnapshot>> getTicketInfo(String name) async {
    return FirebaseFirestore.instance
        .collection("ticket")
        .where("pengirim", isEqualTo: name)
        .snapshots();
  }

  ///Update documents ketika tiket dikerjakan
  updateTicketTaken(String nopol, Map ticketTakenMap) {
    return FirebaseFirestore.instance
        .collection("ticket")
        .doc(nopol)
        .update(ticketTakenMap);
  }

  updateMyTicketBapenda(
      String myOriginName, String myUserName, Map ticketTakenMap) {
    Map<String, dynamic> update = {
      "lastUpdate": DateTime.now(),
      "onProcess": FieldValue.increment(1),
    };
    return FirebaseFirestore.instance
        .collection("myTicketBapenda")
        .doc(myUserName)
        .update(update);
  }
// getCounter(senderName) {
//     DocumentReference documentReference =
//         FirebaseFirestore.instance.collection('myTicketSamsat').doc(senderName);

//     return FirebaseFirestore.instance.runTransaction((transaction) async {
//       DocumentSnapshot snapshot = await transaction.get(documentReference);
//       int newValue = snapshot.data()['available'];
//       return newValue;
//     });
//   }
  updateMyTicketSamsat(String senderName, Map ticketTakenMap) {
    // int newValue;
    Map<String, dynamic> update = {
      "lastUpdate": DateTime.now(),
      "available": FieldValue.increment(-1),
      "onProcess": FieldValue.increment(1)
    };
    return FirebaseFirestore.instance
        .collection("myTicketSamsat")
        .doc(senderName)
        .update(update);
  }

  updateTicketCancel(String nopol, Map ticketCancelMap) {
    return FirebaseFirestore.instance
        .collection("ticket")
        .doc(nopol)
        .update(ticketCancelMap);
  }

  updateTicketCancelMyTicket(
      String myOriginName, String myUserName, Map ticketTakenMap) {
    if (myOriginName == "Bapenda" || myOriginName == "Admin") {
      Map<String, dynamic> update = {
        "lastUpdate": DateTime.now(),
        "onProcess": FieldValue.increment(-1),
      };
      return FirebaseFirestore.instance
          .collection("myTicketBapenda")
          .doc(myUserName)
          .update(update);
    }
  }

  updateTicketSelesai(String nopol, Map ticketSelesaiMap) {
    return FirebaseFirestore.instance
        .collection("ticket")
        .doc(nopol)
        .update(ticketSelesaiMap);
  }

  updateTicketFinishMyTicket(
      String myOriginName, String myUserName, Map ticketTakenMap) {
    if (myOriginName == "Bapenda" || myOriginName == "Admin") {
      Map<String, dynamic> update = {
        "lastUpdate": DateTime.now(),
        "Finish": FieldValue.increment(1),
        "onProcess": FieldValue.increment(-1),
      };
      return FirebaseFirestore.instance
          .collection("myTicketBapenda")
          .doc(myUserName)
          .update(update);
    }
  }

  /// Membuat Chat Room
  createChatRoom(String chatRoomId, Map chatRoomInfoMap) async {
    final snapShot = await FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .get();

    if (snapShot.exists) {
      // chatroom sudah ada
      return true;
    } else {
      // chatroom belum ada
      return FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(chatRoomId)
          .set(chatRoomInfoMap);
    }
  }

  ///Mengembalikan Chatroom sesuai user
  Future<Stream<QuerySnapshot>> getChatRooms() async {
    String myUsername = await SharedPreferenceHelper().getUserName();
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .orderBy("antrian")
        .where("users", arrayContains: myUsername)
        .snapshots();
  }

  ///Menambahkan Pesan
  Future addMessage(
      String chatRoomId, String messageId, Map massageInfoMap) async {
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .collection("chats")
        .doc(messageId)
        .set(massageInfoMap);
  }

  ///Mengupdate document dengan informasi pesan terakhir
  updateLastMessageSend(String chatRoomId, lastMessageInfoMap) {
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .update(lastMessageInfoMap);
  }

  Future<Stream<QuerySnapshot>> getChatRoomMessages(chatRoomId) async {
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy("ts", descending: true)
        .snapshots();
  }

  static Future<String> uploadImage(File imageFIle) async {
    String fileName = basename(imageFIle.path);
    Reference ref = FirebaseStorage.instance.ref().child(fileName);
    UploadTask task = ref.putFile(imageFIle);
    TaskSnapshot snapshot = await task;
    return await snapshot.ref.getDownloadURL();
  }

  /// Menghapus pesan
  Future deleteChat(String chatRoomId) {
    return FirebaseFirestore.instance
        .collection('chatrooms')
        .doc(chatRoomId)
        .delete()
        .then((value) => print("Chat Deleted"))
        .catchError((error) => print("Failed to delete chat: $error"));
  }

  Future createHistory(String nopol, Map historycanceledMap) async {
    return FirebaseFirestore.instance
        .collection("history")
        .doc(nopol)
        .set(historycanceledMap);
  }

  updatehistory(String nopol, Map historydoneMap) async {
    final snapShot =
        await FirebaseFirestore.instance.collection("history").doc(nopol).get();

    if (snapShot.exists) {
      FirebaseFirestore.instance
          .collection("history")
          .doc(nopol)
          .update(historydoneMap);
    } else {
      FirebaseFirestore.instance
          .collection("history")
          .doc(nopol)
          .set(historydoneMap);
    }
  }

  deleteTicket(String nopol) {
    return FirebaseFirestore.instance.collection('ticket').doc(nopol).delete();
  }

  Future<Stream<QuerySnapshot>> getHistory() async {
    return FirebaseFirestore.instance.collection("history").snapshots();
  }
}
