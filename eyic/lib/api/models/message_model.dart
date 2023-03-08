import 'dart:convert';

class MessageModel {
  String messageId;
  String content;
  String timeStamp;
  String authorId;
  String authorName;
  MessageModel({
    required this.messageId,
    required this.content,
    required this.timeStamp,
    required this.authorId,
    required this.authorName,
  });

  Map<String, dynamic> toMap() {
    return {
      'messageId': messageId,
      'content': content,
      'timeStamp': timeStamp,
      'authorId': authorId,
      'authorName': authorName,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      messageId: map['messageId'] ?? '',
      content: map['content'] ?? '',
      timeStamp: map['timeStamp'] ?? '',
      authorId: map['authorId'] ?? '',
      authorName: map['authorName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source));
}
