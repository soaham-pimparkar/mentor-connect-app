import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/mentor_selection_form_controller.dart';

class MentorSelectionForm extends StatelessWidget {
  MentorSelectionForm({super.key});
  final MentorSelectionFormController mentorSelectionFormController =
      Get.put(MentorSelectionFormController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          const Text(
            "Fill out this form to get mentor recommendations",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          SizedBox(
            width: screenSize.width * 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Age of mentor:',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.1,
                  child: TextField(
                    controller: mentorSelectionFormController
                        .startingAgeController.value,
                  ),
                ),
                const Text('-', style: TextStyle(fontSize: 22)),
                SizedBox(
                  width: screenSize.width * 0.1,
                  child: TextField(
                    controller:
                        mentorSelectionFormController.endingAgeController.value,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          Divider(
            indent: screenSize.width * 0.15,
            endIndent: screenSize.width * 0.15,
          ),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          SizedBox(
            width: screenSize.width * 0.5,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Language of communication:',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('1st Preference: ',
                        style: TextStyle(fontSize: 18)),
                    Obx(
                      (() => DropdownButton<String>(
                            hint: const Text('Preference 1'),
                            value: mentorSelectionFormController
                                .languagePriority1.value,
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                            elevation: 9,
                            underline: Container(
                              height: 2,
                            ),
                            onChanged: (String? value) {
                              mentorSelectionFormController
                                  .setLanguagePriority1(value!);
                            },
                            items: [
                              'English',
                              'Hindi',
                              'Marathi',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('2nd Preference: ',
                        style: TextStyle(fontSize: 18)),
                    Obx(
                      (() => DropdownButton<String>(
                            hint: const Text('Preference 2'),
                            value: mentorSelectionFormController
                                .languagePriority2.value,
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                            elevation: 9,
                            underline: Container(
                              height: 2,
                            ),
                            onChanged: (String? value) {
                              mentorSelectionFormController
                                  .setLanguagePriority2(value!);
                            },
                            items: [
                              'English',
                              'Hindi',
                              'Marathi',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('3rd Preference: ',
                        style: TextStyle(fontSize: 18)),
                    Obx(
                      (() => DropdownButton<String>(
                            hint: const Text('Preference 3'),
                            value: mentorSelectionFormController
                                .languagePriority3.value,
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                            elevation: 9,
                            underline: Container(
                              height: 2,
                            ),
                            onChanged: (String? value) {
                              mentorSelectionFormController
                                  .setLanguagePriority3(value!);
                            },
                            items: [
                              'English',
                              'Hindi',
                              'Marathi',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          Divider(
            indent: screenSize.width * 0.15,
            endIndent: screenSize.width * 0.15,
          ),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          SizedBox(
            width: screenSize.width * 0.5,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Gender:',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Obx(() => ListTile(
                        title: const Text('Male'),
                        leading: Radio<String>(
                          value: 'Male',
                          groupValue:
                              mentorSelectionFormController.gender.value,
                          onChanged: (String? value) {
                            mentorSelectionFormController.setGender(value!);
                          },
                        ),
                      )),
                  Obx(
                    (() => ListTile(
                          title: const Text('Female'),
                          leading: Radio<String>(
                            value: 'Female',
                            groupValue:
                                mentorSelectionFormController.gender.value,
                            onChanged: (String? value) {
                              mentorSelectionFormController.setGender(value!);
                            },
                          ),
                        )),
                  ),
                  Obx(
                    (() => ListTile(
                          title: const Text('Any'),
                          leading: Radio<String>(
                            value: 'Any',
                            groupValue:
                                mentorSelectionFormController.gender.value,
                            onChanged: (String? value) {
                              mentorSelectionFormController.setGender(value!);
                            },
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          Divider(
            indent: screenSize.width * 0.15,
            endIndent: screenSize.width * 0.15,
          ),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          SizedBox(
            width: screenSize.width * 0.5,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Locality:',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Obx(() => ListTile(
                      title: const Text('Any'),
                      leading: Radio<String>(
                        value: 'Any',
                        groupValue: mentorSelectionFormController.city.value,
                        onChanged: (String? value) {
                          mentorSelectionFormController.setCity(value!);
                        },
                      ),
                    )),
                Obx(() => ListTile(
                      title: SizedBox(
                        width: screenSize.width * 0.1,
                        child: TextField(
                          controller:
                              mentorSelectionFormController.locality.value,
                        ),
                      ),
                      leading: Radio<String>(
                        value:
                            mentorSelectionFormController.locality.value.text,
                        groupValue: mentorSelectionFormController.city.value,
                        onChanged: (String? value) {
                          mentorSelectionFormController.setCity(value!);
                        },
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
