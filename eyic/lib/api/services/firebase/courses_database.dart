import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyic/api/models/course_model.dart';
import 'package:get/get.dart';

import 'authentication.dart';

class CoursesDB {
  final _firestore = FirebaseFirestore.instance;
  // ignore: unused_field
  final _authCtr = Get.put(Authentication());

  Future<List<CourseModel>> getAllCourses() async {
    var data = await _firestore.collection("courses").get();
    return data.docs.map((e) => CourseModel.fromMap(e.data())).toList();
  }
}
