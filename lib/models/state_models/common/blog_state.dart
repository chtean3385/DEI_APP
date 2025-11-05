import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/common/blog_model.dart';


class BlogState {
  final PageState pageState;
  final List<BlogModel>? data;
  final String? errorMessage;
  BlogState({
    required this.pageState,
    this.data,
    this.errorMessage,
  });
  factory BlogState.initial() => BlogState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );
  BlogState copyWith({
    PageState? pageState,
    List<BlogModel>? data,
    String? errorMessage,
  }) {
    return BlogState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
