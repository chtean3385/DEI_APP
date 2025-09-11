import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/ui/pages/home/components/recommended_jobs/components/recommended_jobs_card.dart';
import 'package:flutter/material.dart';

import '../../../../../../models/job/job_model.dart';

class RecommendedJobsListView extends StatelessWidget {
  final List<JobModel> jobs;

  RecommendedJobsListView({super.key, required this.jobs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jobs.length,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemBuilder: (context, index) {
        return RecommendedJobCard(jobModel: jobs[index],onTap:()=> AppNavigator.loadJobDetailsScreen(jobs[index]));
      },
    );
  }
}
