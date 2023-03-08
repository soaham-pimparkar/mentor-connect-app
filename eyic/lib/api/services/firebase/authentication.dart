import 'package:eyic/api/models/mentee_model.dart';
import 'package:eyic/api/services/firebase/mentee_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class Authentication extends GetxController {
  final _firebaseAuth = FirebaseAuth.instance;

  String get uid => _firebaseAuth.currentUser!.uid;

  Stream<User?> get userChanges {
    return _firebaseAuth.userChanges();
  }

  //
  Future signInUsingEmailAndPassword(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user!.uid;
  }

  //
  Future signUpUsingEmailAndPassword(
    String email,
    String password,
    String name,
    List<String> interestedSkills,
    int age,
    String role,
  ) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await MenteeDBCtr().createMentee(
      MenteeModel(
        uid: userCredential.user!.uid,
        name: name,
        email: email,
        interestedSkills: interestedSkills,
        age: age,
        role: role
      ),
    );
    return userCredential.user!.uid;
  }

  //
  Future signInWithGoogle() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    final userCredential = await _firebaseAuth.signInWithPopup(googleProvider);
    return userCredential.user!.uid;
  }

  //
  Future signOut() async {
    await _firebaseAuth.signOut();
  }
}
