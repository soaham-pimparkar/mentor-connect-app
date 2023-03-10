import 'package:eyic/api/models/mentee_model.dart';
import 'package:eyic/global/colors.dart';
import 'package:eyic/screens/community/communities_home_screen.dart';
import 'package:eyic/screens/marketplace/marketplace_home_screen.dart';
import 'package:eyic/screens/mentee/connections_page/connections_page.dart';
import 'package:eyic/screens/mentee/courses_view/courses_view.dart';
import 'package:eyic/screens/mentee/home_view/widgets/home_drawer.dart';
import 'package:flutter/material.dart';

//import '../mentee/courses_view/courses_view.dart';
//import '../mentee/home_view/widgets/home_drawer.dart';

final _tokens = 180;

final _mentee = [
  MenteeModel(
      uid: "1",
      name: "Vivek Modak",
      email: "vivek.modal@gmail.com",
      interestedSkills: ["Machine Learning", "Application Development "],
      age: 15,
      role: 'mentee',
      gender: 'male',
      languages: ["english", "hindi", "marathi"],
      description:
          "I wish to learn Machine learning and application development",
      tokens: 0),
  MenteeModel(
      uid: "2",
      name: "Manasi Kulkarni",
      email: "manasi.kulkarni@gmail.com",
      interestedSkills: ["Machine Learning", "Application Development "],
      age: 17,
      role: 'mentee',
      gender: 'female',
      languages: ["english", "hindi", "marathi"],
      description:
          "I wish to learn Machine learning and application development",
      tokens: 0),
  MenteeModel(
      uid: "3",
      name: "Mohan Patil",
      email: "mohan.patil@gmail.com",
      interestedSkills: ["Machine Learning", "Application Development "],
      age: 18,
      role: 'mentee',
      gender: 'male',
      languages: ["english", "hindi", "marathi"],
      description:
          "I wish to learn Machine learning and application development",
      tokens: 0),
  MenteeModel(
      uid: "4",
      name: "Ritika Jha",
      email: "ritika.jha@gmail.com",
      interestedSkills: ["Machine Learning", "Application Development "],
      age: 16,
      role: 'mentee',
      gender: 'female',
      languages: ["english", "hindi", "marathi"],
      description:
          "I wish to learn Machine learning and application development",
      tokens: 0),
  MenteeModel(
      uid: "5",
      name: "Soha Pal",
      email: "soha.pal@gmail.com",
      interestedSkills: ["Machine Learning", "Application Development "],
      age: 17,
      role: 'mentee',
      gender: 'male',
      languages: ["english", "hindi", "marathi"],
      description:
          "I wish to learn Machine learning and application development",
      tokens: 0),
];

class MentorDashboardView extends StatefulWidget {
  const MentorDashboardView({super.key});

  @override
  State<MentorDashboardView> createState() => _MentorDashboardViewState();
}

class _MentorDashboardViewState extends State<MentorDashboardView> {
  int _currentScreenIndex = 4;

  Widget _currentView(int index) {
    switch (index) {
      case 0:
        return SingleChildScrollView(
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
        return Text("Kahitari Gandlay");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        title: const Text("Mentorspace"),
      ),
      body: _currentView(_currentScreenIndex),
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: bgColor,
        //unselectedIconTheme: IconTheme(data: IconThemeData(color: Colors.black)),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: bgColor,
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'MarketPlace',
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
