import 'package:dei_champions/constants/app_validators.dart';
import 'package:flutter/material.dart';
import '../signup/components/auto_sugstion_form_field.dart';

class EmailSuggestionField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode nextFocus;
  final String hint;
  final String label;

  const EmailSuggestionField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.nextFocus,
    required this.hint,
    required this.label,
  });

  @override
  State<EmailSuggestionField> createState() => _EmailSuggestionFieldState();
}

class _EmailSuggestionFieldState extends State<EmailSuggestionField> {
  final List<String> _commonDomains = [
    'gmail.com',
    'yahoo.com',
    'hotmail.com',
    'outlook.com',
  ];

  List<String> _suggestions = [];

  void _updateSuggestions(String input) {
    final parts = input.split('@');
    if (parts.isEmpty || parts[0].isEmpty) {
      _suggestions = [];
    } else if (parts.length == 1) {
      // User typed before @ → show all common domains
      _suggestions =
          _commonDomains.map((d) => '${parts[0]}@$d').toList();
    } else {
      // User typed after @ → filter domains
      final typedDomain = parts[1];
      _suggestions = _commonDomains
          .where((d) => d.startsWith(typedDomain))
          .map((d) => '${parts[0]}@$d')
          .toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AutoSuggestionDropdownField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      hint: widget.hint,
      label: widget.label,
      icon: Icons.email_outlined,
      suggestions: _suggestions,
      maxSuggestions: 5,
      caseSensitive: false,
      showAbove: true,
      onChanged: _updateSuggestions,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      autofillHints: [AutofillHints.email],
      validator: AppValidators.email,
      onSuggestionSelected: (suggestion) {
        widget.controller.text = suggestion;
        widget.controller.selection = TextSelection.fromPosition(
          TextPosition(offset: suggestion.length),
        );
      },
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(widget.nextFocus);
      },
    );
  }
}
