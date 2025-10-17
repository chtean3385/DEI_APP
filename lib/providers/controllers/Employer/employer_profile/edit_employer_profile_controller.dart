import 'package:dei_champions/ui/pages/profile/edit_profile_components/edit_work_experience_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../models/profile/edit_profile/education_info_model.dart';
import '../../../../models/profile/edit_profile/profile_model.dart';
import '../../../../models/profile/edit_profile/work_experience_model.dart';
import '../../../../models/state_models/profile/profile_state.dart';
import '../../../../ui/pages/profile/edit_profile_components/edit_education_info.dart';
import '../../../../widgets/pickers/image_picker.dart';



class EditEmployerProfileController extends StateNotifier<ProfileState> {
  EditEmployerProfileController() : super(ProfileState.initial()) {
    // getChefData();
    fetchInitialProfileData();
  }

  // final ChefService _chefService = ChefService();
  /// basic info
  final nameController = TextEditingController();
  final joinedDateController = TextEditingController();
  final contactPersonController = TextEditingController();
  final websiteController = TextEditingController();
  final tagController = TextEditingController();
  final companySizeController = TextEditingController();

  /// contact info
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final pinCodeController = TextEditingController();
  /// People & Culture
  final peopleCultureController = TextEditingController();
  /// Recruitments
  final recruitmentsController = TextEditingController();
  /// about company
  final aboutCompanyController = TextEditingController();
  /// skill info
  final skillController = TextEditingController();
  /// job preference info
  final jobTypeController = TextEditingController();
  final salaryExpectedController = TextEditingController();
  final preferredLocationController = TextEditingController();


  @override
  void dispose() {
    debugPrint("🔥 EditEmployerProfileController disposed");
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    joinedDateController.dispose();
    contactPersonController.dispose();
    websiteController.dispose();
    tagController.dispose();
    companySizeController.dispose();

    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    countryController.dispose();
    pinCodeController.dispose();

    peopleCultureController.dispose();
    recruitmentsController.dispose();
    aboutCompanyController.dispose();

    jobTypeController.dispose();
    salaryExpectedController.dispose();
    preferredLocationController.dispose();

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




  void removeUrlGalleryImage(int index) {
    final currentProfile = state.profileData;
    if (currentProfile != null &&
        currentProfile.galleryImageUrls != null &&
        index < currentProfile.galleryImageUrls!.length) {
      final updatedUrls = List<String>.from(currentProfile.galleryImageUrls!);
      updatedUrls.removeAt(index);

      // update ProfileModel with new list
      final updatedProfile = currentProfile.copyWith(galleryImageUrls: updatedUrls);
      state = state.copyWith(profileData: updatedProfile);
    }
  }

  void removeLocalGalleryImage(int index) {
    if (state.galleryLocalImages != null && index < state.galleryLocalImages!.length) {
      final updatedLocal = List<XFile>.from(state.galleryLocalImages!);
      updatedLocal.removeAt(index);
      state = state.copyWith(galleryLocalImages: updatedLocal);
    }
  }


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
      // educationEntries: educationControllers,
    );
  }

  Future<void> pickProfileImage() async {
    final picked = await pickImageFromGalleryOrCamera(
      isCircleShape: false,
      isSquareCrop: true,
      ratio: CropAspectRatioPreset.square,

    );
    if (picked != null) {
      state = state.copyWith(profileFile: picked);
    }
  }
  Future<void> pickCoverImage() async {
    final picked = await pickImageFromGalleryOrCamera(
      isCircleShape: false,
      isSquareCrop: true,
      ratio: CropAspectRatioPreset.ratio16x9,
        isLockAspectRatio: false
    );
    if (picked != null) {
      state = state.copyWith(coverFile: picked);
    }
  }
  Future<void> pickGalleryImage() async {
    final picked = await pickImageFromGalleryOrCamera(
      isCircleShape: false,
      isSquareCrop: false,
      ratio: CropAspectRatioPreset.ratio16x9,
      isLockAspectRatio: false
    );
    if (picked != null) {
      final List<XFile> updatedLocalImages = [
        ...(state.galleryLocalImages ?? <XFile>[]),
        picked,
      ];
      state = state.copyWith(galleryLocalImages: updatedLocalImages);
    }
  }


}
