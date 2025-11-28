import 'package:dei_champions/constants/enums.dart';

import '../../profile/edit_profile/json_item_model.dart';

class CountryCityState {
  final PageState pageState;
  final List<LocalJsonItemModel>? countries;

  final List<LocalJsonItemModel>? cities;

  final List<LocalJsonItemModel>? filteredCities;

  final List<StateModel>? states;

  CountryCityState({
    this.pageState = PageState.initial,
    this.countries,
    this.cities,
    this.filteredCities,
    this.states,
  });

  factory CountryCityState.initial() => CountryCityState();

  CountryCityState copyWith({
    PageState? pageState,
    List<LocalJsonItemModel>? countries,
    List<LocalJsonItemModel>? cities,
    List<LocalJsonItemModel>? filteredCities,
    List<StateModel>? states,
  }) {
    return CountryCityState(
      pageState: pageState ?? this.pageState,
      countries: countries ?? this.countries,
      cities: cities ?? this.cities,
      filteredCities: filteredCities ?? this.filteredCities,
      states: states ?? this.states,
    );
  }
}
