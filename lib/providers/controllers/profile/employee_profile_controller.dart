import 'package:dei_champions/ui/pages/profile/edit_profile_components/edit_work_experience_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/enums.dart';
import '../../../models/common/base_model.dart';
import '../../../models/profile/edit_profile/education_info_model.dart';
import '../../../models/profile/edit_profile/work_experience_model.dart';
import '../../../models/profile/employee_user_model/employee_user_model.dart';
import '../../../models/state_models/profile/employee_profile_state.dart';
import '../../../networks/api_urls.dart';
import '../../../service/employee_profile/employee_profile_service.dart';
import '../../../ui/pages/profile/edit_profile_components/edit_education_info.dart';
import '../../../widgets/others/snack_bar.dart';
import '../../../widgets/pickers/file_picker.dart';
import '../../../widgets/pickers/image_picker.dart';


class EmployeeProfileController extends StateNotifier<EmployeeProfileState> {
  EmployeeProfileController() : super(EmployeeProfileState.initial()) {
    // getChefData();
    getEmployeeProfileData();
    // fetchInitialProfileData();
    // addEducationEntry();
  }

  final EmployeeProfileService _employeeProfileService = EmployeeProfileService();



  @override
  void dispose() {
    debugPrint("🔥 EmployeeProfileController disposed");

    super.dispose();
  }

  // Get selected skills directly from the model
  // List<String> get selectedSkills => state.profileData?.skills ?? [];

  // Add skill
  // void addSkill(String skill) {
  //   if (skill.isEmpty) return;
  //
  //   final currentSkills = List<String>.from(selectedSkills);
  //
  //   if (!currentSkills.contains(skill)) {
  //     currentSkills.add(skill);
  //
  //     state = state.copyWith(
  //       profileData: (state.profileData ?? EmployeeUserModel()).copyWith(
  //         skills: currentSkills,
  //       ),
  //     );
  //   }
  //
  //   skillController.clear();
  // }
  //
  // // Remove skill
  // void removeSkill(String skill) {
  //   final currentSkills = List<String>.from(selectedSkills);
  //
  //   currentSkills.remove(skill);
  //
  //   state = state.copyWith(
  //     profileData: (state.profileData ?? EmployeeUserModel()).copyWith(
  //       skills: currentSkills,
  //     ),
  //   );
  // }

  // void addEducationEntry() {
  //   final newList = List<EducationEntryControllers>.from(
  //     state.educationEntries ?? [],
  //   )..add(EducationEntryControllers());
  //
  //   state = state.copyWith(educationEntries: newList);
  // }
  //
  // void addWorkExpEntry() {
  //   final newList = List<WorkExperienceEntryControllers>.from(
  //     state.workExpEntries ?? [],
  //   )..add(WorkExperienceEntryControllers());
  //
  //   state = state.copyWith(workExpEntries: newList);
  // }
  //
  // void removeWorkExpEntry(int index) {
  //   final newList = List<WorkExperienceEntryControllers>.from(
  //     state.workExpEntries ?? [],
  //   )..removeAt(index);
  //
  //   state = state.copyWith(workExpEntries: newList);
  // }

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
      profileData: (state.profileData ?? EmployeeUserModel()).copyWith(
        // skills: initialSkills,workExperience: workExperiences,education: educationData
      ),
      workExpEntries: workExpControllers,
      educationEntries: educationControllers,
    );
  }


  /// 🔹 Call this to update chef data locally from anywhere
  // void setChefData(ChefModel updatedChef) {
  //   state = state.copyWith(chefData: updatedChef);
  // }
  // void resetData() {
  //   nameController.text = state.chefData?.name ?? '';
  //   kitchenNameController.text = state.chefData?.kitchenName ?? '';
  //   shopPlotController.text = state.chefData?.shopPlotNumber ?? '';
  //   floorController.text = state.chefData?.floor ?? '';
  //   buildingNameController.text = state.chefData?.buildingName ?? '';
  //   cityController.text = state.chefData?.city ?? '';
  //   aboutController.text = state.chefData?.aboutChef ?? '';
  //   pinCodeController.text = state.chefData?.pincode?.toString() ?? '';
  // }

  /// 🔹 Call this to employee profile  data from API call
  Future<void> getEmployeeProfileData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _employeeProfileService.getEmployeeProfileDetails();
      final EmployeeUserModel userModel = await EmployeeUserModel.fromJson(result);
      state = state.copyWith(pageState: PageState.success, profileData: userModel);
      debugPrint("success - getEmployeeProfileData");
    } catch (e) {
      state = state.copyWith(pageState: PageState.error);
      showSnackBar(e.toString());
      debugPrint("catch - getEmployeeProfileData");
      debugPrint(e.toString());
    }
  }



}

Future<void> viewResumeFromUrl(String? url) async {
  if (url == null || url.trim().isEmpty) {
    showSnackBar("Resume URL is missing.");
    return;
  }

  // Ensure full URL
  String fullUrl = url.startsWith('http')
      ? url
      : '${ApiUrls.baseUrl}$url';

  print("Opening resume URL: $fullUrl");

  try {
    final uri = Uri.tryParse(fullUrl);

    if (uri == null || !(uri.isAbsolute)) {
      showSnackBar("Invalid resume link.");
      return;
    }

    final canLaunch = await canLaunchUrl(uri);
    if (!canLaunch) {
      showSnackBar("Unable to open resume link.");
      return;
    }

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } catch (e) {
    debugPrint("Error opening resume: $e");
    showSnackBar("Failed to open resume. Please try again.");
  }
}
