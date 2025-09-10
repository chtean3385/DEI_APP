import 'package:flutter/material.dart';
import '../../../../../../widgets/pickers/custom_chip.dart';
import '../../components/auto_sugstion_form_field.dart';

class WorkLocationField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? label;
  final String hint;


  const WorkLocationField({super.key, required this.controller, required this.focusNode,
     this.label,
     this.hint = "Preferred Work Location"});

  @override
  State<WorkLocationField> createState() => _WorkLocationFieldState();
}

class _WorkLocationFieldState extends State<WorkLocationField> {
  final List<String> _workLocations = [
    "Bangalore",
    "Hyderabad",
    "Chennai",
    "Pune",
    "Mumbai",
    "Delhi",
    "Gurgaon",
    "Noida",
    "Kolkata",
    "Ahmedabad",
    "Remote",
  ];

  final List<String> _selectedLocations = [];

  void _onSuggestionSelected(String location) {
    if (!_selectedLocations.contains(location)) {
      setState(() {
        _selectedLocations.add(location);
      });
    }
    // Clear text field after selection
    widget.controller.clear();
  }

  void _removeLocation(String location) {
    setState(() {
      _selectedLocations.remove(location);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSuggestionDropdownField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          hint:widget.hint,
          label:widget.label,
          icon: Icons.location_on_outlined,
          suggestions: _workLocations,
          maxSuggestions: 8,
          caseSensitive: false,
          showAbove: true,
          onSuggestionSelected: _onSuggestionSelected,
          validator: (value) {
            if (_selectedLocations.isEmpty) {
              return 'Please select at least one location';
            }
            return null;
          },
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _selectedLocations.map((location) {
            return CustomChip(
              option: location,
              onChanged: _removeLocation,
              isSelected: true,
              showRemove: true,
              isMulti: true,
              onRemove: _removeLocation,
            );
          }).toList(),
        ),
      ],
    );
  }
}
