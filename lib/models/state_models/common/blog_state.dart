import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/common/blog_model.dart';


class BlogState {
  final PageState pageState;
  final List<BlogModel>? data;
  final String? errorMessage;
  final int currentPage;
  final int lastPage;
  final int? totalCount;
  final int? id;
  final bool isLoadingMore;
  BlogState({
    required this.pageState,
    this.data,
    this.errorMessage,
    this.currentPage = 1,
    this.lastPage = 1,
    this.totalCount = 1,
    this.id ,
    this.isLoadingMore = false,
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
    int? currentPage,
    int? lastPage,
    int? totalCount,
    int? id,
    bool? isLoadingMore,
  }) {
    return BlogState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
      currentPage: currentPage ?? this.currentPage,
      lastPage: lastPage ?? this.lastPage,
      totalCount: totalCount ?? this.totalCount,
      id: id ?? this.id,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}
