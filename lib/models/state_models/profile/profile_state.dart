import 'package:dei_champions/constants/enums.dart';
import 'package:image_picker/image_picker.dart';

import '../../../ui/pages/profile/edit_profile_components/edit_education_info.dart';
import '../../profile/edit_profile/profile_model.dart';



class ProfileState {
  final ProfileModel? profileData;
  final List<EducationEntryControllers>? educationEntries;
  final PageState pageState;
  final PageState updateState;
  final XFile? profileFile;

  ProfileState({
    this.profileData,
    this.educationEntries,
    this.profileFile,
    this.pageState = PageState.initial,
    this.updateState = PageState.initial,
  });

  factory ProfileState.initial() =>
      ProfileState(educationEntries: [EducationEntryControllers()]);

  ProfileState copyWith({
    ProfileModel? profileData,
    List<EducationEntryControllers>? educationEntries,
    XFile? profileFile,
    PageState? pageState,
    PageState? updateState,
  }) {
    return ProfileState(
      profileData: profileData ?? this.profileData,
      educationEntries: educationEntries ?? this.educationEntries,
      profileFile: profileFile ?? this.profileFile,
      pageState: pageState ?? this.pageState,
      updateState: updateState ?? this.updateState,
    );
  }
}

