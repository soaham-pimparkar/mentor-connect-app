import 'package:eyic/api/models/mentee_model.dart';
import 'package:flutter/material.dart';

final _mentor = [
  MenteeModel(
    uid: "1",
    name: "Vivek Modak",
    email: "vivek.modal@gmail.com",
    interestedSkills: ["Machine Learning", "Application Development "],
    age: 15,
    role: 'mentor'
  ),
  MenteeModel(
    uid: "2",
    name: "Manasi Kulkarni",
    email: "manasi.kulkarni@gmail.com",
    interestedSkills: ["Machine Learning", "Application Development "],
    age: 17,
      role: 'mentor'
  ),
  MenteeModel(
    uid: "3",
    name: "Mohan Patil",
    email: "mohan.patil@gmail.com",
    interestedSkills: ["Machine Learning", "Application Development "],
    age: 18,
      role: 'mentor'
  ),
  MenteeModel(
    uid: "4",
    name: "Ritika Jha",
    email: "ritika.jha@gmail.com",
    interestedSkills: ["Machine Learning", "Application Development "],
    age: 16,
      role: 'mentor'
  ),
  MenteeModel(
    uid: "5",
    name: "Soha Pal",
    email: "soha.pal@gmail.com",
    interestedSkills: ["Machine Learning", "Application Development "],
    age: 17,
      role: 'mentor'
  ),
];

class MenteeDashboardView extends StatelessWidget {
  const MenteeDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text("Mentorspace"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ListTile(
              title: Text(
                "Hello",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "{username}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Divider(),
            const ListTile(
              title: Text(
                "My mentors",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _mentor.length,
              itemBuilder: (context, index) {
                final mentor = _mentor[index];
                return ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: Text(mentor.name),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chat),
                  ),
                );
              },
            ),
            const Divider(),
            const ListTile(
              title: Text(
                "My groups (pinned)",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                final mentor = _mentor[index];
                return ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: Text(mentor.name),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chat),
                  ),
                );
              },
            ),
            const Divider(),
            const ListTile(
              title: Text(
                "My courses",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _mentor.length,
              itemBuilder: (context, index) {
                final mentor = _mentor[index];
                return ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: Text(mentor.name),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chat),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              title: const Text("Report Abuse"),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: () {},
              title: const Text("Contact us"),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
