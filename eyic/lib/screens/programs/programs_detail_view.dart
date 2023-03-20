import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyic/api/models/mentee_model.dart';
import 'package:eyic/api/models/mentor_model.dart';
import 'package:eyic/api/models/program_model.dart';
import 'package:flutter/material.dart';

class ProgramDetailsView extends StatelessWidget {
  final ProgramModel data;
  const ProgramDetailsView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            title: Text(data.title),
          ),
          ListTile(
            title: Text("Useful for :"),
            subtitle: Text("${data.usefulFor}"),
          ),
          ListTile(
            title: Text("Description:"),
            subtitle: Text("${data.description}"),
          ),
          ListTile(
            title: const Text("Our mentors : "),
            subtitle: FutureBuilder(
              future: _getMentors(),
              builder: (context, AsyncSnapshot<List<MentorModel>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].name),
                      );
                    },
                  );
                }
                return Container();
              },
            ),
          ),
          const SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Enroll Now!"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<List<MentorModel>> _getMentors() async {
  final data = await FirebaseFirestore.instance
      .collection("users")
      .where("role", isEqualTo: "mentor")
      .get();

  return data.docs.map((e) => MentorModel.fromMap(e.data())).toList();
}
