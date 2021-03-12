import 'package:cloud_firestore/cloud_firestore.dart';

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
}
