import 'package:dei_champions/ui/pages/profile/edit_profile_components/edit_work_experience_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../../models/profile/edit_profile/profile_model.dart';
import '../../../models/state_models/profile/profile_state.dart';
import '../../../ui/pages/profile/edit_profile_components/edit_education_info.dart';
import '../../../widgets/pickers/file_picker.dart';
import '../../../widgets/pickers/image_picker.dart';

class EditProfileController extends StateNotifier<ProfileState> {
  EditProfileController() : super(ProfileState.initial()) {
    // getChefData();
    fetchInitialProfileData();
    addEducationEntry();
  }

  // final ChefService _chefService = ChefService();
  /// basic info
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();
  final workStatusController = TextEditingController();
  final descriptionController = TextEditingController();

  /// location info
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final pinCodeController = TextEditingController();

  /// skill info
  final skillController = TextEditingController();
  /// job preference info
  final jobTypeController = TextEditingController();
  final salaryExpectedController = TextEditingController();
  final preferredLocationController = TextEditingController();


  @override
  void dispose() {
    debugPrint("🔥 ChefProfileController disposed");
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    dobController.dispose();
    genderController.dispose();
    workStatusController.dispose();
    descriptionController.dispose();

    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    countryController.dispose();
    pinCodeController.dispose();

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

  // Get selected skills directly from the model
  List<String> get selectedSkills => state.profileData?.skillsInfo ?? [];

  // Add skill
  void addSkill(String skill) {
    if (skill.isEmpty) return;

    final currentSkills = List<String>.from(selectedSkills);

    if (!currentSkills.contains(skill)) {
      currentSkills.add(skill);

      state = state.copyWith(
        profileData: (state.profileData ?? ProfileModel()).copyWith(
          skillsInfo: currentSkills,
        ),
      );
    }

    skillController.clear();
  }

  // Remove skill
  void removeSkill(String skill) {
    final currentSkills = List<String>.from(selectedSkills);

    currentSkills.remove(skill);

    state = state.copyWith(
      profileData: (state.profileData ?? ProfileModel()).copyWith(
        skillsInfo: currentSkills,
      ),
    );
  }

  void addEducationEntry() {
    final newList = List<EducationEntryControllers>.from(
      state.educationEntries ?? [],
    )..add(EducationEntryControllers());

    state = state.copyWith(educationEntries: newList);
  }

  void removeEducationEntry(int index) {
    final newList = List<EducationEntryControllers>.from(
      state.educationEntries ?? [],
    )..removeAt(index);

    state = state.copyWith(educationEntries: newList);
  }
  void addWorkExpEntry() {
    final newList = List<WorkExperienceEntryControllers>.from(
      state.workExpEntries ?? [],
    )..add(WorkExperienceEntryControllers());

    state = state.copyWith(workExpEntries: newList);
  }

  void removeWorkExpEntry(int index) {
    final newList = List<WorkExperienceEntryControllers>.from(
      state.workExpEntries ?? [],
    )..removeAt(index);

    state = state.copyWith(workExpEntries: newList);
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

    state = state.copyWith(
      profileData: (state.profileData ?? ProfileModel()).copyWith(
        skillsInfo: initialSkills,
      ),
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

  /// 🔹 Call this to fetch chef data from API call
  // Future<void> getChefData() async {
  //   state = state.copyWith(pageState: PageState.loading);
  //   try {
  //     final BaseModel result = await _chefService.getData();
  //     final ChefModel chefModel = await ChefModel.fromJson(result.data);
  //     state = state.copyWith(pageState: PageState.success, chefData: chefModel);
  //     resetData();
  //     debugPrint("success - getChefData");
  //   } catch (e) {
  //     state = state.copyWith(pageState: PageState.error);
  //     showSnackBar(e.toString());
  //     debugPrint("catch - getChefData");
  //     debugPrint(e.toString());
  //   }
  // }

  /// 🔹 Call this to update chef details
  // Future<void> updateChefDetails() async {
  //   state = state.copyWith(updateState: PageState.loading);
  //   try {
  //     final chefData = ChefModel(
  //       name: nameController.text.trim(),
  //       kitchenName: kitchenNameController.text.trim(),
  //       shopPlotNumber: shopPlotController.text.trim(),
  //       floor: floorController.text.trim(),
  //       buildingName: buildingNameController.text.trim(),
  //       aboutChef: aboutController.text.trim(),
  //       city: cityController.text.trim(),
  //       pincode: int.tryParse(pinCodeController.text.trim()),
  //       address: state.chefData?.address,
  //       latitude:state.chefData?.latitude ,
  //       longitude:state.chefData?.longitude ,
  //       workingDays: state.chefData?.workingDays,
  //       openingTime: state.chefData?.openingTime,
  //       closingTime: state.chefData?.closingTime,
  //     );
  //     final BaseModel result = await _chefService.updateChefDetail(
  //       chef: chefData,profileFile: state.profileFile,coverImageFile: state.coverFile,
  //     );
  //     showSnackBar(result.message, duration: 2);
  //     state = state.copyWith(updateState: PageState.success);
  //     Navigator.pop(navigatorKey.currentContext!);
  //   } catch (e) {
  //     state = state.copyWith(updateState: PageState.error);
  //     showSnackBar(e.toString());
  //     debugPrint("catch - updateChefDetails");
  //     debugPrint(e.toString());
  //   }
  // }

  // void updateWorkingDays(List<String> values) {
  //   final currentChefData = state.chefData ?? ChefModel();
  //   state = state.copyWith(
  //     chefData: currentChefData.copyWith(workingDays: values),
  //   );
  // }
  //
  // void updateOpeningClosing(String opening, String closing) {
  //   state = state.copyWith(
  //     chefData: state.chefData?.copyWith(
  //       openingTime: opening,
  //       closingTime: closing,
  //     ),
  //   );
  // }

  // void updateAddress(PickedData address) {
  //   state = state.copyWith(
  //     chefData: state.chefData?.copyWith(
  //       address: address.address,
  //       latitude: address.latLong.latitude,
  //       longitude: address.latLong.longitude,
  //     ),
  //   );
  // }

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

  /// Pick resume from storage
  Future<void> pickResume() async {
    final file = await pickResumeFile();
    if (file != null) {
      state = state.copyWith(resumeFile: file);
    }
  }

  /// Simulate upload to backend (replace with API later)
  Future<void> uploadResume() async {
    if (state.resumeFile == null) return;

    state = state.copyWith(isUploading: true);
    await Future.delayed(const Duration(seconds: 2)); // simulate upload delay
    debugPrint('Uploaded resume: ${state.resumeFile!.name}');
    state = state.copyWith(isUploading: false);
  }

  /// View resume — open PDF/doc viewer (implement later)
  void viewResume() {
    if (state.resumeFile != null) {
      debugPrint('Viewing: ${state.resumeFile!.name}');
      // You can use `open_filex` or any viewer here.
    }
  }

}
