import 'dart:convert';

class ChatModel {
  String chatId;
  String timeStamp;
  String authorId;
  String authorName;
  String mentorId;
  String mentorname;

  ChatModel({
    required this.chatId,
    required this.timeStamp,
    required this.authorId,
    required this.authorName,
    required this.mentorId,
    required this.mentorname,
  });

  Map<String, dynamic> toMap() {
    return {
      'chatId': chatId,
      'timeStamp': timeStamp,
      'authorId': authorId,
      'authorName': authorName,
      'mentorId': mentorId,
      'mentorname': mentorname,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      chatId: map['chatId'] ?? '',
      timeStamp: map['timeStamp'] ?? '',
      authorId: map['authorId'] ?? '',
      authorName: map['authorName'] ?? '',
      mentorId: map['mentorId'] ?? '',
      mentorname: map['mentorname'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source));
}
