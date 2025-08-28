import 'package:flutter/material.dart';
import '../../components/auto_sugstion_form_field.dart';

/// 1. Industry Type
class IndustryTypeField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocus;

  IndustryTypeField({super.key, required this.controller, required this.focusNode, this.nextFocus});

  final List<String> _industries = [
    'Information Technology',
    'Healthcare',
    'Finance',
    'Education',
    'Manufacturing',
    'Retail',
    'Telecommunications',
    'Construction',
    'Hospitality',
    'Transportation',
    'Energy',
    'Media & Entertainment',
    'Consulting',
    'Real Estate',
    'Government',
    'Legal',
    'Agriculture',
    'Automotive',
    'Pharmaceuticals',
    'E-commerce',
  ];

  @override
  Widget build(BuildContext context) {
    return AutoSuggestionDropdownField(
      controller: controller,
      focusNode:  focusNode,
      hint: "Select your industry type*",
      icon: Icons.work_outline,
      suggestions: _industries,
      maxSuggestions: 10,
      caseSensitive: false,
      showAbove: true,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(nextFocus);
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select an industry type';
        }
        return null;
      },
    );
  }
}