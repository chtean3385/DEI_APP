import 'package:dei_champions/constants/enums.dart';
import '../../common/team_member_model.dart';


class OurTeamState {
  final PageState pageState;
  final List<TeamMemberModel>? data;
  final String? errorMessage;
  OurTeamState({
    required this.pageState,
    this.data,
    this.errorMessage,
  });
  factory OurTeamState.initial() => OurTeamState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );
  OurTeamState copyWith({
    PageState? pageState,
    List<TeamMemberModel>? data,
    String? errorMessage,
  }) {
    return OurTeamState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
