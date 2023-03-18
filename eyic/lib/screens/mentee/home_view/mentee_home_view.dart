import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyic/api/models/chat_model.dart';
import 'package:eyic/api/models/mentee_model.dart';
import 'package:eyic/api/models/mentor_model.dart';
import 'package:eyic/global/colors.dart';
import 'package:eyic/screens/community/communities_home_screen.dart';
import 'package:eyic/screens/marketplace/marketplace_home_screen.dart';

import 'package:eyic/screens/mentee/chat_view/widgets/chat_details.dart';
import 'package:eyic/screens/mentee/connections_page/connections_page.dart';
import 'package:eyic/screens/mentee/courses_view/courses_view.dart';
import 'package:eyic/screens/mentee/home_view/widgets/home_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

Future<MenteeModel> getMenteeData() async {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final data =
      await FirebaseFirestore.instance.collection("users").doc(uid).get();
  print(data.data());
  return MenteeModel.fromMap(data.data()!);
}

Future<List<MentorModel>> getMentors(List<dynamic> uids) async {
  List<MentorModel> mentors = [];

  for (var uid in uids) {
    final data = await FirebaseFirestore.instance
        .collection("users")
        .doc((uid as String).trim())
        .get();
    mentors.add(MentorModel.fromMap(data.data()!));
  }

  return mentors;
}

Future chatRoom(MentorModel mentor, MenteeModel mentee) async {
  final data = await FirebaseFirestore.instance
      .collection("chats")
      .where("menteeId", isEqualTo: mentee.uid)
      .where("mentorId", isEqualTo: mentor.uid)
      .get();
  final chats = data.docs;

  if (chats.isNotEmpty) {
    final chat = ChatModel.fromMap(data.docs.first.data());
    Get.to(() => ChatDetails(chat: chat));
  } else {
    final chatId = const Uuid().v4();
    final newChat = ChatModel(
      chatId: chatId,
      timeStamp: DateTime.now().toIso8601String(),
      menteeId: mentee.uid,
      menteeName: mentee.name,
      mentorId: mentor.uid,
      mentorname: mentor.name,
    );
    await FirebaseFirestore.instance
        .collection("chats")
        .doc(chatId)
        .set(
          newChat.toMap(),
        )
        .then((value) => Get.to(() => ChatDetails(chat: newChat)));
  }
}

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
          return FutureBuilder(
            future: getMenteeData(),
            builder: (context, AsyncSnapshot<MenteeModel> snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
              if (snapshot.hasData) {
                final mentee = snapshot.data!;
                final mentors = mentee.myMentors;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text(
                          "Hello",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          mentee.name,
                          style: const TextStyle(
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
                      FutureBuilder(
                        future: getMentors(mentors),
                        builder: (context,
                            AsyncSnapshot<List<MentorModel>> snapshot) {
                          if (snapshot.hasData) {
                            final mentors = snapshot.data!;
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: mentors.length,
                              itemBuilder: (context, index) {
                                final mentor = mentors[index];
                                return ListTile(
                                  leading: const Icon(Icons.account_circle),
                                  title: Text(mentor.name),
                                  trailing: IconButton(
                                    onPressed: () async {
                                      await chatRoom(
                                        mentor,
                                        mentee,
                                      );
                                    },
                                    icon: const Icon(Icons.chat),
                                  ),
                                );
                              },
                            );
                          }
                          return Container();
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
                      // ListView.builder(
                      //   shrinkWrap: true,
                      //   itemCount: 3,
                      //   itemBuilder: (context, index) {
                      //     final mentor = _mentor[index];
                      //     return ListTile(
                      //       leading: const Icon(Icons.account_circle),
                      //       title: Text(mentor.name),
                      //       trailing: IconButton(
                      //         onPressed: () {},
                      //         icon: const Icon(Icons.chat),
                      //       ),
                      //     );
                      //   },
                      // ),
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
                      // ListView.builder(
                      //   shrinkWrap: true,
                      //   itemCount: _mentor.length,
                      //   itemBuilder: (context, index) {
                      //     final mentor = _mentor[index];
                      //     return ListTile(
                      //       leading: const Icon(Icons.account_circle),
                      //       title: Text(mentor.name),
                      //       trailing: IconButton(
                      //         onPressed: () {},
                      //         icon: const Icon(Icons.chat),
                      //       ),
                      //     );
                      //   },
                      // ),
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
              }
              return Container();
            },
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
