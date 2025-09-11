import 'package:flutter/material.dart';

import '../../../../constants/app_navigator.dart';
import '../../../../models/job/job_model.dart';
import '../../home/components/recommended_jobs/components/recommended_jobs_card.dart';

class SimilarJobsListView extends StatelessWidget {
  final List<JobModel> jobs;

  SimilarJobsListView({super.key, required this.jobs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jobs.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return RecommendedJobCard(
          jobModel: jobs[index],
          onTap: () => AppNavigator.loadJobDetailsScreen(jobs[index]),
        );
      },
    );
  }
}
