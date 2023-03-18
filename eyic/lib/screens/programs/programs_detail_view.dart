import 'package:flutter/material.dart';

class ProgramDetailsView extends StatelessWidget {
  final Map data;
  const ProgramDetailsView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            title: Text(data["title"]),
          ),
          ListTile(
            title: Text("Useful for :"),
            subtitle: Text(data["usefulFor"]),
          ),
          ListTile(
            title: Text("Description:"),
            subtitle: Text(data["description"]),
          ),
          const ListTile(
            title: Text("Our mentors"),
          ),
          const SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Enroll Now!"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
