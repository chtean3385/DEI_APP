import 'package:dei_champions/constants/app_styles.dart';
import 'package:flutter/material.dart';

import 'component/invite_top_options.dart';
import 'component/invites_job_list.dart';

class InvitesScreen extends StatelessWidget {
  const InvitesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          gapH16(),
          TopChipsRow(),
          gapH16(),
          InvitesJobList()
        ],
      ),
    );
  }
}
