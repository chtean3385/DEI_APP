import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/about_us/about_vision_model.dart';
import '../../about_us/about_us_model.dart';

class AboutVisionState {
  final PageState pageState;
  final List<AboutVisionModel>? data;
  final String? errorMessage;

  AboutVisionState({required this.pageState, this.data, this.errorMessage});

  factory AboutVisionState.initial() => AboutVisionState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  AboutVisionState copyWith({
    PageState? pageState,
    List<AboutVisionModel>? data,
    String? errorMessage,
  }) {
    return AboutVisionState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
