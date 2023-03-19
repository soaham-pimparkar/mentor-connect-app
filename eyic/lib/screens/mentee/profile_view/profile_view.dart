import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyic/api/models/mentee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<MenteeModel> getMenteeData(String uid) async {
  final data =
      await FirebaseFirestore.instance.collection("users").doc(uid).get();
  return MenteeModel.fromMap(data.data()!);
}

class MenteeProfileView extends StatelessWidget {
  const MenteeProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = Get.parameters["uid"]!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: FutureBuilder(
        future: getMenteeData(uid),
        builder: (context, AsyncSnapshot<MenteeModel> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Oops something went wrong!"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            final mentee = snapshot.data!;
            return ListView(
              children: [
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: Image.network(
                        "https://api.dicebear.com/5.x/initials/png?seed=${mentee.name}",
                      ),
                    ),
                  ),
                  title: Text(mentee.name),
                ),
                ListTile(
                  title: Text("Email ID :"),
                  subtitle: Text("${mentee.email}"),
                ),
                ListTile(
                  title: Text("Age :"),
                  subtitle: Text(mentee.age.toString()),
                ),
                ListTile(
                  title: Text("Description :"),
                  subtitle: Text(mentee.description),
                ),
                ListTile(
                  title: Text("Languages :"),
                  subtitle: Column(
                    children: mentee.languages.map((e) => Text(e)).toList(),
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
