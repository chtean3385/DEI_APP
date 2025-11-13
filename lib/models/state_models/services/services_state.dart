import 'package:dei_champions/constants/enums.dart';
import '../../explore_career/explore_service_program_model.dart';

class CareerExploreServicesState {
  final PageState pageState;
  final List<ExploreServiceProgramModel>? data;
  final String? errorMessage;

  CareerExploreServicesState({required this.pageState, this.data, this.errorMessage});

  factory CareerExploreServicesState.initial() => CareerExploreServicesState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  CareerExploreServicesState copyWith({
    PageState? pageState,
    List<ExploreServiceProgramModel>? data,
    String? errorMessage,
  }) {
    return CareerExploreServicesState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
