import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyic/screens/mentee/home_view/mentee_home_view.dart';
import 'package:eyic/screens/mentor/mentor_home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.data != null) {
          return FutureBuilder(
            future: _userData(uid),
            builder: (context, AsyncSnapshot<String?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (snapshot.hasData) {
                final value = snapshot.data;
                if (value == "mentor") {
                  return const MentorDashboardView();
                } else {
                  return const MenteeDashboardView();
                }
              }
              return Container();
            },
          );
        }
        return Container();
      },
    );
  }
}

Future<String?> _userData(String uid) async {
  final data =
      await FirebaseFirestore.instance.collection("users").doc(uid).get();

  if (data.exists) {
    if (data.data()!["role"] == "mentee") {
      return "mentee";
    }
    if (data.data()!["role"] == "mentor") {
      return "mentor";
    }
  } else {
    return null;
  }
}
