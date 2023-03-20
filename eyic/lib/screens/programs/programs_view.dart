import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyic/api/models/program_model.dart';
import 'package:eyic/screens/programs/programs_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

Future<List<ProgramModel>> getPrograms() async {
  var data = await FirebaseFirestore.instance.collection("programs").get();
  return data.docs.map((e) => ProgramModel.fromMap(e.data())).toList();
}

class ProgramsView extends StatelessWidget {
  const ProgramsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mentorspace programs"),
      ),
      body: FutureBuilder(
        future: getPrograms(),
        builder: (context, AsyncSnapshot<List<ProgramModel>> snapshot) {
          if (snapshot.hasData) {
            final programs = snapshot.data!;
            if (programs.isNotEmpty) {
              return Center(
                child: Wrap(
                  spacing: 14,
                  runSpacing: 14,
                  children: programs
                      .map(
                        (map) => SizedBox(
                          height: 200,
                          width: 170,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(map.title),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Get.to(ProgramDetailsView(data: map));
                                        },
                                        child: const Text("Enroll now"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            }
          }
          return Container();
        },
      ),
    );
  }
}
