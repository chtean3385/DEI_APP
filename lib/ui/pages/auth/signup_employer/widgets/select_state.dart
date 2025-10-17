// Usage Example

import 'package:dei_champions/constants/app_strings.dart';
import 'package:flutter/material.dart';

import '../../signup/components/auto_sugstion_form_field.dart';


class SelectState extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;

  const SelectState({
    super.key,
    required this.controller,
     this.focusNode,
    this.nextFocus,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSuggestionDropdownField(
      controller: controller,
      focusNode: focusNode,
      hint: AppStrings.selectState,
      label:AppStrings.state,
      icon: Icons.map_outlined,
      suggestions: AppStrings.indianStates,
      maxSuggestions: 10,
      caseSensitive: false,
      showAbove: true,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(nextFocus);
      },
      onSuggestionSelected: (suggestion) {
        print('Selected State: $suggestion');
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a state';
        }
        // ✅ Check if input is in list
        if (!AppStrings.indianStates.contains(value)) {
          return 'Please select a valid option from the list';
        }
        return null;
      },
    );
  }
}


