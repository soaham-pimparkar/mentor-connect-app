import 'package:eyic/api/models/mentee_model.dart';
import 'package:flutter/material.dart';

final _tokens = 180;

final _mentee = [
  MenteeModel(
    uid: "1",
    name: "Vivek Modak",
    email: "vivek.modal@gmail.com",
    interestedSkills: ["Machine Learning", "Application Development "],
    age: 15,
  ),
  MenteeModel(
    uid: "2",
    name: "Manasi Kulkarni",
    email: "manasi.kulkarni@gmail.com",
    interestedSkills: ["Machine Learning", "Application Development "],
    age: 17,
  ),
  MenteeModel(
    uid: "3",
    name: "Mohan Patil",
    email: "mohan.patil@gmail.com",
    interestedSkills: ["Machine Learning", "Application Development "],
    age: 18,
  ),
  MenteeModel(
    uid: "4",
    name: "Ritika Jha",
    email: "ritika.jha@gmail.com",
    interestedSkills: ["Machine Learning", "Application Development "],
    age: 16,
  ),
  MenteeModel(
    uid: "5",
    name: "Soha Pal",
    email: "soha.pal@gmail.com",
    interestedSkills: ["Machine Learning", "Application Development "],
    age: 17,
  ),
];

class MentorDashboardView extends StatelessWidget {
  const MentorDashboardView({super.key});

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
                "My mentees",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _mentee.length,
              itemBuilder: (context, index) {
                final mentee = _mentee[index];
                return ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: Text(mentee.name),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chat),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.currency_bitcoin),
              title: Text(
                "Mentorspace tokens earned : $_tokens",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Visit marketplace"),
                ),
              ),
            ),
            const Divider(),
            const ListTile(
              title: Text(
                "My contributions : ",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Make a contribution"),
                ),
              ),
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
