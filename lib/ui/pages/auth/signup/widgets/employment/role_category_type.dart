import 'package:flutter/material.dart';
import '../../components/auto_sugstion_form_field.dart';

/// 3. Role Category
class RoleCategoryField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocus;

  RoleCategoryField({super.key, required this.controller, required this.focusNode, this.nextFocus});


  final List<String> _roleCategories = [
    'Software Development',
    'Data Science',
    'Product Management',
    'Design (UI/UX)',
    'Quality Assurance',
    'Cloud & DevOps',
    'Cybersecurity',
    'Human Resources',
    'Finance & Accounting',
    'Marketing & Communications',
    'Operations & Supply Chain',
    'Sales & Business Development',
    'Legal & Compliance',
  ];

  @override
  Widget build(BuildContext context) {
    return AutoSuggestionDropdownField(
      controller: controller,
      focusNode:  focusNode,
      hint: "Select current role category",
      icon: Icons.category_outlined,
      suggestions: _roleCategories,
      maxSuggestions: 10,
      caseSensitive: false,
      showAbove: true,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(nextFocus);
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a role category';
        }
        return null;
      },
    );
  }
}