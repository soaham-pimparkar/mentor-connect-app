import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyic/global/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class FeedbackCtr extends GetxController {
  String radioValue = "Call";
  bool interaction = true;
  final description = TextEditingController();
  final name = TextEditingController();

  void toggleInteraction(bool value) {
    interaction = value;
    update();
  }

  void setRadioValue(String value) {
    radioValue = value;
    update();
  }

  void reset() {
    name.clear();
    description.clear();
    radioValue = "Call";
    update();
  }
}

final _feedbackCtr = Get.put(FeedbackCtr());

class FeedbackView extends StatelessWidget {
  const FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback form"),
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text(
              "Your feedback helps us reward our mentors appropriately!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text(
              "Name of mentor :",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: TextFormField(
              controller: _feedbackCtr.name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text(
              "Did you have interaction with your mentor this week?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OutlinedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            side: BorderSide(
                              color: _feedbackCtr.interaction
                                  ? primary
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        _feedbackCtr.toggleInteraction(true);
                      },
                      child: const Text("Yes"),
                    ),
                    const SizedBox(width: 40),
                    OutlinedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            side: BorderSide(
                              color: _feedbackCtr.interaction
                                  ? primary
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        _feedbackCtr.toggleInteraction(false);
                      },
                      child: const Text("No"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text("Mode of interaction"),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile(
                title: const Text("Call"),
                value: _feedbackCtr.radioValue,
                groupValue: "Call",
                onChanged: (value) {
                  _feedbackCtr.setRadioValue(value!);
                },
                selected: false,
              ),
              RadioListTile(
                title: const Text("Chat"),
                value: _feedbackCtr.radioValue,
                groupValue: "Chat",
                onChanged: (value) {
                  _feedbackCtr.setRadioValue(value!);
                },
              ),
              RadioListTile(
                title: const Text("Video call"),
                value: _feedbackCtr.radioValue,
                groupValue: "Video Call",
                onChanged: (value) {
                  _feedbackCtr.setRadioValue(value!);
                },
              ),
            ],
          ),
          const Divider(),
          ListTile(
            title: const Text(
              "Anything that you feel like mentioning : ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: TextFormField(
              controller: _feedbackCtr.description,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text("Submit"),
                onPressed: () async {
                  try {
                    final uid = const Uuid().v4();
                    await FirebaseFirestore.instance
                        .collection("feedbacks")
                        .doc(uid)
                        .set(
                      {
                        "uid": uid,
                        "authorId": FirebaseAuth.instance.currentUser!.uid,
                        "name": _feedbackCtr.name.text,
                        "description": _feedbackCtr.description.text,
                        "interaction" : _feedbackCtr.interaction,
                        "timeStamp": DateTime.now().toIso8601String(),
                      },
                    );
                    _feedbackCtr.reset();
                  } catch (err) {
                    debugPrint(err.toString());
                  }
                },
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
