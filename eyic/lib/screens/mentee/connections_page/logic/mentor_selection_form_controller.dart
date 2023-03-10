import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MentorSelectionFormController extends GetxController {
  var startingAgeController = TextEditingController().obs;
  var endingAgeController = TextEditingController().obs;
  var locality = TextEditingController().obs;
  var city = 'Any'.obs;
  var languagePriority1 = 'English'.obs;
  var languagePriority2 = 'Hindi'.obs;
  var languagePriority3 = 'Marathi'.obs;
  var gender = 'Male'.obs;

  void setLanguagePriority1(String value) {
    languagePriority1.value = value;
  }

  void setLanguagePriority2(String value) {
    languagePriority2.value = value;
  }

  void setLanguagePriority3(String value) {
    languagePriority3.value = value;
  }

  void setGender(String value) {
    gender.value = value;
  }

  void setCity(String value) {
    city.value = value;
  }
}
