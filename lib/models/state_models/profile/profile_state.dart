import 'package:dei_champions/constants/enums.dart';
import 'package:image_picker/image_picker.dart';

import '../../profile/edit_profile/profile_model.dart';



class ProfileState {
  final ProfileModel? profileData;
  final PageState pageState;
  final PageState updateState;
  final XFile? profileFile;

  ProfileState({
    this.profileData,
    this.profileFile,
    this.pageState = PageState.initial,
    this.updateState = PageState.initial,
  });
  // convenience factory
  factory ProfileState.initial() =>  ProfileState();
  ProfileState copyWith({
    PageState? pageState,
    PageState? updateState,
    ProfileModel? profileData,
    XFile? profileFile,
  }) {
    return ProfileState(
      pageState: pageState ?? this.pageState,
      updateState: updateState ?? this.updateState,
      profileData: profileData ?? this.profileData,
      profileFile: profileFile ?? this.profileFile,
    );
  }
}
