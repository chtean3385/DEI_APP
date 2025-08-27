import 'package:flutter/material.dart';

import '../../components/auto_sugstion_form_field.dart' show AutoSuggestionDropdownField;

/// 2. Department
class DepartmentField extends StatelessWidget {
  final TextEditingController controller;
  DepartmentField({super.key, required this.controller});

  final List<String> _departments = [
    'Engineering',
    'Product',
    'Design',
    'Marketing',
    'Sales',
    'Finance',
    'Operations',
    'Human Resources',
    'Customer Support',
    'Legal',
    'IT',
    'Research & Development',
    'Business Development',
  ];

  @override
  Widget build(BuildContext context) {
    return AutoSuggestionDropdownField(
      controller: controller,
      hint: "Current department",
      icon: Icons.apartment_outlined,
      suggestions: _departments,
      maxSuggestions: 10,
      caseSensitive: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a department';
        }
        return null;
      },
    );
  }
}



