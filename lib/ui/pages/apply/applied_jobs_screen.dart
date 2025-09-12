import 'package:dei_champions/constants/app_styles.dart';
import 'package:flutter/material.dart';

import 'components/applied_jobs_list_view.dart';


class AppliedJobsScreen extends StatelessWidget {
  const AppliedJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          gapH16(),
          AppliedJobListView()
        ],
      ),
    );
  }
}
