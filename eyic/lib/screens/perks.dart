import 'package:flutter/material.dart';

class MSPerk extends StatelessWidget {
  const MSPerk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
