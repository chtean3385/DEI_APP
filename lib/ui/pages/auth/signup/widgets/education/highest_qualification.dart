import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import '../../../../../../widgets/pickers/single_option_selector_remove_others.dart';

class HighestQualification extends StatefulWidget {
  final String selectedPeriod;
  final Function(String) onChanged;
  final GlobalKey<FormState>? formKey;

  const HighestQualification({
    Key? key,
    required this.selectedPeriod,
    required this.onChanged,
    this.formKey,
  }) : super(key: key);

  @override
  State<HighestQualification> createState() => _HighestQualificationState();
}

class _HighestQualificationState extends State<HighestQualification> {
  String? _selectedValue;

  final List<String> periods = [
    'Doctorate',
    'Post Graduate',
    'Graduate',
    'Class XII',
    'Class X',
    'Below Class X',
  ];

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedPeriod.isNotEmpty
        ? widget.selectedPeriod
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: (_) {
        if (_selectedValue == null || _selectedValue!.isEmpty) {
          return "Please select your highest qualification";
        }
        return null;
      },
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SingleOptionSelectorRemoveOthers(
                title: "Highest Qualification*",
                options: periods,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value;
                  });
                  widget.onChanged(value);
                  field.didChange(value);
                  field.validate();
                },
              ),
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  field.errorText ?? "",
                  style: context.textTheme.displaySmall?.copyWith(
                      color: Colors.redAccent,fontWeight:  FontWeight.normal,
                      fontSize: 10
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
