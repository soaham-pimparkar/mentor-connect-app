import 'package:eyic/screens/programs/programs_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _categories = [
  {
    "title": "Career guidance program",
    "useful_for": "",
    "description": "",
    "how_it_works": "",
  },
  {
    "title": "Engineering guidance program",
    "useful_for": "",
    "description": "",
    "how_it_works": "",
  },
  {
    "title": "Social change program",
    "useful_for": "",
    "description": "",
    "how_it_works": "",
  },
  {
    "title": "Self improvement program",
    "useful_for": "",
    "description": "",
    "how_it_works": "",
  },
  {
    "title": "Local Bandhu program",
    "useful_for": "",
    "description": "",
    "how_it_works": "",
  },
  {
    "title": "Dheya.com program",
    "useful_for": "",
    "description": "",
    "how_it_works": "",
  },
];

class ProgramsView extends StatelessWidget {
  const ProgramsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mentorspace programs"),
      ),
      body: Center(
        child: Wrap(
          spacing: 14,
          runSpacing: 14,
          children: _categories
              .map(
                (map) => SizedBox(
                  height: 200,
                  width: 170,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ListTile(
                            // leading: Image.network(
                            //   "https://api.dicebear.com/5.x/identicon/png?seed=${map["title"]}",
                            // ),
                            title: Text(map["title"]!),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.to(ProgramDetailsView(data: map));
                                },
                                child: const Text("Enroll now"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
