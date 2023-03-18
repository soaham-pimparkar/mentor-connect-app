import 'package:eyic/api/models/mentor_model.dart';
import 'package:eyic/global/colors.dart';
import 'package:flutter/material.dart';

import '../../../../api/models/mentee_model.dart';

class MentorListItem extends StatelessWidget {
  final MentorModel mentor;
  const MentorListItem(this.mentor, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.person,
        color: primary,
      ),
      title: Text(mentor.name),
      subtitle: Text(mentor.email),
    );
  }
}
