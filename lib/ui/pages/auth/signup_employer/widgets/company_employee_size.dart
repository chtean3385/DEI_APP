// Usage Example

import 'package:dei_champions/constants/app_strings.dart';
import 'package:flutter/material.dart';

import '../../signup/components/auto_sugstion_form_field.dart';


class CompanyEmployeeSize extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocus;

  CompanyEmployeeSize({super.key, required this.controller, required this.focusNode, this.nextFocus});



  @override
  Widget build(BuildContext context) {
    return AutoSuggestionDropdownField(
      controller: controller,
      focusNode: focusNode,
      hint: AppStrings.selectCompanySize,
      label: AppStrings.companySize,
      icon: Icons.group_outlined,
      suggestions: AppStrings.companyEmployeeSize,
      maxSuggestions: 10,
      caseSensitive: false,
      showAbove: true,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(nextFocus);
      },
      onSuggestionSelected: (suggestion) {
        print('Selected Company Size: $suggestion');
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select company size';
        }
        return null;
      },
    );
  }
}

