import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/job/job_model_api.dart';

class JobListState {
  final PageState pageState;
  final List<JobModelApi>? data;
  final String? errorMessage;
  final String? query;
  final String? sortBy;
  final String? state;
  final String? categoryId;
  final int currentPage;
  final int lastPage;
  final int? id;
  final bool isLoadingMore;

  JobListState({
    required this.pageState,
    this.data,
    this.errorMessage,
    this.query,
    this.sortBy,
    this.state,
    this.categoryId,
    this.currentPage = 1,
    this.lastPage = 1,
    this.id ,
    this.isLoadingMore = false,
  });

  factory JobListState.initial() => JobListState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
    query: null,
    sortBy: null,
    state: null,
    categoryId: null,


  );

  JobListState copyWith({
    PageState? pageState,
    List<JobModelApi>? data,
    String? errorMessage,
    String? query,
    String? sortBy,
    String? state,
    String? categoryId,
    int? currentPage,
    int? lastPage,
    int? id,
    bool? isLoadingMore,
  }) {
    return JobListState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
      query: query ?? this.query,
      sortBy: sortBy ?? this.sortBy,
      state: state ?? this.state,
      categoryId: categoryId ?? this.categoryId,
      currentPage: currentPage ?? this.currentPage,
      lastPage: lastPage ?? this.lastPage,
      id: id ?? this.id,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}
