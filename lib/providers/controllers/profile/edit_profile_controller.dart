import 'package:dei_champions/ui/pages/profile/edit_profile_components/edit_work_experience_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:intl/intl.dart';

import '../../../constants/enums.dart';
import '../../../models/common/base_model.dart';
import '../../../models/profile/employee_user_model/employee_user_model.dart';
import '../../../models/state_models/profile/employee_profile_state.dart';
import '../../../service/employee_profile/employee_profile_service.dart';
import '../../../service/local_json_service.dart';
import '../../../ui/pages/profile/edit_profile_components/edit_education_info.dart';
import '../../../widgets/others/snack_bar.dart';
import '../../../widgets/pickers/file_picker.dart';
import '../../../widgets/pickers/image_picker.dart';
import '../../providers.dart';

class EditEmployeeProfileController
    extends StateNotifier<EmployeeProfileState> {
  final Ref ref;

  EditEmployeeProfileController(this.ref)
    : super(EmployeeProfileState.initial()) {
    final profileDetails = ref.watch(employeeProfileProvider).profileData;
    initController(profileDetails);
    fetchDegrees();
    fetchInstitutes();
    fetchPositions();
    fetchCountries();
    fetchCityState();
  }


  final EmployeeProfileService _employeeProfileService =
  EmployeeProfileService();
  final LocalJsonService _jsonService = LocalJsonService();


  initController(EmployeeUserModel? userData) {
    fetchInitialProfileData(userData);
  }

  final formKey = GlobalKey<FormState>();
  final stateFocus = FocusNode();
  final cityFocus = FocusNode();
  final countryFocus = FocusNode();

  /// basic info
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final dobController = TextEditingController();
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
  final preferredLocationController = TextEditingController();

  @override
  void dispose() {
    debugPrint("🔥 EditEmployeeProfileController disposed");
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    dobController.dispose();
    descriptionController.dispose();

    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    countryController.dispose();
    pinCodeController.dispose();

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



  void fetchInitialProfileData(EmployeeUserModel? userData) {
    nameController.text = userData?.name ?? "";
    emailController.text = userData?.email ?? "";
    mobileController.text = userData?.mobile ?? "";
    descriptionController.text = userData?.employeeDescription ?? "";
    addressController.text = userData?.address ?? "";
    cityController.text = userData?.city ?? "";
    stateController.text = userData?.state ?? "";
    countryController.text = userData?.country ?? "";
    pinCodeController.text = userData?.pincode ?? "";
    preferredLocationController.text = (userData?.preferences?.preferredLocations?.isNotEmpty ?? false) ?
        userData?.preferences?.preferredLocations?.first ?? "" : "";
    if (userData?.dateOfBirth != null && userData!.dateOfBirth!.isNotEmpty) {
      final parsedDate = DateTime.tryParse(userData.dateOfBirth!);
      if (parsedDate != null) {
        dobController.text = DateFormat('dd-MM-yyyy').format(parsedDate);
      } else {
        dobController.text = "";
      }
    } else {
      dobController.text = "";
    }

    // Sample initial skill list
    final initialSkills = userData?.skills ?? [];
    final List<ExperienceModel> workExperiences = userData?.experience ?? [];
    final List<EducationModel> educationData = userData?.education ?? [];
    // Generate corresponding controllers list
    final workExpControllers = workExperiences.map((exp) {
      final controller = WorkExperienceEntryControllers();
      controller.companyController.text = exp.companyName ?? '';
      controller.positionController.text = exp.position ?? '';
      controller.descriptionController.text = exp.description ?? '';

      // Format the date to "MMM - yyyy" if needed
      if (exp.startDate != null) {
        controller.startDateController.text = DateFormat(
          'dd-MM-yyyy',
        ).format(exp.startDate!);
      }

      if (exp.endDate != null) {
        controller.endDateController.text = DateFormat(
          'dd-MM-yyyy',
        ).format(exp.endDate!);
      } else if (exp.isCurrentlyWorking == true) {
        controller.endDateController.text = 'Present';
      }

      return controller;
    }).toList();

    final educationControllers = educationData.map((edu) {
      final controller = EducationEntryControllers();
      controller.degreeController.text = edu.degree ?? '';
      controller.institutionController.text = edu.institution ?? '';
      controller.graduationYearController.text =
          edu.graduationYear?.toString() ?? '';
      return controller;
    }).toList();

    state = state.copyWith(
      profileData: (userData ?? EmployeeUserModel()).copyWith(
        skills: initialSkills,
        experience: workExperiences,
        education: educationData,
        salaryRange: userData?.preferences?.salaryRange,
          jobType:(userData?.preferences?.jobTypes?.isNotEmpty ?? false) ? userData?.preferences?.jobTypes?.first ?? "":"",
          preferredLocations: userData?.preferences?.preferredLocations,
      ),
      workExpEntries: workExpControllers,
      educationEntries: educationControllers,
    );
  }


  /// 🔹 Call this to update chef details
  Future<void> updateEmployeeProfileDetails(BuildContext context, {bool isFromCommonEdit = true}) async {
   if(isFromCommonEdit){
     if (!(formKey.currentState?.validate() ?? false)) {
       showSnackBar("Please fill all required fields");
       return;
     }
   }
   if (!_validateEducationEntries()) {
     debugPrint("Cannot update: Validation failed");
     return;
   }
   if (!_validateWorkExpEntries()) {
     debugPrint("Cannot update: Validation failed");
     return;
   }
    state = state.copyWith(pageState: PageState.loading);
    print('--- Employee Profile Form stattteee ---');
    print('gender: ${state.profileData?.gender}');
    print('workStatus: ${state.profileData?.workStatus}');
    print('department: ${state.profileData?.department}');
    print('category: ${state.profileData?.category}');
    print('education: ${state.profileData?.education?.length}');
    print('education: ${state.profileData?.education?.first.institution}');
    print('education: ${state.profileData?.education?.last.institution}');
    print('experience: ${state.profileData?.experience}');
    print('skills: ${state.profileData?.skills}');

    print('--- Employee Profile Form Values ---');
    print('Name: ${nameController.text}');
    print('Email: ${emailController.text}');
    print('Mobile: ${mobileController.text}');
    print('Description: ${descriptionController.text}');
    print('Address: ${addressController.text}');
    print('City: ${cityController.text}');
    print('State: ${stateController.text}');
    print('Country: ${countryController.text}');
    print('Pincode: ${pinCodeController.text}');
    print('Preferred Location: ${preferredLocationController.text}');
    print('------------------------------------');
    final updatedExperience = buildUpdatedExperienceList();
    final updatedEducation = buildUpdatedEducationList();
    try {
      final updateData = EmployeeUserModel(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        mobile: mobileController.text.trim(),
        dateOfBirth: dobController.text.trim(),
        employeeDescription: descriptionController.text.trim(),
        gender: state.profileData?.gender, // assuming selected via dropdown
        workStatus: state.profileData?.workStatus,
        address: addressController.text.trim(),
        city: cityController.text.trim(),
        state: stateController.text.trim(),
        country: countryController.text.trim(),
        pincode: pinCodeController.text.trim(),
        jobType: state.profileData?.jobType,
        department: state.profileData?.department, // keep existing if not changed
        category: state.profileData?.category,
        salaryRange: state.profileData?.salaryRange,
        preferredLocations: state.profileData?.preferredLocations,
        education: updatedEducation,
        experience: updatedExperience,
        skills: state.profileData?.skills,
      );
      final BaseModel result = await _employeeProfileService.updateEmployeeProfileDetails(
        data: updateData,
        profileFile: state.profileFile,
        resumeFile: state.resumeFile,
      );
      ref.refresh(employeeProfileProvider);
      showSnackBar(result.message, duration: 2);
      Navigator.pop(context);
    } catch (e) {
      state = state.copyWith(pageState: PageState.error);
      showSnackBar(e.toString());
      debugPrint("catch - updateEmployeeProfileDetails");
      debugPrint(e.toString());
    }
  }
  void updateGender(String? gender) {
    final updatedProfile = state.profileData?.copyWith(gender: gender);
    state = state.copyWith(profileData: updatedProfile);
  }


  void updateWorkStatus(String workStatus) {
    final updatedProfile = state.profileData?.copyWith(workStatus: workStatus);
    state = state.copyWith(profileData: updatedProfile);
  }

  void updateJobType(String jobType) {
    final updatedProfile = state.profileData?.copyWith(jobType: jobType);
    state = state.copyWith(profileData: updatedProfile);
  }
  void updateSalary(String salary) {
    final updatedProfile = state.profileData?.copyWith(salaryRange: salary);
    state = state.copyWith(profileData: updatedProfile);
  }
  // void updateSalary(String salary) {
  //   final updatedProfile = state.profileData?.copyWith(salaryRange: salary);
  //   state = state.copyWith(profileData: updatedProfile);
  // }

  // Get selected skills directly from the model
  List<String> get selectedSkills => state.profileData?.skills ?? [];
  List<String> get selectedLocations => state.profileData?.preferredLocations ?? [];

  // Add skill
  void addSkill(String skill) {
    if (skill.isEmpty) return;

    final currentSkills = List<String>.from(selectedSkills);

    if (!currentSkills.contains(skill)) {
      currentSkills.add(skill);

      state = state.copyWith(
        profileData: (state.profileData ?? EmployeeUserModel()).copyWith(
          skills: currentSkills,
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
      profileData: (state.profileData ?? EmployeeUserModel()).copyWith(
        skills: currentSkills,
      ),
    );
  }
  void addPreferredLocation(String location) {
    if (location.isEmpty) return;

    final currentLocations = List<String>.from(selectedLocations);

    if (!currentLocations.contains(location)) {
      currentLocations.add(location);

      state = state.copyWith(
        profileData: (state.profileData ?? EmployeeUserModel()).copyWith(
          preferredLocations: currentLocations,
        ),
      );
    }

    skillController.clear();
  }
  // Remove skill
  void removePreferredLocation(String location) {
    final currentSelections = List<String>.from(selectedLocations);

    currentSelections.remove(location);

    state = state.copyWith(
      profileData: (state.profileData ?? EmployeeUserModel()).copyWith(
        preferredLocations: currentSelections,
      ),
    );
  }

  void addEducationEntry() {
    // Check if any existing entry is incomplete
    final hasIncomplete = state.educationEntries?.any((entry) =>
    entry.degreeController.text.isEmpty ||
        entry.institutionController.text.isEmpty ||
        entry.graduationYearController.text.isEmpty) ?? false;

    if (hasIncomplete) {
      debugPrint("Validation failed: Fill all existing education details before adding a new one.");
      showSnackBar("Fill all existing education details before adding a new one.");
      // You can show a snackbar in UI after this (if desired)
      return;
    }
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
  /// Validate all form fields before adding or updating
  bool _validateEducationEntries() {
    for (final entry in state.educationEntries!) {
      if (entry.degreeController.text.isEmpty ||
          entry.institutionController.text.isEmpty ||
          entry.graduationYearController.text.isEmpty) {
        debugPrint("Validation failed: Some fields are empty");
        showSnackBar("Some fields are empty in  education details .");
        return false;
      }
    }
    return true;
  }
  /// Validate all work experience form fields before adding or updating
  bool _validateWorkExpEntries() {
    for (final entry in state.workExpEntries ?? []) {
      if (entry.companyController.text.isEmpty ||
          entry.positionController.text.isEmpty ||
          entry.startDateController.text.isEmpty ||
          entry.endDateController.text.isEmpty ) {
        debugPrint("Validation failed: Some fields are empty in work experience details");
        showSnackBar("Some fields are empty in work experience details.");
        return false;
      }
    }
    return true;
  }

  void addWorkExpEntry() {
    final hasIncomplete = state.workExpEntries?.any((entry) =>
    entry.companyController.text.isEmpty ||
        entry.positionController.text.isEmpty ||
        entry.startDateController.text.isEmpty ||
        entry.endDateController.text.isEmpty ) ?? false;

    if (hasIncomplete) {
      debugPrint("Validation failed: Fill all existing work experience details before adding a new one.");
      showSnackBar("Fill all existing work experience details before adding a new one.");
      return;
    }
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

  List<ExperienceModel> buildUpdatedExperienceList() {
    final experienceControllers = state.workExpEntries ?? [];

    return experienceControllers.map((e) {
      DateTime? startDate;
      DateTime? endDate;

      // Parse start date
      if (e.startDateController.text.isNotEmpty) {
        try {
          startDate = DateFormat('dd-MM-yyyy').parse(e.startDateController.text);
        } catch (_) {}
      }

      // Parse end date (if not "Present")
      if (e.endDateController.text.isNotEmpty && e.endDateController.text != 'Present') {
        try {
          endDate = DateFormat('dd-MM-yyyy').parse(e.endDateController.text);
        } catch (_) {}
      }

      return ExperienceModel(
        companyName: e.companyController.text.trim(),
        position: e.positionController.text.trim(),
        description: e.descriptionController.text.trim(),
        startDate: startDate,
        endDate: endDate,
        isCurrentlyWorking: e.endDateController.text == 'Present',
      );
    }).toList();
  }
  List<EducationModel> buildUpdatedEducationList() {
    final educationControllers = state.educationEntries ?? [];

    return educationControllers.map((e) {
      return EducationModel(
        degree: e.degreeController.text.trim(),
        institution: e.institutionController.text.trim(),
        graduationYear: int.tryParse(e.graduationYearController.text.trim()),
      );
    }).toList();
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
  /// Load degrees and store locally
  Future<void> fetchDegrees() async {
  final  degrees = await _jsonService.loadDegrees();
  state = state.copyWith(degrees: degrees);
  }
  Future<void> fetchInstitutes() async {
   final institutes = await _jsonService.loadInstitutes();
   state = state.copyWith(institutes: institutes);
  }
  Future<void> fetchPositions() async {
   final positions = await _jsonService.loadPositions();
   state = state.copyWith(positions: positions);
  }
  Future<void> fetchCountries() async {
    final countries = await _jsonService.loadCountries();
    state = state.copyWith(countries: countries);
  }
  Future<void> fetchCityState() async {
    final stateCities = await _jsonService.loadCityState();
    final states = stateCities;
    final allCities = stateCities.expand((s) => s.cities).toList();
    state = state.copyWith(cities: allCities,states: states);
  }



}
