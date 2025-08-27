import 'package:flutter/material.dart';
import '../../../../../../widgets/pickers/single_option_selector_remove_others.dart';

class CourseTypeSelector extends StatefulWidget {
  final String selectedType;
  final Function(String) onChanged;
  final GlobalKey<FormState>? formKey;

  const CourseTypeSelector({
    Key? key,
    required this.selectedType,
    required this.onChanged,
    this.formKey,
  }) : super(key: key);

  @override
  State<CourseTypeSelector> createState() => _CourseTypeSelectorState();
}

class _CourseTypeSelectorState extends State<CourseTypeSelector> {
  String? _selectedValue;

  final List<String> courseTypes = [
    'Full-time',
    'Part-time',
    'Correspondence / Distance Learning',
  ];

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedType.isNotEmpty
        ? widget.selectedType
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: (_) {
        if (_selectedValue == null || _selectedValue!.isEmpty) {
          return "Please select a course type";
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
                title: "Course Type*",
                options: courseTypes,
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
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}
