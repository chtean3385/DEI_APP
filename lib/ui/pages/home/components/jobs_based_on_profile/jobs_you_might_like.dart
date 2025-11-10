// import 'package:dei_champions/constants/app_colors.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../../constants/app_navigator.dart';
// import '../../../../../models/job/job_model.dart';
// import '../../../../../widgets/others/view_all_button.dart';
// import '../jobs_you_might_like/jobs_card.dart';
//
// /// 📌 "Jobs based on your profile" section
// class JobsYouMightLike extends StatelessWidget {
//   const JobsYouMightLike({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;
//
//     final List<JobModel> jobs = [
//       JobModel(
//         title: "UI/UX Designer",
//         companyName: "Meta",
//         location: "Remote",
//         experience: "1-4 yrs",
//         salary: "3 - 6 Lacs PA",
//         skills: ["UI Design", "UX Design", "Figma", "Adobe XD"],
//         vacancies: "2 vacancies",
//         postedTime: "5d ago",
//         logoUrl: "https://img.icons8.com/color/96/000000/meta.png",
//         rating: 3.8,
//         hasAwards: true,
//         hasReviews: false,
//         hasBenefits: true,
//         hasVerifiedBenefits: false,
//         hasSalaryInsights: true,
//       ),
//       JobModel(
//         title: "Outbound Calling (WFH)",
//         companyName: "NoBroker.com",
//         location: "Remote",
//         experience: "0-2 yrs",
//         salary: "1.5 - 3 Lacs PA",
//         skills: ["Communication", "Sales", "Customer Service", "Telecalling"],
//         vacancies: "10 vacancies",
//         postedTime: "2d ago",
//         logoUrl: "https://img.icons8.com/color/96/000000/google-logo.png",
//         rating: 3.1,
//         hasAwards: false,
//         hasReviews: true,
//         hasBenefits: false,
//         hasVerifiedBenefits: false,
//         hasSalaryInsights: true,
//       ),
//       JobModel(
//         title: "Software Engineer",
//         companyName: "Wipro",
//         location: "Bengaluru",
//         experience: "1-3 yrs",
//         salary: "3 - 5 Lacs PA",
//         skills: ["Software Engineering", "Programming", "Development"],
//         vacancies: "Multiple",
//         postedTime: "1d ago",
//         logoUrl:
//         "https://assets.streamlinehq.com/.../wipro-h69to9ubxsai6gq72cym27.png",
//         rating: 4.0,
//         hasAwards: true,
//         hasReviews: true,
//         hasBenefits: true,
//         hasVerifiedBenefits: true,
//         hasSalaryInsights: false,
//       ),
//       JobModel(
//         title: "Backend Engineer",
//         companyName: "Amazon",
//         location: "Hyderabad",
//         experience: "2-4 yrs",
//         salary: "4 - 7 Lacs PA",
//         skills: ["Backend Development", "API", "Microservices", "Database"],
//         vacancies: "5 vacancies",
//         postedTime: "1d ago",
//         logoUrl: "https://img.icons8.com/color/96/000000/amazon.png",
//         rating: 4.5,
//         hasAwards: false,
//         hasReviews: true,
//         hasBenefits: true,
//         hasVerifiedBenefits: true,
//         hasSalaryInsights: true,
//       ),
//       JobModel(
//         title: "Cloud Specialist",
//         companyName: "IBM",
//         location: "Pune",
//         experience: "2-5 yrs",
//         salary: "5 - 8 Lacs PA",
//         skills: ["Cloud Computing", "AWS", "Azure", "DevOps"],
//         vacancies: "3 vacancies",
//         postedTime: "3d ago",
//         logoUrl: "https://img.icons8.com/color/96/000000/ibm.png",
//         rating: 4.0,
//         hasAwards: true,
//         hasReviews: false,
//         hasBenefits: false,
//         hasVerifiedBenefits: true,
//         hasSalaryInsights: true,
//       ),
//     ];
//
//
//     return ColoredBox(
//       color: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.only(bottom: 24, top: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // header row
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 children: [
//                   Text("Jobs you might like", style: theme.titleMedium),
//                   const SizedBox(width: 6),
//                   Text(
//                     "(54)",
//                     style: theme.titleMedium?.copyWith(color: Colors.black45),
//                   ),
//                   const Spacer(),
//                   ViewAllButton(
//                     onPressed: () => AppNavigator.loadRecommendedJobsScreen(
//                       initialCategoryId: 3,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 8),
//
//             // horizontal list
//             SizedBox(
//               height: 190,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 itemCount: jobs.length + 1, // add extra card for "View all"
//                 itemBuilder: (context, index) {
//                   if (index < jobs.length) {
//                     return RecommendedJobCard(
//                       jobModel: jobs[index],
//                       onTap: () =>
//                           AppNavigator.loadJobDetailsScreen(jobModel: jobs[index]),
//                     );
//                   } else {
//                     // special "View all jobs" card
//                     return SizedBox(
//                       width: 180,
//                       child: Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           side: BorderSide(width: 1, color: Colors.black12),
//                         ),
//                         elevation: 0,
//                         margin: const EdgeInsets.only(right: 12),
//                         color: Colors.white,
//                         child: InkWell(
//                           borderRadius: BorderRadius.circular(12),
//                           onTap: () {
//                             // navigate to jobs list
//                           },
//                           child: Center(
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Text(
//                                   "View all 50 jobs",
//                                   style: theme.labelMedium?.copyWith(
//                                     color: AppColors.primaryColor,
//                                   ),
//                                 ),
//                                 SizedBox(width: 6),
//                                 Icon(
//                                   Icons.arrow_forward_ios,
//                                   size: 14,
//                                   color: AppColors.primaryColor,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
