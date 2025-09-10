import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import '../../../../../models/job/job_model.dart';
import '../../../../../widgets/others/custom_theme_button.dart';
import 'components/custom_tab_bar.dart';
import 'components/job_apply_bottom_bar.dart';
import 'components/recommended_jobs_view.dart';

class RecommendedJobsScreen extends StatelessWidget {
  final int initialCategoryId;

  RecommendedJobsScreen({Key? key, this.initialCategoryId = 0}) : super(key: key);
  final ValueNotifier<List<JobModel>> jobsNotifier = ValueNotifier(jobs);
  final categories = [
    {"id": 1, "title": "Profile", "count": "70"},
    {"id": 2, "title": "Recent Activity", "count": "25"},
    {"id": 3, "title": "You Might Like", "count": "50"},
    {"id": 4, "title": "Preferences", "count": "34"},
    {"id": 5, "title": "IT / Tech", "count": "75"},
    {"id": 6, "title": "Sales / Marketing", "count": "75"},
    {"id": 7, "title": "Operations", "count": "75"},
    {"id": 8, "title": "Core Engineering", "count": "75"},
    {"id": 9, "title": "Banking / Finance", "count": "75"},
    {"id": 10, "title": "Healthcare", "count": "75"},
    {"id": 11, "title": "HR / Admin", "count": "75"},
  ];
  static final List<JobModel> jobs = [
    JobModel(
      title: "45days WFH Malayalam, Telugu",
      companyName: "Teleperformance (TP)",
      location: "Remote",
      experience: "0-1 yrs",
      salary: "50,000 - 1.5 Lacs PA",
      skills: ["Telugu", "Malayalam", "Voice Process", "Voice", "Process"],
      vacancies: "10 vacancies",
      postedTime: "5d ago",
      logoUrl:
          "https://img.icons8.com/color/96/000000/briefcase.png", // Brillio placeholder
    ),
    JobModel(
      title: "WFH - Data Entry",
      companyName: "Creative Hands HR",
      location: "Hybrid - Chennai, Coimbatore, Bengaluru",
      experience: "0-5 yrs",
      salary: "2 - 4.5 Lacs PA",
      skills: ["Typing", "Back office", "Computer Operating", "Data Entry"],
      vacancies: "Multiple",
      postedTime: "4d ago",
      logoUrl:
          "https://img.icons8.com/color/96/000000/shopping-cart.png", // Bigbasket placeholder
    ),
    JobModel(
      title: "Pharmacist",
      companyName: "Narayana Hrudayalaya Pvt Ltd",
      location: "Bengaluru",
      experience: "0-3 yrs",
      salary: "Not disclosed",
      skills: ["Pharmacist", "Healthcare", "Medicine"],
      vacancies: "Not specified",
      postedTime: "2d ago",
      logoUrl:
          "https://img.icons8.com/color/96/000000/hospital-room.png", // Pristyn Care placeholder
    ),
    JobModel(
      title: "Flutter Developer",
      companyName: "Infosys",
      location: "Coimbatore",
      experience: "1-3 yrs",
      salary: "2 - 3 Lacs PA",
      skills: ["Flutter", "Dart", "Provider", "Firebase"],
      vacancies: "3 vacancies",
      postedTime: "28d ago",
      logoUrl:
          "https://img.icons8.com/color/96/000000/google-logo.png", // Tech Mahindra placeholder
    ),
    JobModel(
      title: "Java Backend Developer",
      companyName: "TCS",
      location: "Bengaluru",
      experience: "2-5 yrs",
      salary: "4 - 6 Lacs PA",
      skills: ["Java", "Spring Boot", "Microservices", "MySQL"],
      vacancies: "5 vacancies",
      postedTime: "10d ago",
      logoUrl: "https://img.icons8.com/color/96/000000/microsoft.png",
    ),
    JobModel(
      title: "Software Engineer - Node.js",
      companyName: "Wipro",
      location: "Hyderabad",
      experience: "1-4 yrs",
      salary: "3 - 5 Lacs PA",
      skills: ["Node.js", "Express", "MongoDB", "REST API"],
      vacancies: "2 vacancies",
      postedTime: "7d ago",
      logoUrl:
          "https://img.icons8.com/color/96/000000/ibm.png", // Tech Mahindra placeholder
    ),
    JobModel(
      title: "React Native Developer",
      companyName: "HCL",
      location: "Chennai",
      experience: "0-2 yrs",
      salary: "2 - 4 Lacs PA",
      skills: ["React Native", "JavaScript", "Redux", "API Integration"],
      vacancies: "4 vacancies",
      postedTime: "3d ago",
      logoUrl:
          "https://img.icons8.com/color/96/000000/briefcase.png", // Brillio placeholder
    ),
    JobModel(
      title: "Customer Support Executive",
      companyName: "Concentrix",
      location: "Remote",
      experience: "0-1 yrs",
      salary: "1.2 - 2 Lacs PA",
      skills: ["English", "Customer Service", "Communication"],
      vacancies: "15 vacancies",
      postedTime: "1d ago",
      logoUrl:
          "https://img.icons8.com/color/96/000000/shopping-cart.png", // Bigbasket placeholder
    ),
    JobModel(
      title: "Data Analyst",
      companyName: "Cognizant",
      location: "Pune",
      experience: "1-3 yrs",
      salary: "3 - 4.5 Lacs PA",
      skills: ["SQL", "Excel", "Python", "PowerBI"],
      vacancies: "2 vacancies",
      postedTime: "6d ago",
      logoUrl:
          "https://img.icons8.com/color/96/000000/amazon.png", // Tech Mahindra placeholder
    ),
    JobModel(
      title: "Android Developer",
      companyName: "Tech Mahindra",
      location: "Mumbai",
      experience: "1-4 yrs",
      salary: "3 - 5 Lacs PA",
      skills: ["Java", "Kotlin", "Android Studio", "Firebase"],
      vacancies: "3 vacancies",
      postedTime: "8d ago",
      logoUrl:
          "https://img.icons8.com/color/96/000000/meta.png", // Tech Mahindra logo
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: appBarCommon(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH16(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Recommended Jobs", style: theme.headlineMedium),
            ),
            gapH16(),
            CustomTabBar(
              filterItems: categories,
              initialId: initialCategoryId,
              onItemSelected: (_) {
                // 🔀 Shuffle jobs when tab tapped
                final shuffled = List<JobModel>.from(jobsNotifier.value)
                  ..shuffle();
                jobsNotifier.value = shuffled;
              },
            ),
            gapH16(),

            // Job list
            Expanded(
              child: ValueListenableBuilder<List<JobModel>>(
                valueListenable: jobsNotifier,
                builder: (_, jobs, __) => RecommendedJobsListView(jobs: jobs),
              ),
            ),

            // Bottom sticky buttons

            ApplyJobBottomBar(
              onClear: () => Navigator.pop(context),
              onApply: () {},
              selectedCount: 1,
            ),
            // Container(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 16.0,
            //     vertical: 12,
            //   ),
            //   decoration: BoxDecoration(
            //     border: Border(top: BorderSide(color: Colors.grey.shade200)),
            //   ),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: CustomThemeButton(
            //           child: Text(
            //             "Clear selection",
            //             style: theme.labelMedium?.copyWith(
            //               color: AppColors.primaryColor,
            //             ),
            //           ),
            //           radius: 30,
            //           onTap: () => Navigator.pop(context),
            //           isExpanded: true,
            //         ),
            //       ),
            //       const SizedBox(width: 12),
            //       Expanded(
            //         child: CustomThemeButton(
            //           child: Text(
            //             "Apply to all",
            //             style: theme.labelMedium?.copyWith(color: Colors.white),
            //           ),
            //           radius: 30,
            //           onTap: () {},
            //           isExpanded: true,
            //           color: AppColors.primaryColor,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
