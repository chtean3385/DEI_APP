import 'package:dei_champions/constants/enums.dart';

import '../../defense_veteran/dv_role_model.dart';

class VeteranRoleState {
  final PageState pageState;
  final List<VeteranRoleModel>? data;
  final String? errorMessage;

  VeteranRoleState({required this.pageState, this.data, this.errorMessage});

  factory VeteranRoleState.initial() => VeteranRoleState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  VeteranRoleState copyWith({
    PageState? pageState,
    List<VeteranRoleModel>? data,
    String? errorMessage,
  }) {
    return VeteranRoleState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
