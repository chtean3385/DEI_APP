import 'package:dei_champions/constants/enums.dart';

import '../../profile/profile_completion/profile_completion_model.dart';

class EmployeeProfileCompletionState {
  final ProfileCompletionModel? profileData;
  final PageState pageState;

  EmployeeProfileCompletionState({
    this.profileData,

    this.pageState = PageState.initial,
  });

  factory EmployeeProfileCompletionState.initial() =>
      EmployeeProfileCompletionState();

  EmployeeProfileCompletionState copyWith({
    ProfileCompletionModel? profileData,
    PageState? pageState,
  }) {
    return EmployeeProfileCompletionState(
      profileData: profileData ?? this.profileData,

      pageState: pageState ?? this.pageState,
    );
  }
}
