import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../models/job/job_model.dart';
import 'invites_job_card.dart';

class InvitesJobList extends StatelessWidget {
  InvitesJobList({super.key});

  final List<JobModel> jobs = [
    JobModel(
      title: "UI/UX Designer",
      companyName: "Meta",
      location: "Remote",
      experience: "1-4 yrs",
      salary: "3 - 6 Lacs PA",
      skills: ["UI Design", "UX Design", "Figma", "Adobe XD"],
      vacancies: "2 vacancies",
      postedTime: "5d ago",
      logoUrl: "https://img.icons8.com/color/96/000000/meta.png",
      rating: 3.8,
      hasAwards: true,
      hasReviews: false,
      hasBenefits: true,
      hasVerifiedBenefits: false,
      hasSalaryInsights: true,
      reviews: "1.4K+",
      postedDate: "27 Aug",
      isWalkIn: true,
    ),
    JobModel(
      title: "Outbound Calling (WFH)",
      companyName: "NoBroker.com",
      location: "Remote",
      experience: "0-2 yrs",
      salary: "1.5 - 3 Lacs PA",
      skills: ["Communication", "Sales", "Customer Service", "Telecalling"],
      vacancies: "10 vacancies",
      postedTime: "2d ago",
      logoUrl: "https://img.icons8.com/color/96/000000/google-logo.png",
      rating: 3.1,
      hasAwards: false,
      hasReviews: true,
      hasBenefits: false,
      hasVerifiedBenefits: false,
      hasSalaryInsights: true,
      reviews: "1.4K+",
      postedDate: "27 Aug",
      isWalkIn: true,
    ),
    JobModel(
      title: "Software Engineer",
      companyName: "Wipro",
      location: "Bengaluru",
      experience: "1-3 yrs",
      salary: "3 - 5 Lacs PA",
      skills: ["Software Engineering", "Programming", "Development"],
      vacancies: "Multiple",
      postedTime: "1d ago",
      logoUrl:
          "https://assets.streamlinehq.com/.../wipro-h69to9ubxsai6gq72cym27.png",
      rating: 4.0,
      hasAwards: true,
      hasReviews: true,
      hasBenefits: true,
      hasVerifiedBenefits: true,
      hasSalaryInsights: false,
      reviews: "1.4K+",
      postedDate: "27 Aug",
      isWalkIn: true,
    ),
    JobModel(
      title: "Backend Engineer",
      companyName: "Amazon",
      location: "Hyderabad",
      experience: "2-4 yrs",
      salary: "4 - 7 Lacs PA",
      skills: ["Backend Development", "API", "Microservices", "Database"],
      vacancies: "5 vacancies",
      postedTime: "1d ago",
      logoUrl: "https://img.icons8.com/color/96/000000/amazon.png",
      rating: 4.5,
      hasAwards: false,
      hasReviews: true,
      hasBenefits: true,
      hasVerifiedBenefits: true,
      hasSalaryInsights: true,
      reviews: "1.4K+",
      postedDate: "27 Aug",
      isWalkIn: true,
    ),
    JobModel(
      title: "Cloud Specialist",
      companyName: "IBM",
      location: "Pune",
      experience: "2-5 yrs",
      salary: "5 - 8 Lacs PA",
      skills: ["Cloud Computing", "AWS", "Azure", "DevOps"],
      vacancies: "3 vacancies",
      postedTime: "3d ago",
      logoUrl: "https://img.icons8.com/color/96/000000/ibm.png",
      rating: 4.0,
      hasAwards: true,
      hasReviews: false,
      hasBenefits: false,
      hasVerifiedBenefits: true,
      hasSalaryInsights: true,
      reviews: "1.4K+",
      postedDate: "27 Aug",
      isWalkIn: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: jobs.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InvitesJobCard(job: jobs[index],
          onTap: ()=>AppNavigator.loadJobInviteDetailsScreen(jobs[index]),
        );
      },
      separatorBuilder: (context, index) => gapH16(),
    );
  }
}
