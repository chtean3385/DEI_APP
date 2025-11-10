import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';

import 'components/recommended_jobs_view.dart';

class RecommendedJobsScreen extends StatelessWidget {
  const RecommendedJobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(title: "Recommended Jobs", titleStyleSmall: true),
      body: SafeArea(child: RecommendedJobsView()),
    );
  }
}
