import 'package:dei_champions/constants/enums.dart';

import '../../profile/profile_completion/profile_completion_model.dart';

class EmployeeProfileCompletionState {
  final ProfileCompletionModel? profileData;
  final PageState pageState;
  final PageState verifyEmailPageState;

  EmployeeProfileCompletionState({
    this.profileData,

    this.pageState = PageState.initial,
    this.verifyEmailPageState = PageState.initial,
  });

  factory EmployeeProfileCompletionState.initial() =>
      EmployeeProfileCompletionState();

  EmployeeProfileCompletionState copyWith({
    ProfileCompletionModel? profileData,
    PageState? pageState,
    PageState? verifyEmailPageState,
  }) {
    return EmployeeProfileCompletionState(
      profileData: profileData ?? this.profileData,

      pageState: pageState ?? this.pageState,
      verifyEmailPageState: verifyEmailPageState ?? this.verifyEmailPageState,
    );
  }
}
