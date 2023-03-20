import 'package:eyic/api/services/firebase/mentor_database.dart';
import 'package:eyic/screens/mentee/connections_page/widgets/mentor_selection_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/colors.dart';
import 'widgets/mentor_list_item.dart';

class ConnectionsPage extends StatelessWidget {
  ConnectionsPage({super.key});
  final MentorDB mentorDB = Get.put(MentorDB());
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return FutureBuilder(
      future: mentorDB.getMentors(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          var mentorList = snapshot.data;
          return Scaffold(
            body: ListView.builder(
              itemCount: mentorList!.length,
              itemBuilder: ((context, index) {
                return index == 0
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            padding: const EdgeInsets.all(30),
                            color: Colors.transparent,
                            child: Center(
                              child: InkWell(
                                onTap: (() {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    enableDrag: true,
                                    isDismissible: false,
                                    elevation: 10,
                                    constraints: BoxConstraints.tightFor(
                                      height: screenSize.height,
                                      width: screenSize.width,
                                    ),
                                    context: context,
                                    builder: ((context) {
                                      return Container(
                                        color: Colors.transparent,
                                        child: MentorSelectionForm(),
                                      );
                                    }),
                                  );
                                }),
                                child: Container(
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.search,
                                        size: 30,
                                        color: Colors.black54,
                                      ),
                                      Text(
                                        'Look for new mentors',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                'Recommended mentors:',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          MentorListItem(mentorList[index]),
                        ],
                      )
                    : MentorListItem(mentorList[index]);
              }),
            ),
          );
        }
        return Center(
          child: Text('${snapshot.data}'),
        );
      }),
    );
  }
}
