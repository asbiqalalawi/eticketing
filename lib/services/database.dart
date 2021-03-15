import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticketing/helper/sharedpref_helper.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class DatabaseMethods {
  /// Menambah Info User ke Cloud Firestore
  Future addUserInfoToDB(
      String userId, Map<String, dynamic> userInfoMap) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userInfoMap);
  }

  /// Mengambil data User berdasarkan Email
  Future<QuerySnapshot> getUserInfo(String email) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .get();
  }

  ///Update documents ketika tiket dikerjakan
  updateTicketTaken(String nopol, Map ticketTakenMap) {
    return FirebaseFirestore.instance
        .collection("ticket")
        .doc(nopol)
        .update(ticketTakenMap);
  }

  updateTicketCancel(String nopol, Map ticketCancelMap) {
    return FirebaseFirestore.instance
        .collection("ticket")
        .doc(nopol)
        .update(ticketCancelMap);
  }

  updateTicketSelesai(String nopol, Map ticketSelesaiMap) {
    return FirebaseFirestore.instance
        .collection("ticket")
        .doc(nopol)
        .update(ticketSelesaiMap);
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

  Future<Stream<QuerySnapshot>> getChatRooms() async {
    String myUsername = await SharedPreferenceHelper().getUserName();
    return FirebaseFirestore.instance
        .collection("chatrooms")
        // .orderBy("lastMessageSendTs", descending: true)
        .where("users", arrayContains: myUsername)
        .snapshots();
  }

  static Future<String> uploadImage(File imageFile) async {
    String fileName = basename(imageFile.path);
    Reference ref = FirebaseStorage.instance.ref().child(fileName);
    UploadTask task = ref.putFile(imageFile);
    TaskSnapshot snapshot = await task;
    return await snapshot.ref.getDownloadURL();
  }
}
