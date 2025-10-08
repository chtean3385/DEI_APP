import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/empower_women/empower_women_program_model.dart';

class EmpowerWomenProgramState {
  final PageState pageState;
  final List<WomenProgramModel>? data;
  final String? errorMessage;

  EmpowerWomenProgramState({required this.pageState, this.data, this.errorMessage});

  factory EmpowerWomenProgramState.initial() => EmpowerWomenProgramState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  EmpowerWomenProgramState copyWith({
    PageState? pageState,
    List<WomenProgramModel>? data,
    String? errorMessage,
  }) {
    return EmpowerWomenProgramState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
