import 'package:dei_champions/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../jobs_you_might_like/jobs_card.dart';


/// 📌 "Jobs based on your profile" section
class JobsYouMightLike extends StatelessWidget {
  const JobsYouMightLike({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final jobs = [
      JobCard(
        title: "Software Engineer",
        company: "Wipro",
        image: "https://assets.streamlinehq.com/.../wipro-h69to9ubxsai6gq72cym27.png",
        location: "Bengaluru",
        posted: "1d ago",
        rating: 4.0,
      ),
      JobCard(
        title: "Backend Engineer",
        company: "Amazon",
        image: "https://img.icons8.com/color/96/000000/amazon.png",
        location: "Hyderabad",
        posted: "1d ago",
        rating: 4.5,
      ),
      JobCard(
        title: "Cloud Specialist",
        company: "IBM",
        image: "https://img.icons8.com/color/96/000000/ibm.png",
        location: "Pune",
        posted: "3d ago",
        rating: 4.0,
      ),
      JobCard(
        title: "UI/UX Designer",
        company: "Meta",
        image: "https://img.icons8.com/color/96/000000/meta.png",
        location: "Remote",
        posted: "5d ago",
        rating: 3.8,
      ),
      JobCard(
        title: "Outbound Calling (WFH)",
        company: "NoBroker.com",
        image: "https://img.icons8.com/color/96/000000/google-logo.png",
        location: "Remote",
        posted: "2d ago",
        rating: 3.1,
      ),
    ];

    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // header row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text("Jobs you might like", style: theme.titleMedium),
                  const SizedBox(width: 6),
                  Text(
                    "(54)",
                    style: theme.titleMedium?.copyWith(color: Colors.black45),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View all",
                      style: theme.bodySmall?.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // horizontal list
            SizedBox(
              height: 190,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: jobs.length + 1, // add extra card for "View all"
                itemBuilder: (context, index) {
                  if (index < jobs.length) {
                    return jobs[index];
                  } else {
                    // special "View all jobs" card
                    return SizedBox(
                      width: 180,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(width: 1, color: Colors.black12),
                        ),
                        elevation: 0,
                        margin: const EdgeInsets.only(right: 12),
                        color: Colors.white,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            // navigate to jobs list
                          },
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "View all 50 jobs",
                                  style: theme.labelMedium?.copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                SizedBox(width: 6),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14,
                                  color: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
