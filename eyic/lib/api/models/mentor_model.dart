import 'dart:convert';

class MentorModel {
  String uid;
  String name;
  String email;
  String phoneNumber;
  String occupation;
  String workingAt;
  String experience;
  int age;
  int tokens;
  List<String> certificates;

  MentorModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.occupation,
    required this.workingAt,
    required this.experience,
    required this.age,
    required this.tokens,
    required this.certificates,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'occupation': occupation,
      'workingAt': workingAt,
      'experience': experience,
      'age': age,
      'tokens': tokens,
      'certificates': certificates,
    };
  }

  static MentorModel fromMap(Map<String, dynamic> map) {
    return MentorModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: '',
      occupation: '',
      workingAt: '',
      experience: '',
      age: 0,
      tokens: 0,
      certificates: [],
    );
  }

  String toJson() => json.encode(toMap());

  factory MentorModel.fromJson(String source) => MentorModel.fromMap(json.decode(source));
}
