import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyic/api/models/mentor_model.dart';

class MentorDB {
  final _firestore = FirebaseFirestore.instance;

  // ignore: unused_field
  int _startAt = 0;

  void incrementStart() {
    _startAt += 15;
  }

  Future<List<MentorModel>> getMentors() async {
    var data = await _firestore.collection("users").get();
    var temp = data.docs.where((element) => element['role'] == 'mentor' ? true : false).toList();
    var list = <MentorModel>[];
    for (var i = 0; i < temp.length; i++) {
      list.add(MentorModel.fromMap(temp[i].data()));
    }
    return list;
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
