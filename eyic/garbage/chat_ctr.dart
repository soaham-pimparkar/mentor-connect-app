import 'package:eyic/api/models/chat_model.dart';
import 'package:get/get.dart';

class ChatCtr extends GetxController {
  late ChatModel _chat;

  ChatModel get chat => _chat;

  void setChat(ChatModel value) {
    _chat = value;
    update();
  }
}
