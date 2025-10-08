import 'package:dei_champions/constants/enums.dart';
import '../../men_alias/champion_diversity_model.dart';

class ChampionDiversityState {
  final PageState pageState;
  final List<ChampionDiversityModel>? data;
  final String? errorMessage;

  ChampionDiversityState({required this.pageState, this.data, this.errorMessage});

  factory ChampionDiversityState.initial() => ChampionDiversityState(
    pageState: PageState.initial,
    data: null,
    errorMessage: null,
  );

  ChampionDiversityState copyWith({
    PageState? pageState,
    List<ChampionDiversityModel>? data,
    String? errorMessage,
  }) {
    return ChampionDiversityState(
      pageState: pageState ?? this.pageState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
