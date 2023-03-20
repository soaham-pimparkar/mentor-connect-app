import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class ReportAbuseController extends GetxController {
  String type = "Language";
  final name = TextEditingController();
  final description = TextEditingController();

  void setType(String value) {
    type = value;
    update();
  }

  void reset() {
    name.clear();
    description.clear();
    type = "Language";
    update();
  }
}

final _reportCtr = Get.put(ReportAbuseController());

class ReportAbuseView extends StatelessWidget {
  const ReportAbuseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: IconButton(onPressed: onPressed, icon: icon),
        title: const Text("Report abuse"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Type of abuse :",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GetBuilder(
                  init: _reportCtr,
                  builder: (__) {
                    return DropdownButton<String>(
                      underline: Container(),
                      value: _reportCtr.type,
                      items: ["Verbal", "Sex", "Bullying", "Language"]
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        _reportCtr.setType(value!);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text(
              "Name of mentor / mentee :",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: TextFormField(
              controller: _reportCtr.name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text(
              "Proof of misconduct :",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: ElevatedButton(
              onPressed: () {},
              child: const Text("Upload file"),
            ),
          ),
          ListTile(
            title: const Text(
              "Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: TextFormField(
              controller: _reportCtr.description,
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
                        .collection("abuse")
                        .doc(uid)
                        .set(
                      {
                        "uid": uid,
                        "authorId": FirebaseAuth.instance.currentUser!.uid,
                        "name": _reportCtr.name.text,
                        "description": _reportCtr.description.text,
                        "timeStamp": DateTime.now().toIso8601String(),
                      },
                    ).then((value) {
                      _reportCtr.reset();
                      Get.offAllNamed("/");
                    });
                  } catch (err) {
                    debugPrint(err.toString());
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
