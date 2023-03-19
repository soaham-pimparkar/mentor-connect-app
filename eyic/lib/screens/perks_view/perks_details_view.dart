// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eyic/api/models/perks_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PerksDetailView extends StatelessWidget {
  final PerksModel perk;
  const PerksDetailView({
    Key? key,
    required this.perk,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: 200,
            child: Image.network(
              "https://images.unsplash.com/photo-1495314736024-fa5e4b37b979?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1173&q=80",
            ),
          ),
          ListTile(
            title: Text("Company name :"),
            subtitle: Text(perk.companyName),
          ),
          ListTile(
            title: Text("description:"),
            subtitle: Text(perk.description),
          ),
          ListTile(
            title: Text("Offer details:"),
            subtitle: Text(perk.offerDetails),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async{
                  await launchUrlString(perk.link);
                },
                child: Text("Redeem"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
