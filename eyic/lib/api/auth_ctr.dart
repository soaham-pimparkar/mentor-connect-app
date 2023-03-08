import 'package:eyic/api/services/firebase/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthCtr extends GetxController {
  final _authentication = Authentication();

  final email = TextEditingController();
  final password = TextEditingController();

  Future signInUsingEmailAndPassword() async {
    var data = await _authentication.signInUsingEmailAndPassword(
      email.text,
      password.text,
    );

    return Future.value(data);
  }

  clear() {
    email.clear();
    password.clear();
  }
}
