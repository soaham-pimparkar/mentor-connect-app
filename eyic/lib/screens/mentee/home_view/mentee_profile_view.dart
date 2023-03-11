import 'package:flutter/material.dart';

import '../../../api/models/mentee_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final _mentor = [
    MenteeModel(
        uid: "1",
        name: "Vivek Modak",
        email: "vivek.modal@gmail.com",
        interestedSkills: ["Machine Learning", "Application Development "],
        age: 15,
        role: 'mentor',
        gender: 'male',
        languages: ["english", "hindi", "marathi"],
        description:
            "I can guide you with Machine learning and application development",
        tokens: 0),
    MenteeModel(
        uid: "2",
        name: "Manasi Kulkarni",
        email: "manasi.kulkarni@gmail.com",
        interestedSkills: ["Machine Learning", "Application Development "],
        age: 17,
        role: 'mentor',
        gender: 'female',
        languages: ["english", "hindi", "marathi"],
        description:
            "I can guide you with Machine learning and application development",
        tokens: 0),
    MenteeModel(
        uid: "3",
        name: "Mohan Patil",
        email: "mohan.patil@gmail.com",
        interestedSkills: ["Machine Learning", "Application Development "],
        age: 18,
        role: 'mentor',
        gender: 'male',
        languages: ["english", "hindi", "marathi"],
        description:
            "I can guide you with Machine learning and application development",
        tokens: 0),
    MenteeModel(
        uid: "4",
        name: "Ritika Jha",
        email: "ritika.jha@gmail.com",
        interestedSkills: ["Machine Learning", "Application Development "],
        age: 16,
        role: 'mentor',
        gender: 'female',
        languages: ["english", "hindi", "marathi"],
        description:
            "I can guide you with Machine learning and application development",
        tokens: 0),
    MenteeModel(
        uid: "5",
        name: "Soha Pal",
        email: "soha.pal@gmail.com",
        interestedSkills: ["Machine Learning", "Application Development "],
        age: 17,
        role: 'mentor',
        gender: 'male',
        languages: ["english", "hindi", "marathi"],
        description:
            "I can guide you with Machine learning and application development",
        tokens: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
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
                    icon: const Icon(Icons.message),
                  ),
                );
              },
            ),
            const Divider(),
            const ListTile(
              title: Text(
                "My mentees",
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
                final mentee = _mentor[index];
                return ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: Text(mentee.name),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.message),
                  ),
                );
              },
            ),
            const Divider(),
            const ListTile(
              title: Text(
                "My tokens",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "{tokens}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Divider(),
            const ListTile(
              title: Text(
                "My sessions",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}