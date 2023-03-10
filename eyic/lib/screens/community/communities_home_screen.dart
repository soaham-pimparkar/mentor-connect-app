import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyic/api/models/community_model.dart';
import 'package:eyic/api/services/firebase/authentication.dart';
import 'package:eyic/screens/community/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunitiesHomeScreen extends StatelessWidget {
  const CommunitiesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: Community.communities.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.primaries[index % 10],
          child: InkWell(
            onTap: () async {
              String uid = Authentication().uid;
              Get.to(ChatPage(
                groupId: Community.communities[index].name,
                userName: uid,
                groupName: Community.communities[index].name,
              ));
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Community.communities[index].icon,
                    color: Colors.white,
                    size: 36,
                  ),
                  Text(
                    Community.communities[index].name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
