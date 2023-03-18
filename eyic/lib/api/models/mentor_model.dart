import 'dart:convert';

class MentorModel {
  String uid;
  String name;
  String email;
  String phoneNumber;
  String occupation;
  String description;
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
    required this.description,
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
      'workingAt': description,
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
      description: '',
      experience: '',
      age: 0,
      tokens: 0,
      certificates: [],
    );
  }

  String toJson() => json.encode(toMap());

  factory MentorModel.fromJson(String source) =>
      MentorModel.fromMap(json.decode(source));
}
