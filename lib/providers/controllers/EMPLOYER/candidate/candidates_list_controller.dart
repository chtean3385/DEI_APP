import 'package:dei_champions/models/employer/candidate_model.dart';
import 'package:dei_champions/models/state_models/employer/candidates_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';

class CandidatesController extends StateNotifier<CandidatesState> {
  CandidatesController() : super(CandidatesState.initial()) {
    fetchData();
  }

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
  final List<String> filters = ["Title", "Date", "Salary"];

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = sampleCandidates;
      state = state.copyWith(pageState: PageState.success, data: result);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch CandidatesController  fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }

  /// 🔹 Apply filtering based on selected filter
  void applyFilter(String filter) {
    List<CandidateModel> sorted = [...?state.data];

    switch (filter) {
      case "Title":
        sorted.sort((a, b) => a.title.compareTo(b.title));
        break;
      case "Salary":
        sorted.sort(
          (b, a) => a.hourlyRate.compareTo(b.hourlyRate),
        ); // high → low
        break;
      case "Date":
        // Since sample data uses text like "5 mins ago", we’ll simulate sort
        sorted = List.from(sorted.reversed);
        break;
    }

    state = state.copyWith(data: sorted);
  }
}
