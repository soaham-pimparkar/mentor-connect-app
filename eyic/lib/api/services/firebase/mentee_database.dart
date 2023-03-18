import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyic/api/models/mentee_model.dart';
import 'package:get/get.dart';

class MenteeDBCtr extends GetxController {
  final _firestore = FirebaseFirestore.instance;

  

  Future createMentee(MenteeModel mentee) async {
    await _firestore.collection("users").doc(mentee.uid).set(
          mentee.toMap(),
        );
  }

  Future updateMentee(MenteeModel mentee) async {
    await _firestore.collection("mentees").doc(mentee.uid).set(
          mentee.toMap(),
          SetOptions(merge: true),
        );
  }
}
