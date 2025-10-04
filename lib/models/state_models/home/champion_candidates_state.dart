import 'package:dei_champions/constants/enums.dart';
import '../../home/dei_champion_candidates/champion_list_model.dart';


class ChampionCandidatesState {
  final PageState pageState;
  final List<CandidateListModel>? data;
  final String? errorMessage;
  ChampionCandidatesState({
    required this.pageState,
    this.data,
    this.errorMessage,
  });
  factory ChampionCandidatesState.initial() => ChampionCandidatesState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );
  ChampionCandidatesState copyWith({
    PageState? pageState,
    List<CandidateListModel>? data,
    String? errorMessage,
  }) {
    return ChampionCandidatesState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
