import 'package:flutter/material.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Contact Us"),
          ),
        );
      },
    );
  }
}
