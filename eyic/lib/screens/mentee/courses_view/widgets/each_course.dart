import 'dart:html';
import 'package:url_launcher/url_launcher.dart';
import 'package:eyic/api/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CourseDetailsView extends StatelessWidget {
  final Map data;
  const CourseDetailsView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                data["imageUrl"],
                height: 200,
                fit: BoxFit.fitHeight,
              ),
            ),
            ListTile(
              title: Text(
                data["title"],
              ),
            ),
            const Divider(),
            ListTile(
              title: Text("Youtube Links"),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: (data["ytLinks"] as List).length,
              itemBuilder: (context, index) {
                final ytData = (data["ytLinks"] as List)[index];
                return ListTile(
                  onTap: () => launchUrlString(ytData["link"]),
                  title: Text(
                    ytData["title"],
                  ),
                  subtitle: Text(
                    ytData["authorName"],
                  ),
                  trailing: Icon(Icons.arrow_forward),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: Text("Blogs"),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: (data["blogs"] as List).length,
              itemBuilder: (context, index) {
                final blog = (data["blogs"] as List)[index];
                return ListTile(
                  onTap: () => launchUrlString(blog["link"]),
                  title: Text(
                    blog["title"],
                  ),
                  subtitle: Text(
                    blog["authorName"],
                  ),
                  trailing: const Icon(Icons.arrow_forward),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: Text("Resources"),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: (data["resources"] as List).length,
              itemBuilder: (context, index) {
                final resource = (data["resources"] as List)[index];
                return ListTile(
                  onTap: () => launchUrlString(resource["link"]),
                  title: Text(
                    resource["title"],
                  ),
                  trailing: const Icon(Icons.arrow_forward),
                );
              },
            ),
          ],
        ),
      ),
    );
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
