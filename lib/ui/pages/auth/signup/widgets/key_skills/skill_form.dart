import 'package:flutter/material.dart';

import '../../components/auto_sugstion_form_field.dart';

class KeyForm extends StatelessWidget {
  final TextEditingController controller;
  KeyForm({super.key, required this.controller});

  // Updated: skills instead of job titles
  final List<String> _skills = [
    'Java',
    'Python',
    'Dart',
    'Flutter',
    'React',
    'Angular',
    'Node.js',
    'C++',
    'C#',
    'Go',
    'Kotlin',
    'Swift',
    'HTML',
    'CSS',
    'JavaScript',
    'SQL',
    'MongoDB',
    'Firebase',
    'AWS',
    'Azure',
    'Google Cloud',
    'Docker',
    'Kubernetes',
    'Git',
    'Agile Methodologies',
    'UI/UX Design',
    'Figma',
    'Adobe Photoshop',
    'Excel',
    'Power BI',
    'Data Analysis',
    'Machine Learning',
    'Deep Learning',
    'NLP',
    'Cybersecurity',
    'Testing & QA',
    'API Development',
    'RESTful APIs',
    'GraphQL',
    'DevOps',
  ];

  @override
  Widget build(BuildContext context) {
    return AutoSuggestionDropdownField(
      controller: controller,
      hint: "Enter your key skill",
      icon: Icons.build_circle_outlined, // changed to a "skills" icon
      suggestions: _skills,
      maxSuggestions: 8,
      caseSensitive: false,
      onSuggestionSelected: (suggestion) {
        print('Selected skill: $suggestion');
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter at least one skill';
        }
        return null;
      },
    );
  }
}
