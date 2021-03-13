import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticketing/helper/sharedpref_helper.dart';

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
        // .orderBy("lastMessageSendTs", descending: true)
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
}
