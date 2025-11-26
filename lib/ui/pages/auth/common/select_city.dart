// Usage Example

import 'package:dei_champions/constants/app_strings.dart';
import 'package:flutter/material.dart';

import '../signup/components/auto_sugstion_form_field.dart';


class SelectCity extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final List<String>? cityList;
  final bool readOnly;

  const SelectCity({
    super.key,
    required this.controller,
    this.focusNode,
    this.nextFocus,
    this.cityList,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> data = cityList ?? AppStrings.indianCities;
    return AutoSuggestionDropdownField(
      controller: controller,
      focusNode: focusNode,
      hint: AppStrings.selectCity,
      label:AppStrings.employerCity,
      icon: Icons.location_city_outlined,
      suggestions: data,
      maxSuggestions: 10,
      caseSensitive: false,
      showAbove: true,
      isRequired: true,
      readOnly: readOnly,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(nextFocus);
      },
      onSuggestionSelected: (suggestion) {
        print('Selected City: $suggestion');
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a city';
        }
        // ✅ Check if input is in list
        if (!data.contains(value)) {
          return 'Please select a valid option from the list';
        }
        return null;
      },
    );
  }
}


