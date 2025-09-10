import 'package:flutter/material.dart';
import '../../components/auto_sugstion_form_field.dart';

class KeyForm extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onSkillSelected;
  final FocusNode focusNode;
  final String label;
  final String hint;


   KeyForm({
    super.key,
    required this.controller,
    this.onSkillSelected, required this.focusNode,
      this.label = "Key Skill",
      this.hint = "Enter your key skill",
  });



  // Skills list
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
      focusNode: focusNode,
      hint: hint,
      label:label,
      icon: Icons.build_circle_outlined,
      suggestions: _skills,
      maxSuggestions: 8,
      caseSensitive: false,
      onSuggestionSelected: (suggestion) {
        onSkillSelected?.call(suggestion);
        controller.clear();
      },
    );
  }
}
