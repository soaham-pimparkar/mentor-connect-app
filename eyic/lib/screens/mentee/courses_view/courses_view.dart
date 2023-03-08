import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyic/api/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getCourses(),
      builder: (context, AsyncSnapshot<List<CourseModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center();
        }
        if (snapshot.hasData) {
          final courses = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: const Text("Courses"),
            ),
            body: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Card(
                    child: SizedBox(
                      height: 150,
                      child: Row(
                        children: [
                          const Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Placeholder(),
                          ),
                          Flexible(
                            flex: 3,
                            fit: FlexFit.tight,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(courses[index].title),
                                  subtitle: Text("Duration : 22 hrs"),
                                ),
                                Spacer(),
                                ListTile(
                                  title: Text(courses[index].authorName),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}

Future<List<CourseModel>> _getCourses() async {
  final data = await FirebaseFirestore.instance.collection("courses").get();
  return data.docs.map((e) => CourseModel.fromMap(e.data())).toList();
}
