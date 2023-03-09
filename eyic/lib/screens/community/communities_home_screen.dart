import 'package:eyic/api/models/community_model.dart';
import 'package:flutter/material.dart';
// import 'get';

class CommunitiesHomeScreen extends StatelessWidget {
  const CommunitiesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.primaries[index % 10],
          child: InkWell(
            onTap: () {
              Text("text");
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Community.communities[index].icon,
                    color: Colors.white,
                    size: 36,
                  ),
                  Text(
                    Community.communities[index].name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
