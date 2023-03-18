// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatModel {
  String chatId;
  String timeStamp;
  String menteeId;
  String menteeName;
  String mentorId;
  String mentorname;

  ChatModel({
    required this.chatId,
    required this.timeStamp,
    required this.menteeId,
    required this.menteeName,
    required this.mentorId,
    required this.mentorname,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chatId': chatId,
      'timeStamp': timeStamp,
      'menteeId': menteeId,
      'menteeName': menteeName,
      'mentorId': mentorId,
      'mentorname': mentorname,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      chatId: map['chatId'] as String,
      timeStamp: map['timeStamp'] as String,
      menteeId: map['menteeId'] as String,
      menteeName: map['menteeName'] as String,
      mentorId: map['mentorId'] as String,
      mentorname: map['mentorname'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
