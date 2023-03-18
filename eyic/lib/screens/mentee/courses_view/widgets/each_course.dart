import 'dart:html';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:eyic/api/models/course_model.dart';
import 'package:flutter/material.dart';

class eachCourse extends StatelessWidget {
  eachCourse({super.key});

  final List<String> useTitle = [
    "Youtube video: Free code camp",
    "introduction to web development",
    "HTML, CSS AND JAVASCRIPT FOR DEVELOPERS",
    "Youtube video on web dev",
    "HTML and CSS blog",
    "Useful Front-End Boilerplates And Starter Kits blog",
    "Web development wikipedia"
  ];
  final List<String> useDescription = [
    "Learn full-stack web development in this full course for beginners. First, you will learn the basics of HTML, CSS, and JavaScript. Then, you will learn how to put everything together to create a frontend movie search app. Finally, you will learn how to create a backend API to create movie reviews and connect the frontend to the backend. The backend uses Node.js, Express, and MongoDB.",
    "This course is designed to start you on a path toward future studies in web development and design, no matter how little experience or technical knowledge you currently have. The web is a very big place, and if you are the typical internet user, you probably visit several websites every day, whether for business, entertainment or education",
    "In this course, we will learn the basic tools that every web page coder needs to know. We will start from the ground up by learning how to implement modern web pages with HTML and CSS. We will then advance to learning how to code our pages such that its components rearrange and resize themselves automatically based on the size of the user’s screen.	",
    "Learn JavaScript, HTML, and CSS in this Frontend Web Development course. In this massive course, you will go from no coding experience to having the essential skills of a frontend web developer. You will learn various web development technologies and create a few projects along the way. ",
    "This blog will cover the basics of html and css",
    "This blog will help you with front end boilder plates and provide starter kits",
    "This link will lead you to the wikipedia page for web development"
  ];
  final List<String> useLink = [
    "https://youtu.be/nu_pCVPKzTk",
    "https://www.coursera.org/learn/web-development",
    "https://www.coursera.org/learn/html-css-javascript-for-web-developers",
    "https://youtu.be/zJSY8tbf_ys",
    "https://webdesign.tutsplus.com/articles/html-css-for-beginners-mega-free-course--cms-93199",
    "https://youtu.be/zJSY8tbf_ys",
    "https://webdesign.tutsplus.com/articles/html-css-for-beginners-mega-free-course--cms-93199",
    "https://www.smashingmagazine.com/2021/06/useful-frontend-boilerplates-starter-kits/",
    "https://en.wikipedia.org/wiki/Web_development#:~:text=Web%20development%20is%20the%20work%20involved%20in%20developing,web%20applications%2C%20electronic%20businesses%2C%20and%20social%20network%20services.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.offNamed("/");
              },
              icon: Icon(Icons.arrow_back)),
          title: Text("Web development course kit"),
        ),
        body: ListView.builder(
            //padding:
            //  const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
            itemCount: useTitle.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                title: Text(useTitle[index]),
                subtitle: Text(useDescription[index]),
                leading: ElevatedButton(
                    onPressed: () {
                      _launchInBrowser(Uri.parse(useLink[index]));
                    },
                    child: Icon(Icons.link)),
              );
            }));
  }
}

Future<void> _launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}
