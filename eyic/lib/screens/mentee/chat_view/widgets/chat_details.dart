import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyic/api/models/chat_model.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:eyic/api/models/message_model.dart';
import 'package:eyic/api/services/firebase/authentication.dart';
import 'package:eyic/api/services/firebase/chats_database.dart';
import 'package:uuid/uuid.dart';

final _authCtr = Get.put(Authentication());
final _messagesCtr = Get.put(ChatsDBCtr());

class ChatDetails extends StatelessWidget {
  final ChatModel chat;
  const ChatDetails({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: _messagesCtr.getMessagesAsStream(chat.chatId),
        builder:
            (context, AsyncSnapshot<QuerySnapshot<MessageModel>> snapshot) {
          if (snapshot.hasData) {
            return Chat(
              messages: snapshot.data!.docs
                  .map(
                    (e) => types.TextMessage(
                      author: types.User(id: e.data().authorId),
                      text: e.data().content,
                      id: e.data().messageId,
                      createdAt: DateTime.parse(e.data().timeStamp)
                          .millisecondsSinceEpoch,
                    ),
                  )
                  .toList(),
              onSendPressed: (text) => _messagesCtr.sendMessage(
                chat.chatId,
                MessageModel(
                  content: text.text,
                  timeStamp: DateTime.now().toIso8601String(),
                  authorId: _authCtr.uid,
                  authorName: '',
                  messageId: const Uuid().v4(),
                ),
              ),
              user: types.User(id: _authCtr.uid),
            );
          }
          return Container();
        },
      ),
    );
  }
}
