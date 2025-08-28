// Usage Example

import 'package:flutter/material.dart';

import '../../components/auto_sugstion_form_field.dart';

class CurrentCompany extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocus;

   CurrentCompany({super.key, required this.controller, required this.focusNode, this.nextFocus});

  final List<String> _companyNames = [
    'Google',
    'Microsoft',
    'Apple',
    'Amazon',
    'Meta',
    'Netflix',
    'Tesla',
    'Spotify',
    'Uber',
    'Airbnb',
    'Stripe',
    'Shopify',
    'Adobe',
    'Salesforce',
    'Oracle',
    'IBM',
    'Intel',
    'NVIDIA',
    'PayPal',
    'Twitter',
    'LinkedIn',
    'Dropbox',
    'Slack',
    'Zoom',
    'Atlassian',
    'GitHub',
    'GitLab',
    'Figma',
    'Notion',
    'Discord',
    'Reddit',
    'Pinterest',
    'Snapchat',
    'TikTok',
    'WhatsApp',
    'Instagram',
    'YouTube',
    'Twitch',
    'Epic Games',
    'Unity Technologies',
  ];


  @override
  Widget build(BuildContext context) {
    return AutoSuggestionDropdownField(
      controller: controller,
      focusNode: focusNode,
      hint: "Company name",
      icon: Icons.business_outlined,
      suggestions: _companyNames,
      maxSuggestions: 10,
      caseSensitive: false,
      showAbove: true,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(nextFocus);
      },
      onSuggestionSelected: (suggestion) {
        print('Selected Company: $suggestion');
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a company';
        }
        return null;
      },
    );
  }
}

