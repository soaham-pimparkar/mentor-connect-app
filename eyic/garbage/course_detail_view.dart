import 'dart:html';

import 'package:eyic/api/models/course_model.dart';
import 'package:flutter/material.dart';

class CourseDetailView extends StatelessWidget {
  //final CourseModel course;
  const CourseDetailView({
    super.key,
    /*required this.course*/
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Web Development course kit")),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                    "Welcome to the Web development course. This page is a collection of free resources which will help you learn web development. Our entire course kit is community maintained!"),
              ),
              ListView.builder(
                  //padding:
                  //  const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                      title: Text("Youtube video: Free code camp"),
                      subtitle: Text(
                          "This 22 hour video expalins web development from beginner to advanced level. Topics covered: html, css, javascript, react.js, node.js, sql and non sql databases, etc."),
                      leading: ElevatedButton(
                          onPressed: () {}, child: Icon(Icons.computer)),
                    );
                  })
            ],
          ),
        ));
  }
}
