import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:uuid/uuid.dart';

import '../../api/models/chat_model.dart';
import '../../api/models/mentor_model.dart';
import '../mentee/chat_view/widgets/chat_details.dart';

//import '../mentee/courses_view/courses_view.dart';
//import '../mentee/home_view/widgets/home_drawer.dart';

final _tokens = 180;

Future<MenteeModel> getMentorData() async {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final data =
      await FirebaseFirestore.instance.collection("users").doc(uid).get();
  print(data.data());
  return MenteeModel.fromMap(data.data()!);
}

Future<List<MentorModel>> getMentees(List<dynamic> uids) async {
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

class MentorDashboardView extends StatefulWidget {
  final int? index;
  const MentorDashboardView({super.key, this.index});

  @override
  State<MentorDashboardView> createState() => _MentorDashboardViewState();
}

class _MentorDashboardViewState extends State<MentorDashboardView> {
  int _currentScreenIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      setState(() => _currentScreenIndex = widget.index!);
    }
  }

  Widget _currentView(int index) {
    switch (index) {
      case 0:
        return FutureBuilder(
            future: getMentorData(),
            builder: (context, AsyncSnapshot<MenteeModel> snapshot) {
              if (snapshot.hasData) {
                final mentor = snapshot.data!;
                final mentees = mentor.myMentees;
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
                          mentor.name,
                          style: const TextStyle(
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
                      FutureBuilder(
                        future: getMentees(mentees),
                        builder: (context,
                            AsyncSnapshot<List<MentorModel>> snapshot) {
                          if (snapshot.hasData) {
                            final mentees = snapshot.data!;
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: mentees.length,
                              itemBuilder: (context, index) {
                                final mentee = mentees[index];
                                return ListTile(
                                  leading: const Icon(Icons.account_circle),
                                  title: Text(mentee.name),
                                  trailing: IconButton(
                                    onPressed: () async {
                                      await chatRoom(
                                        mentee,
                                        mentor,
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
                            onPressed: () {
                              Get.offNamed('/marketplace');
                            },
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
                        onTap: () {
                          Get.toNamed("/abuse");
                        },
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
            });
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
