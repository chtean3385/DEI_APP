import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/common/blog_model.dart';

class BlogDetailState {
  final PageState pageState;
  final BlogModel? data;
  final String? errorMessage;

  BlogDetailState({required this.pageState, this.data, this.errorMessage});

  factory BlogDetailState.initial() => BlogDetailState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  BlogDetailState copyWith({
    PageState? pageState,
    BlogModel? data,
    String? errorMessage,
  }) {
    return BlogDetailState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
