import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyic/api/models/chat_model.dart';
import 'package:eyic/api/models/message_model.dart';
import 'package:eyic/api/services/firebase/authentication.dart';
import 'package:get/get.dart';

class ChatsDBCtr extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  final _authCtr = Get.put(Authentication());

  Future createChat(ChatModel chat) async {
    await _firestore.collection("chats").doc(chat.chatId).set(chat.toMap());
  }

  Future<List<ChatModel>> getChats() async {
    final data = await _firestore
        .collection("chats")
        .where("authorId", isEqualTo: _authCtr.uid)
        .get();
    return data.docs.map((e) => ChatModel.fromMap(e.data())).toList();
  }

  Future sendMessage(String chatId, MessageModel message) async {
    await _firestore
        .doc("chats/$chatId/messages/${message.messageId}")
        .set(message.toMap());
  }

  Stream<QuerySnapshot<MessageModel>> getMessagesAsStream(String chatId) {
    return _firestore
        .collection("chats")
        .doc(chatId)
        .collection("messages")
        .withConverter<MessageModel>(
          fromFirestore: (doc, _) => MessageModel.fromMap(doc.data()!),
          toFirestore: (data, _) => data.toMap(),
        )
        .snapshots();
  }
}
