import 'package:flutter/material.dart';
import '../../../../../constants/app_strings.dart';
import '../../../auth/signup/components/auto_sugstion_form_field.dart';

class JobSalaryField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;

  const JobSalaryField({
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
      hint: "Enter or select salary range",
      label: "Salary",
      icon: Icons.currency_rupee,
      suggestions: AppStrings.JobSalaryRange,
      maxSuggestions: 10,
      caseSensitive: false,
      showAbove: true,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(nextFocus);
      },
      onSuggestionSelected: (suggestion) {
        print('Selected Salary : $suggestion');
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select Salary';
        }
        // ✅ Check if input is in list
        if (!AppStrings.JobSalaryRange.contains(value)) {
          return 'Please select a valid option from the list';
        }
        return null;
      },
    );
  }
}
