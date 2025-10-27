import 'package:dei_champions/ui/pages/profile/edit_profile_components/edit_work_experience_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../models/profile/edit_profile/education_info_model.dart';
import '../../../../models/profile/edit_profile/profile_model.dart';
import '../../../../models/profile/edit_profile/work_experience_model.dart';
import '../../../../models/state_models/profile/profile_state.dart';
import '../../../../ui/pages/profile/edit_profile_components/edit_education_info.dart';
import '../../../../utils/download_resume.dart';


class CandidateProfileController extends StateNotifier<ProfileState> {
  CandidateProfileController() : super(ProfileState.initial()) {
    fetchInitialProfileData();
  }




  @override
  void dispose() {
    debugPrint("🔥 CandidateProfileController disposed");


    if (state.educationEntries != null) {
      for (var entry in state.educationEntries!) {
        entry.dispose();
      }
    }
    if (state.workExpEntries != null) {
      for (var entry in state.workExpEntries!) {
        entry.dispose();
      }
    }

    super.dispose();
  }

  // Get selected skills directly from the model
  List<String> get selectedSkills => state.profileData?.skillsInfo ?? [];



  void fetchInitialProfileData() {
    // Sample initial skill list
    final initialSkills = [
      "php",
      "html",
      "Mobile",
      "Web",
      "API",
      "Firebase",
      "Design Systems",
      "Typography",
      "Color Theory",
      "Accessibility (a11y)",
    ];
    final List<WorkExperienceInfoModel> workExperiences = [
      WorkExperienceInfoModel(
        companyName: 'Google',
        position: 'Software Engineer',
        startDate: DateTime(2020, 5, 1),
        endDate: DateTime(2022, 8, 31),
        isCurrentlyWorking: false,
        description: 'Worked on scalable backend services and cloud infrastructure.',
      ),
      WorkExperienceInfoModel(
        companyName: 'Amazon',
        position: 'Backend Developer',
        startDate: DateTime(2018, 2, 15),
        endDate: DateTime(2020, 4, 30),
        isCurrentlyWorking: false,
        description: 'Maintained microservices and improved API performance.',
      ),
      WorkExperienceInfoModel(
        companyName: 'Meta',
        position: 'Senior Software Engineer',
        startDate: DateTime(2022, 9, 1),
        endDate: null,
        isCurrentlyWorking: true,
        description: 'Leading a team building AI-powered social media tools.',
      ),
    ];
    // Generate corresponding controllers list
    final workExpControllers = workExperiences.map((exp) {
      final controller = WorkExperienceEntryControllers();
      controller.companyController.text = exp.companyName ?? '';
      controller.positionController.text = exp.position ?? '';
      controller.descriptionController.text = exp.description ?? '';

      // Format the date to "MMM - yyyy" if needed
      if (exp.startDate != null) {
        controller.startDateController.text =
            DateFormat('MMM - yyyy').format(exp.startDate!);
      }

      if (exp.endDate != null) {
        controller.endDateController.text =
            DateFormat('MMM - yyyy').format(exp.endDate!);
      } else if (exp.isCurrentlyWorking == true) {
        controller.endDateController.text = 'Present';
      }

      return controller;
    }).toList();
    final List<EducationInfoModel> educationData = [
      EducationInfoModel(
        degree: 'Bachelor of Computer Science',
        institution: 'Stanford University',
        graduationYear: 2018,
      ),
      EducationInfoModel(
        degree: 'Master of Information Technology',
        institution: 'Massachusetts Institute of Technology',
        graduationYear: 2020,
      ),
      EducationInfoModel(
        degree: 'PhD in Artificial Intelligence',
        institution: 'Carnegie Mellon University',
        graduationYear: 2024,
      ),
    ];
    final educationControllers = educationData.map((edu) {
      final controller = EducationEntryControllers();
      controller.degreeController.text = edu.degree ?? '';
      controller.institutionController.text = edu.institution ?? '';
      controller.graduationYearController.text =
          edu.graduationYear?.toString() ?? '';
      return controller;
    }).toList();


    state = state.copyWith(
      profileData: (state.profileData ?? ProfileModel()).copyWith(
        skillsInfo: initialSkills,workExperience: workExperiences,education: educationData
      ),
      workExpEntries: workExpControllers,
      educationEntries: educationControllers,
    );
  }

  /// View resume — open PDF/doc viewer (implement later)
  void downloadResumeFromUrl() {
    const resumeUrl = 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf';
    downloadResume(resumeUrl);
  }


}
