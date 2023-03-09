import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyic/api/models/perks_model.dart';
import 'package:get/get.dart';

import 'authentication.dart';

class PerksDB {
  final _firestore = FirebaseFirestore.instance;
  final _authCtr = Get.put(Authentication());

  Future<List<PerksModel>> getAllCourses() async {
    var data = await _firestore.collection("perks").get();
    return data.docs.map((e) => PerksModel.fromMap(e.data())).toList();
  }
}
