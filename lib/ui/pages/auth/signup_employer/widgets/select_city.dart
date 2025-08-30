// Usage Example

import 'package:dei_champions/constants/app_strings.dart';
import 'package:flutter/material.dart';

import '../../signup/components/auto_sugstion_form_field.dart';


class SelectCity extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocus;

  const SelectCity({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocus,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSuggestionDropdownField(
      controller: controller,
      focusNode: focusNode,
      hint: AppStrings.selectCity,
      label:AppStrings.employerCity,
      icon: Icons.location_city_outlined,
      suggestions: AppStrings.indianCities,
      maxSuggestions: 10,
      caseSensitive: false,
      showAbove: true,
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
        if (!AppStrings.indianCities.contains(value)) {
          return 'Please select a valid option from the list';
        }
        return null;
      },
    );
  }
}


