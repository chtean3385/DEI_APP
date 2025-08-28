// Usage Example

import 'package:flutter/material.dart';

import '../../components/auto_sugstion_form_field.dart';

class CurrentJob extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocus;


   CurrentJob({super.key, required this.controller, required this.focusNode, this.nextFocus});

  final List<String> _jobTitles = [
    'Software Engineer',
    'Frontend Developer',
    'Backend Developer',
    'Full Stack Developer',
    'Mobile App Developer',
    'DevOps Engineer',
    'Data Scientist',
    'Data Analyst',
    'Product Manager',
    'UI/UX Designer',
    'Graphic Designer',
    'Digital Marketing Manager',
    'Content Writer',
    'Business Analyst',
    'Project Manager',
    'Quality Assurance Engineer',
    'Database Administrator',
    'System Administrator',
    'Cybersecurity Specialist',
    'Cloud Architect',
    'Machine Learning Engineer',
    'Artificial Intelligence Engineer',
    'Sales Manager',
    'Human Resources Manager',
    'Financial Analyst',
    'Marketing Specialist',
    'Customer Success Manager',
    'Technical Writer',
    'Scrum Master',
    'Solutions Architect',
  ];

  @override
  Widget build(BuildContext context) {
    return AutoSuggestionDropdownField(
      controller: controller,
      hint: "Current job title",
      icon: Icons.work_outline,
      suggestions: _jobTitles,
      maxSuggestions: 8,
      caseSensitive: false,
      showAbove: true,
      focusNode: focusNode,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(nextFocus);
      },
      onSuggestionSelected: (suggestion) {
        print('Selected Job: $suggestion');
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a job title';
        }
        return null;
      },
    );
  }
}


