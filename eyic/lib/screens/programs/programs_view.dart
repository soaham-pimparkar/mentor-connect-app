import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyic/api/models/program_model.dart';
import 'package:eyic/screens/programs/programs_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

final _categories = [
  {
    "title": "Career guidance program",
    "usefulFor":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla aliquam, dui eu facilisis efficitur, enim dolor efficitur metus, quis tincidunt sapien eros eu elit. Vivamus id placerat felis. Phasellus ultrices est ac dictum lacinia. Donec congue, odio vitae tempus rhoncus, massa odio molestie est, vel dignissim nibh nisl vel lectus. Etiam sed dui leo. Suspendisse et nibh ligula. Aliquam dui lectus, elementum eget risus tincidunt, pretium suscipit odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed id mauris at quam consectetur vehicula. Duis vitae velit diam. Aenean consequat turpis a erat vehicula fermentum. Nunc vel purus posuere, auctor magna at, ornare ex.",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla aliquam, dui eu facilisis efficitur, enim dolor efficitur metus, quis tincidunt sapien eros eu elit. Vivamus id placerat felis. Phasellus ultrices est ac dictum lacinia. Donec congue, odio vitae tempus rhoncus, massa odio molestie est, vel dignissim nibh nisl vel lectus. Etiam sed dui leo. Suspendisse et nibh ligula. Aliquam dui lectus, elementum eget risus tincidunt, pretium suscipit odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed id mauris at quam consectetur vehicula. Duis vitae velit diam. Aenean consequat turpis a erat vehicula fermentum. Nunc vel purus posuere, auctor magna at, ornare ex.",
    "howItWorks":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla aliquam, dui eu facilisis efficitur, enim dolor efficitur metus, quis tincidunt sapien eros eu elit. Vivamus id placerat felis. Phasellus ultrices est ac dictum lacinia. Donec congue, odio vitae tempus rhoncus, massa odio molestie est, vel dignissim nibh nisl vel lectus. Etiam sed dui leo. Suspendisse et nibh ligula. Aliquam dui lectus, elementum eget risus tincidunt, pretium suscipit odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed id mauris at quam consectetur vehicula. Duis vitae velit diam. Aenean consequat turpis a erat vehicula fermentum. Nunc vel purus posuere, auctor magna at, ornare ex.",
  },
  {
    "title": "Engineering guidance program",
    "usefulFor":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla aliquam, dui eu facilisis efficitur, enim dolor efficitur metus, quis tincidunt sapien eros eu elit. Vivamus id placerat felis. Phasellus ultrices est ac dictum lacinia. Donec congue, odio vitae tempus rhoncus, massa odio molestie est, vel dignissim nibh nisl vel lectus. Etiam sed dui leo. Suspendisse et nibh ligula. Aliquam dui lectus, elementum eget risus tincidunt, pretium suscipit odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed id mauris at quam consectetur vehicula. Duis vitae velit diam. Aenean consequat turpis a erat vehicula fermentum. Nunc vel purus posuere, auctor magna at, ornare ex.",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla aliquam, dui eu facilisis efficitur, enim dolor efficitur metus, quis tincidunt sapien eros eu elit. Vivamus id placerat felis. Phasellus ultrices est ac dictum lacinia. Donec congue, odio vitae tempus rhoncus, massa odio molestie est, vel dignissim nibh nisl vel lectus. Etiam sed dui leo. Suspendisse et nibh ligula. Aliquam dui lectus, elementum eget risus tincidunt, pretium suscipit odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed id mauris at quam consectetur vehicula. Duis vitae velit diam. Aenean consequat turpis a erat vehicula fermentum. Nunc vel purus posuere, auctor magna at, ornare ex.",
    "howItWorks":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla aliquam, dui eu facilisis efficitur, enim dolor efficitur metus, quis tincidunt sapien eros eu elit. Vivamus id placerat felis. Phasellus ultrices est ac dictum lacinia. Donec congue, odio vitae tempus rhoncus, massa odio molestie est, vel dignissim nibh nisl vel lectus. Etiam sed dui leo. Suspendisse et nibh ligula. Aliquam dui lectus, elementum eget risus tincidunt, pretium suscipit odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed id mauris at quam consectetur vehicula. Duis vitae velit diam. Aenean consequat turpis a erat vehicula fermentum. Nunc vel purus posuere, auctor magna at, ornare ex.",
  },
  {
    "title": "Social change program",
    "usefulFor":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla aliquam, dui eu facilisis efficitur, enim dolor efficitur metus, quis tincidunt sapien eros eu elit. Vivamus id placerat felis. Phasellus ultrices est ac dictum lacinia. Donec congue, odio vitae tempus rhoncus, massa odio molestie est, vel dignissim nibh nisl vel lectus. Etiam sed dui leo. Suspendisse et nibh ligula. Aliquam dui lectus, elementum eget risus tincidunt, pretium suscipit odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed id mauris at quam consectetur vehicula. Duis vitae velit diam. Aenean consequat turpis a erat vehicula fermentum. Nunc vel purus posuere, auctor magna at, ornare ex.",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla aliquam, dui eu facilisis efficitur, enim dolor efficitur metus, quis tincidunt sapien eros eu elit. Vivamus id placerat felis. Phasellus ultrices est ac dictum lacinia. Donec congue, odio vitae tempus rhoncus, massa odio molestie est, vel dignissim nibh nisl vel lectus. Etiam sed dui leo. Suspendisse et nibh ligula. Aliquam dui lectus, elementum eget risus tincidunt, pretium suscipit odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed id mauris at quam consectetur vehicula. Duis vitae velit diam. Aenean consequat turpis a erat vehicula fermentum. Nunc vel purus posuere, auctor magna at, ornare ex.",
    "howItWorks":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla aliquam, dui eu facilisis efficitur, enim dolor efficitur metus, quis tincidunt sapien eros eu elit. Vivamus id placerat felis. Phasellus ultrices est ac dictum lacinia. Donec congue, odio vitae tempus rhoncus, massa odio molestie est, vel dignissim nibh nisl vel lectus. Etiam sed dui leo. Suspendisse et nibh ligula. Aliquam dui lectus, elementum eget risus tincidunt, pretium suscipit odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed id mauris at quam consectetur vehicula. Duis vitae velit diam. Aenean consequat turpis a erat vehicula fermentum. Nunc vel purus posuere, auctor magna at, ornare ex.",
  },
  {
    "title": "Self improvement program",
    "usefulFor":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla aliquam, dui eu facilisis efficitur, enim dolor efficitur metus, quis tincidunt sapien eros eu elit. Vivamus id placerat felis. Phasellus ultrices est ac dictum lacinia. Donec congue, odio vitae tempus rhoncus, massa odio molestie est, vel dignissim nibh nisl vel lectus. Etiam sed dui leo. Suspendisse et nibh ligula. Aliquam dui lectus, elementum eget risus tincidunt, pretium suscipit odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed id mauris at quam consectetur vehicula. Duis vitae velit diam. Aenean consequat turpis a erat vehicula fermentum. Nunc vel purus posuere, auctor magna at, ornare ex.",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla aliquam, dui eu facilisis efficitur, enim dolor efficitur metus, quis tincidunt sapien eros eu elit. Vivamus id placerat felis. Phasellus ultrices est ac dictum lacinia. Donec congue, odio vitae tempus rhoncus, massa odio molestie est, vel dignissim nibh nisl vel lectus. Etiam sed dui leo. Suspendisse et nibh ligula. Aliquam dui lectus, elementum eget risus tincidunt, pretium suscipit odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed id mauris at quam consectetur vehicula. Duis vitae velit diam. Aenean consequat turpis a erat vehicula fermentum. Nunc vel purus posuere, auctor magna at, ornare ex.",
    "howItWorks":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla aliquam, dui eu facilisis efficitur, enim dolor efficitur metus, quis tincidunt sapien eros eu elit. Vivamus id placerat felis. Phasellus ultrices est ac dictum lacinia. Donec congue, odio vitae tempus rhoncus, massa odio molestie est, vel dignissim nibh nisl vel lectus. Etiam sed dui leo. Suspendisse et nibh ligula. Aliquam dui lectus, elementum eget risus tincidunt, pretium suscipit odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed id mauris at quam consectetur vehicula. Duis vitae velit diam. Aenean consequat turpis a erat vehicula fermentum. Nunc vel purus posuere, auctor magna at, ornare ex.",
  },
  {
    "title": "Local Bandhu program",
    "usefulFor":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla aliquam, dui eu facilisis efficitur, enim dolor efficitur metus, quis tincidunt sapien eros eu elit. Vivamus id placerat felis. Phasellus ultrices est ac dictum lacinia. Donec congue, odio vitae tempus rhoncus, massa odio molestie est, vel dignissim nibh nisl vel lectus. Etiam sed dui leo. Suspendisse et nibh ligula. Aliquam dui lectus, elementum eget risus tincidunt, pretium suscipit odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed id mauris at quam consectetur vehicula. Duis vitae velit diam. Aenean consequat turpis a erat vehicula fermentum. Nunc vel purus posuere, auctor magna at, ornare ex.",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla aliquam, dui eu facilisis efficitur, enim dolor efficitur metus, quis tincidunt sapien eros eu elit. Vivamus id placerat felis. Phasellus ultrices est ac dictum lacinia. Donec congue, odio vitae tempus rhoncus, massa odio molestie est, vel dignissim nibh nisl vel lectus. Etiam sed dui leo. Suspendisse et nibh ligula. Aliquam dui lectus, elementum eget risus tincidunt, pretium suscipit odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed id mauris at quam consectetur vehicula. Duis vitae velit diam. Aenean consequat turpis a erat vehicula fermentum. Nunc vel purus posuere, auctor magna at, ornare ex.",
    "howItWorks":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla aliquam, dui eu facilisis efficitur, enim dolor efficitur metus, quis tincidunt sapien eros eu elit. Vivamus id placerat felis. Phasellus ultrices est ac dictum lacinia. Donec congue, odio vitae tempus rhoncus, massa odio molestie est, vel dignissim nibh nisl vel lectus. Etiam sed dui leo. Suspendisse et nibh ligula. Aliquam dui lectus, elementum eget risus tincidunt, pretium suscipit odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed id mauris at quam consectetur vehicula. Duis vitae velit diam. Aenean consequat turpis a erat vehicula fermentum. Nunc vel purus posuere, auctor magna at, ornare ex.",
  },
  {
    "title": "Dheya.com program",
    "usefulFor":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla aliquam, dui eu facilisis efficitur, enim dolor efficitur metus, quis tincidunt sapien eros eu elit. Vivamus id placerat felis. Phasellus ultrices est ac dictum lacinia. Donec congue, odio vitae tempus rhoncus, massa odio molestie est, vel dignissim nibh nisl vel lectus. Etiam sed dui leo. Suspendisse et nibh ligula. Aliquam dui lectus, elementum eget risus tincidunt, pretium suscipit odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed id mauris at quam consectetur vehicula. Duis vitae velit diam. Aenean consequat turpis a erat vehicula fermentum. Nunc vel purus posuere, auctor magna at, ornare ex.",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla aliquam, dui eu facilisis efficitur, enim dolor efficitur metus, quis tincidunt sapien eros eu elit. Vivamus id placerat felis. Phasellus ultrices est ac dictum lacinia. Donec congue, odio vitae tempus rhoncus, massa odio molestie est, vel dignissim nibh nisl vel lectus. Etiam sed dui leo. Suspendisse et nibh ligula. Aliquam dui lectus, elementum eget risus tincidunt, pretium suscipit odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed id mauris at quam consectetur vehicula. Duis vitae velit diam. Aenean consequat turpis a erat vehicula fermentum. Nunc vel purus posuere, auctor magna at, ornare ex.",
    "howItWorks":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla aliquam, dui eu facilisis efficitur, enim dolor efficitur metus, quis tincidunt sapien eros eu elit. Vivamus id placerat felis. Phasellus ultrices est ac dictum lacinia. Donec congue, odio vitae tempus rhoncus, massa odio molestie est, vel dignissim nibh nisl vel lectus. Etiam sed dui leo. Suspendisse et nibh ligula. Aliquam dui lectus, elementum eget risus tincidunt, pretium suscipit odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed id mauris at quam consectetur vehicula. Duis vitae velit diam. Aenean consequat turpis a erat vehicula fermentum. Nunc vel purus posuere, auctor magna at, ornare ex.",
  },
];

Future<List<ProgramModel>> getPrograms() async {
  var data = await FirebaseFirestore.instance.collection("programs").get();
  return data.docs.map((e) => ProgramModel.fromMap(e.data())).toList();
}

class ProgramsView extends StatelessWidget {
  const ProgramsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mentorspace programs"),
      ),
      body: FutureBuilder(
        future: getPrograms(),
        builder: (context, AsyncSnapshot<List<ProgramModel>> snapshot) {
          if (snapshot.hasData) {
            print('snapshot has data');
            final programs = snapshot.data!;
            if (programs.isNotEmpty) {
              print('snapshot is not empty');
              return Center(
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
              );
            }
          }
          print('snapshot doesnt have data');
          return Container();
        },
      ),
    );
  }
}
