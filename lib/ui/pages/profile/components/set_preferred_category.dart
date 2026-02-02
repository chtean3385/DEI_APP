import 'package:flutter/material.dart';

import '../../auth/signup/components/auto_sugstion_form_field.dart';

class SelectPreferredCategories extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final List<String> data;
  final ValueChanged<String>? onSkillSelected;


  SelectPreferredCategories({super.key, required this.controller,  this.focusNode,required this.data, this.onSkillSelected});


  @override
  Widget build(BuildContext context) {
    return AutoSuggestionDropdownField(
      controller: controller,
      focusNode: focusNode,
      hint: "Select industry",
      label: "Industry",
      icon: Icons.apartment_outlined,
      suggestions: data,
      maxSuggestions: 50,
      caseSensitive: false,
      showAbove: true,
      onSuggestionSelected: (suggestion) {
        print('Selected industry: $suggestion');
        if (suggestion.trim().isNotEmpty) {
          onSkillSelected?.call(suggestion.trim());
          controller.clear();
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Please select a city';
      //   }
      //   // ✅ Check if input is in list
      //   if (!data.contains(value)) {
      //     return 'Please select a valid option from the list';
      //   }
      //   return null;
      // },
    );
  }
}
