// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MenteeModel {
  String uid;
  String name;
  String email;
  List<dynamic> interestedSkills;
  int age;
  String role;
  String gender;
  List<dynamic> languages;
  String description;
  int tokens;
  dynamic myMentors;
  dynamic myMentees;

  MenteeModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.interestedSkills,
    required this.age,
    required this.role,
    required this.gender,
    required this.languages,
    required this.description,
    required this.tokens,
    required this.myMentors,
    required this.myMentees,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'interestedSkills': interestedSkills,
      'age': age,
      'role': role,
      'gender': gender,
      'languages': languages,
      'description': description,
      'tokens': tokens,
      'myMentors': myMentors,
      'myMentees': myMentees,
    };
  }

  factory MenteeModel.fromMap(Map<String, dynamic> map) {
    return MenteeModel(
      uid: map['uid'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      interestedSkills: map['interestedSkills'],
      age: map['age'] as int,
      role: map['role'] as String,
      gender: map['gender'] as String,
      languages: map['languages'],
      description: map['description'] as String,
      tokens: map['tokens'] as int,
      myMentors: map['myMentors'] as dynamic,
      myMentees: map['myMentees'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory MenteeModel.fromJson(String source) =>
      MenteeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
