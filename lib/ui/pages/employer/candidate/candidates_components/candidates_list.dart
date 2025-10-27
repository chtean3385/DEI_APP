import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/models/employer/candidate_model.dart';
import 'package:dei_champions/widgets/others/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'candidate_card.dart';

class CandidatesListView extends ConsumerWidget {
  CandidatesListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<CandidateModel> sampleCandidates = [
      CandidateModel(
        title: "Full Stack Engineer",
        companyName: "Labyrinth",
        logoUrl: "https://cdn-icons-png.flaticon.com/512/1055/1055646.png",
        location: "New York, US",
        jobType: "Part time",
        postedTime: "5 mins ago",
        hourlyRate: 800,
        skills: ["React", "NodeJS"],
      ),
      CandidateModel(
        title: "UI / UX Designer",
        companyName: "Designify",
        logoUrl: "https://cdn-icons-png.flaticon.com/512/2111/2111628.png",
        location: "New York, US",
        jobType: "Fulltime",
        postedTime: "4 mins ago",
        hourlyRate: 500,
        skills: ["Adobe XD", "Figma", "Photoshop"],
      ),
      CandidateModel(
        title: "Lead Quality Control QA",
        companyName: "TestLab",
        logoUrl: "https://cdn-icons-png.flaticon.com/512/5968/5968350.png",
        location: "New York, US",
        jobType: "Fulltime",
        postedTime: "6 mins ago",
        hourlyRate: 250,
        skills: ["iOS", "Laravel", "Golang"],
      ),
      CandidateModel(
        title: "Products Manager",
        companyName: "BizTech",
        logoUrl: "https://cdn-icons-png.flaticon.com/512/2721/2721267.png",
        location: "New York, US",
        jobType: "Fulltime",
        postedTime: "6 mins ago",
        hourlyRate: 250,
        skills: ["ASP.Net", "Figma"],
      ),
      CandidateModel(
        title: "Senior System Engineer",
        companyName: "FlyChat",
        logoUrl: "https://cdn-icons-png.flaticon.com/512/5969/5969020.png",
        location: "New York, US",
        jobType: "Part time",
        postedTime: "5 mins ago",
        hourlyRate: 800,
        skills: ["PHP", "Android"],
      ),
      CandidateModel(
        title: "React Native Web Developer",
        companyName: "RCode Labs",
        logoUrl: "https://cdn-icons-png.flaticon.com/512/919/919851.png",
        location: "New York, US",
        jobType: "Fulltime",
        postedTime: "5 mins ago",
        hourlyRate: 500,
        skills: ["React Native", "Angular"],
      ),
      // 🔹 Additional examples
      CandidateModel(
        title: "Backend Engineer",
        companyName: "NextGen Tech",
        logoUrl: "https://cdn-icons-png.flaticon.com/512/5968/5968381.png",
        location: "San Francisco, US",
        jobType: "Remote",
        postedTime: "10 mins ago",
        hourlyRate: 600,
        skills: ["Django", "PostgreSQL", "Docker"],
      ),
      CandidateModel(
        title: "Mobile App Developer",
        companyName: "AppCrafters",
        logoUrl: "https://cdn-icons-png.flaticon.com/512/732/732212.png",
        location: "Toronto, CA",
        jobType: "Contract",
        postedTime: "12 mins ago",
        hourlyRate: 700,
        skills: ["Flutter", "Firebase", "REST API"],
      ),
    ];

    return sampleCandidates.isNotEmpty == true
        ? ListView.separated(
            itemCount: sampleCandidates.length ?? 0,
            padding: EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return CandidateCard(
                candidateModel: sampleCandidates[index],
                // onTap: ()=>AppNavigator.loadJobDetailsScreen(state.data![index]),
              );
            },
            separatorBuilder: (context, index) => gapH16(),
          )
        : EmptyWidget();
  }
}
