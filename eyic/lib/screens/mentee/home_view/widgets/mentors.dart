import 'package:flutter/material.dart';

class Mentors extends StatelessWidget {
  const Mentors({super.key});

  @override
  Widget build(BuildContext context) {
    final mentors = [
      {
        'name': "Ayush Agarwal",
        'field': "Computer Sciences",
      },
      {
        'name': "Ayush Agarwal",
        'field': "Economics",
      },
      {
        'name': "Ayush Agarwal",
        'field': "Agriculture",
      },
      {
        'name': "Ayush Agarwal",
        'field': "Industry",
      }
    ];
    return Container(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Mentors",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: const EdgeInsets.all(7.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          "",
                          errorBuilder: (_, __, ___) {
                            return const Center(
                              child: Icon(
                                Icons.account_circle,
                                size: 68,
                              ),
                            );
                          },
                        ),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 4,
                        ),
                        title: const Text("Field :"),
                        subtitle: Text("${mentors[index]['field']}"),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
