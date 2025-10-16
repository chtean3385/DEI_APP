// import 'package:flutter/material.dart';
//
// import '../../../../constants/app_navigator.dart';
// import '../../../../models/job/job_model.dart';
// import '../../home/components/recommended_jobs/components/recommended_jobs_card.dart';
//
// class SimilarJobsListView extends StatelessWidget {
//   final List<JobModel> jobs;
//   final bool enableScroll;
//
//   SimilarJobsListView({super.key, required this.jobs,this.enableScroll = false});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: jobs.length,
//       shrinkWrap: true,
//       padding:enableScroll ? const EdgeInsets.symmetric(horizontal: 12) :EdgeInsets.zero,
//       physics: enableScroll ? AlwaysScrollableScrollPhysics(): NeverScrollableScrollPhysics(),
//       itemBuilder: (context, index) {
//         return RecommendedJobCard(
//           showSave: true,
//           jobModel: jobs[index],
//           onTap: () => AppNavigator.loadJobDetailsScreen(jobs[index],isFromSearch: enableScroll),
//         );
//       },
//     );
//   }
// }
