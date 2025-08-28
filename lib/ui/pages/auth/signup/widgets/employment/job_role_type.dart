import 'package:flutter/material.dart';
import '../../components/auto_sugstion_form_field.dart';

/// 4. Job Role
class JobRoleField extends StatelessWidget {
  final TextEditingController controller;
  JobRoleField({super.key, required this.controller});

  final List<String> _jobRoles = [
    'Software Engineer',
    'Frontend Developer',
    'Backend Developer',
    'Full Stack Developer',
    'Mobile App Developer',
    'Data Analyst',
    'Data Scientist',
    'Product Manager',
    'UI/UX Designer',
    'QA Engineer',
    'DevOps Engineer',
    'Cloud Architect',
    'Cybersecurity Analyst',
    'HR Manager',
    'Recruiter',
    'Finance Manager',
    'Marketing Specialist',
    'Operations Manager',
    'Sales Executive',
    'Legal Advisor',
  ];

  @override
  Widget build(BuildContext context) {
    return AutoSuggestionDropdownField(
      controller: controller,
      hint: "Current job role",
      icon: Icons.person_outline,
      suggestions: _jobRoles,
      maxSuggestions: 10,
      caseSensitive: false,
      showAbove: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select your current role';
        }
        return null;
      },
    );
  }
}