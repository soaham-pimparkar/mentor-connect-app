import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyic/api/models/mentor_model.dart';
import 'package:get/get.dart';

class MentorDB  {
  final _firestore = FirebaseFirestore.instance;

  int _startAt = 0;

  void incrementStart() {
    _startAt += 15;
   
  }

  Future getMentors() async {
    var data = await _firestore
        .collection("mentors")
        .startAt([_startAt])
        .limit(15)
        .get();
    var list = data.docs.map((e) => MentorModel.fromMap(e.data()));

  }

  Future createMentor(MentorModel mentor) async {
    await _firestore.collection("mentors").doc(mentor.uid).set(
          mentor.toMap(),
        );
  }

  Future updateMentor(MentorModel mentor) async {
    await _firestore.collection("mentors").doc(mentor.uid).set(
          mentor.toMap(),
          SetOptions(merge: true),
        );
  }
}
