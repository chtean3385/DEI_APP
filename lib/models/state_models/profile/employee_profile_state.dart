import 'package:dei_champions/constants/enums.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../../ui/pages/profile/edit_profile_components/edit_education_info.dart';
import '../../../ui/pages/profile/edit_profile_components/edit_work_experience_info.dart';
import '../../profile/employee_user_model/employee_user_model.dart';



class EmployeeProfileState {
  final EmployeeUserModel? profileData;
  final List<EducationEntryControllers>? educationEntries;
  final List<WorkExperienceEntryControllers>? workExpEntries;
  final PageState pageState;
  final PageState updateState;
  final XFile? profileFile;
  final XFile? coverFile;
  final PlatformFile? resumeFile;
  final List<XFile>? galleryLocalImages;
  final bool isUploading;


  EmployeeProfileState({
    this.profileData,
    this.educationEntries,
    this.workExpEntries,
    this.profileFile,
    this.coverFile,
    this.resumeFile,
    this.galleryLocalImages,
    this.isUploading = false,
    this.pageState = PageState.initial,
    this.updateState = PageState.initial,
  });

  factory EmployeeProfileState.initial() =>
      EmployeeProfileState(educationEntries: [EducationEntryControllers()],workExpEntries: [WorkExperienceEntryControllers()]);

  EmployeeProfileState copyWith({
    EmployeeUserModel? profileData,
    List<EducationEntryControllers>? educationEntries,
    List<WorkExperienceEntryControllers>? workExpEntries,
    XFile? profileFile,
    XFile? coverFile,
    PlatformFile? resumeFile,
    PageState? pageState,
    PageState? updateState,
    bool? isUploading,
    List<XFile>? galleryLocalImages
  }) {
    return EmployeeProfileState(
      profileData: profileData ?? this.profileData,
      educationEntries: educationEntries ?? this.educationEntries,
      workExpEntries: workExpEntries ?? this.workExpEntries,
      profileFile: profileFile ?? this.profileFile,
      coverFile: coverFile ?? this.coverFile,
      resumeFile: resumeFile ?? this.resumeFile,
      pageState: pageState ?? this.pageState,
      updateState: updateState ?? this.updateState,
      isUploading: isUploading ?? this.isUploading,
      galleryLocalImages: galleryLocalImages ?? this.galleryLocalImages,
    );
  }
}

