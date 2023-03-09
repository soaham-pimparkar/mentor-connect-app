import 'package:eyic/api/services/firebase/mentor_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/mentor_list_item.dart';

class ConnectionsPage extends StatelessWidget {
  ConnectionsPage({super.key});
  final MentorDB mentorDB = Get.put(MentorDB());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mentorDB.getMentors(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          var mentorList = snapshot.data;
          return Column(
            children: [
              const Text(
                'My mentors:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListView.builder(itemBuilder: ((context, index) {
                return MentorListItem(mentorList![index]);
              })),
            ],
          );
        }
        return Center(
          child: Text('${snapshot.data}'),
        );
      }),
    );
  }
}
