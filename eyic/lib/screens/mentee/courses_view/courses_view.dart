import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyic/api/models/course_model.dart';
import 'package:eyic/screens/mentee/courses_view/widgets/each_course.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _courses = [
  {
    "title": "Flutter and Dart for Beginners",
    "description": "",
    "imageUrl": "assets/flutter_logo.jpg",
    "ytLinks": [
      {
        "title":
            "Flutter Course for Beginners –` 37-hour Cross Platform App Development Tutorial",
        "authorName": "FreeCodeCamp",
        "link":
            "https://www.youtube.com/watch?v=VPvVD8t02U8&ab_channel=freeCodeCamp.org",
      },
      {
        "title":
            "Flutter Complete Tutorial in Hindi (Beginner to Advanced Level)",
        "authorName": "WsCube Tech",
        "link":
            "https://www.youtube.com/playlist?list=PLjVLYmrlmjGfGLShoW0vVX_tcyT8u1Y3E",
      },
    ],
    "blogs": [
      {
        "title": "What`s new in Flutter 3.7",
        "authorName": "Kevin Chisholm",
        "link":
            "https://medium.com/flutter/whats-new-in-flutter-3-7-38cbea71133c",
      },
    ],
    "resources": [
      {
        "title": "Documentation",
        "link": "https://flutter.dev",
      }
    ],
  },
  {
    "title": "React for for Beginners",
    "description": "",
    "imageUrl": "assets/react_logo.jpg",
    "ytLinks": [
      {
        "title":
            "React Course - Beginner's Tutorial for React JavaScript Library [2022]",
        "authorName": "FreeCodeCamp",
        "link":
            "https://www.youtube.com/watch?v=bMknfKXIFA8&t=2768s&ab_channel=freeCodeCamp.org",
      },
      {
        "title":
            "React Material UI Tutorial",
        "authorName": "Codevolution ",
        "link":
            "https://www.youtube.com/playlist?list=PLC3y8-rFHvwh-K9mDlrrcDywl7CeVL2rO",
      },
    ],
    "blogs": [
      {
        "title": " Josh W. Comeau's Blog on React",
        "authorName": "Josh W. Comeau ",
        "link":
            "https://www.joshwcomeau.com/",
      },
    ],
    "resources": [
      {
        "title": "Documentation",
        "link": "https://legacy.reactjs.org/docs/getting-started.html",
      }
    ],
  },
];

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courses"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
        itemCount: _courses.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Card(
              child: SizedBox(
                height: 150,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Image.asset(
                        _courses[index]["imageUrl"] as String,
                        height: 200,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              _courses[index]["title"] as String,
                            ),
                            subtitle: Text(
                              _courses[index]["description"] as String,
                            ),
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              Get.to(
                                CourseDetailsView(
                                  data: _courses[index],
                                ),
                              );
                            },
                            child: Text("Open"),
                          ),
                          Spacer(),
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
}

// class CoursesView extends StatelessWidget {
//   const CoursesView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _getCourses(),
//       builder: (context, AsyncSnapshot<List<CourseModel>> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           print("snapshot is waiting");
//           return const Center();
//         }
//         if (snapshot.hasData) {
//           print("snapshot has data called");
//           final courses = snapshot.data!;
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text("Courses"),
//             ),
//             body: ListView.builder(
//               padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
//               itemCount: courses.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {},
//                   child: Card(
//                     child: SizedBox(
//                       height: 150,
//                       child: Row(
//                         children: [
//                           const Flexible(
//                             flex: 1,
//                             fit: FlexFit.tight,
//                             child: Placeholder(),
//                           ),
//                           Flexible(
//                             flex: 3,
//                             fit: FlexFit.tight,
//                             child: Column(
//                               children: [
//                                 ListTile(
//                                   title: Text(courses[index].title),
//                                   subtitle: Text(courses[index].description),
//                                 ),
//                                 Spacer(),
//                                 ElevatedButton(
//                                     onPressed: () {
//                                       Get.offNamed("/eachCourse");
//                                     },
//                                     child: Text("Open")),
//                                 Spacer(),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         }
//         print('container returned');
//         return Container();
//       },
//     );
//   }
// }

Future<List<CourseModel>> _getCourses() async {
  print("get courses future called");
  final data = await FirebaseFirestore.instance.collection("courses").get();
  return data.docs.map((e) => CourseModel.fromMap(e.data())).toList();
}
