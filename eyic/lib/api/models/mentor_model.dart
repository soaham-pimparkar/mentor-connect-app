import 'dart:convert';

class MentorModel {
  String uid;
  String name;
  String email;
  String phoneNmuber;
  String occupation;
  String workingAt;
  String experience;
  int age;
  List<String> certificates;

  MentorModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phoneNmuber,
    required this.occupation,
    required this.workingAt,
    required this.experience,
    required this.age,
    required this.certificates,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phoneNmuber': phoneNmuber,
      'occupation': occupation,
      'workingAt': workingAt,
      'experience': experience,
      'age': age,
      'certificates': certificates,
    };
  }

  factory MentorModel.fromMap(Map<String, dynamic> map) {
    return MentorModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phoneNmuber: map['phoneNmuber'] ?? '',
      occupation: map['occupation'] ?? '',
      workingAt: map['workingAt'] ?? '',
      experience: map['experience'] ?? '',
      age: map['age']?.toInt() ?? 0,
      certificates: List<String>.from(map['certificates']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MentorModel.fromJson(String source) =>
      MentorModel.fromMap(json.decode(source));
}
