import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProgramModel {
  String id;
  String title;
  String userfulFor;
  String description;
  String howItWorks;
  
  ProgramModel({
    required this.id,
    required this.title,
    required this.userfulFor,
    required this.description,
    required this.howItWorks,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'userfulFor': userfulFor,
      'description': description,
      'howItWorks': howItWorks,
    };
  }

  factory ProgramModel.fromMap(Map<String, dynamic> map) {
    return ProgramModel(
      id: map['id'] as String,
      title: map['title'] as String,
      userfulFor: map['userfulFor'] as String,
      description: map['description'] as String,
      howItWorks: map['howItWorks'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProgramModel.fromJson(String source) => ProgramModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
