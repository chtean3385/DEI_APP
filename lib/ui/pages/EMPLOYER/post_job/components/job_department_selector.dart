// Usage Example

import 'package:dei_champions/constants/app_strings.dart';
import 'package:flutter/material.dart';

import '../../../auth/signup/components/auto_sugstion_form_field.dart';



class JobDepartmentSelector extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;

  JobDepartmentSelector({super.key, required this.controller,  this.focusNode, this.nextFocus});



  @override
  Widget build(BuildContext context) {
    return AutoSuggestionDropdownField(
      controller: controller,
      focusNode: focusNode,
      hint: "Select Department",
      label: "Department",
      icon: Icons.business,
      suggestions: AppStrings.jobDepartments,
      maxSuggestions: 10,
      caseSensitive: false,
      showAbove: true,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(nextFocus);
      },
      onSuggestionSelected: (suggestion) {
        print('Selected Department : $suggestion');
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select department';
        }
        // ✅ Check if input is in list
        if (!AppStrings.jobDepartments.contains(value)) {
          return 'Please select a valid option from the list';
        }
        return null;
      },
    );
  }
}

