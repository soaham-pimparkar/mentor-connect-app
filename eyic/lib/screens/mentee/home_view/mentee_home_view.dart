import 'package:eyic/api/models/mentee_model.dart';
import 'package:eyic/global/colors.dart';
import 'package:eyic/screens/community/communities_home_screen.dart';
import 'package:eyic/screens/marketplace/marketplace_home_screen.dart';
import 'package:eyic/screens/mentee/connections_page/connections_page.dart';
import 'package:eyic/screens/mentee/courses_view/courses_view.dart';
import 'package:eyic/screens/mentee/home_view/widgets/home_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

//import '../../community/communities_home_screen.dart';
//import '../connections_page/connections_page.dart';

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
  MenteeModel(
      uid: "5",
      name: "Application development",
      email: "soha.pal@gmail.com",
      interestedSkills: ["Machine Learning", "Application Development "],
      age: 17,
      role: 'mentor',
      gender: 'male',
      languages: ["english", "hindi", "marathi"],
      description:
          "I can guide you with Machine learning and application development",
      tokens: 0),
  MenteeModel(
      uid: "5",
      name: "Machine learning",
      email: "soha.pal@gmail.com",
      interestedSkills: ["Machine Learning", "Application Development "],
      age: 17,
      role: 'mentor',
      gender: 'male',
      languages: ["english", "hindi", "marathi"],
      description:
          "I can guide you with Machine learning and application development",
      tokens: 0),
  MenteeModel(
      uid: "5",
      name: "Entrepreneurship",
      email: "soha.pal@gmail.com",
      interestedSkills: ["Machine Learning", "Application Development "],
      age: 17,
      role: 'mentor',
      gender: 'male',
      languages: ["english", "hindi", "marathi"],
      description:
          "I can guide you with Machine learning and application development",
      tokens: 0),
  MenteeModel(
      uid: "5",
      name: "Soft skills",
      email: "soha.pal@gmail.com",
      interestedSkills: ["Machine Learning", "Application Development "],
      age: 17,
      role: 'mentor',
      gender: 'male',
      languages: ["english", "hindi", "marathi"],
      description:
          "I can guide you with Machine learning and application development",
      tokens: 0),
  MenteeModel(
      uid: "5",
      name: "Blockchain",
      email: "soha.pal@gmail.com",
      interestedSkills: ["Machine Learning", "Application Development "],
      age: 17,
      role: 'mentor',
      gender: 'male',
      languages: ["english", "hindi", "marathi"],
      description:
          "I can guide you with Machine learning and application development",
      tokens: 0),
  MenteeModel(
      uid: "5",
      name: "Photography",
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

class MenteeDashboardView extends StatefulWidget {
  const MenteeDashboardView({super.key});

  @override
  State<MenteeDashboardView> createState() => _MenteeDashboardViewState();
}

class _MenteeDashboardViewState extends State<MenteeDashboardView> {
  int _currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser != null
        ? FirebaseAuth.instance.currentUser!.uid
        : "";
    Widget _currentView(int index) {
      switch (index) {
        case 0:
          return SingleChildScrollView(
            child: Column(
              children: [
                const ListTile(
                  title: Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // subtitle: Text(
                  //   "{username}",
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  // ),
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
                  itemCount: 5,
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
                    "My groups",
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
                    final mentor = _mentor[index + 5];
                    return ListTile(
                      leading: const Icon(Icons.people),
                      title: Text(mentor.name),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_circle_right),
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
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    final mentor = _mentor[index + 8];
                    return ListTile(
                      leading: const Icon(Icons.book),
                      title: Text(mentor.name),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_circle_right),
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
          );
        case 1:
          return ConnectionsPage();
        case 2:
          return CommunitiesHomeScreen();
        case 3:
          return CoursesView();
        case 4:
          return MarketplaceHomeScreen();
        default:
          return Text("Kahitr Gandlay");
      }
    }

    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        // leading: IconButton(
        //     onPressed: () {
        //       Get.offNamed('/');
        //     },
        //     icon: Icon(Icons.home)),
        title: const Text("Mentorspace"),
      ),
      body: _currentView(_currentScreenIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: bgColor,
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake),
            label: 'Connections',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Communities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Marketplace',
          ),
        ],
        currentIndex: _currentScreenIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            _currentScreenIndex = index;
          });
        },
      ),
    );
  }
}
