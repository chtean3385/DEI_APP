import 'package:dei_champions/constants/app_strings.dart';
import 'package:flutter/material.dart';
import '../../../auth/signup/components/auto_sugstion_form_field.dart';

class JobCategorySelector extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;

  const JobCategorySelector({
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
      hint: "Select Job Category",
      label: "Job Category",
      icon: Icons.category_outlined,
      suggestions: AppStrings.JobCategories,
      maxSuggestions: 10,
      caseSensitive: false,
      showAbove: true,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(nextFocus);
      },
      onSuggestionSelected: (suggestion) {
        print('Selected Category : $suggestion');
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select category';
        }
        // ✅ Check if input is in list
        if (!AppStrings.JobCategories.contains(value)) {
          return 'Please select a valid option from the list';
        }
        return null;
      },
    );
  }
}
