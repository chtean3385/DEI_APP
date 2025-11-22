import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class StateDropdown extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  const StateDropdown({super.key, this.onChanged});

  @override
  State<StateDropdown> createState() => _StateDropdownState();
}

class _StateDropdownState extends State<StateDropdown> {
  final List<String> _states = [
    "Select State",
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
  ];

  late String _selectedState;

  @override
  void initState() {
    super.initState();
    _selectedState = _states.first;
  }

  @override
  Widget build(BuildContext context) {
    return _buildDropdown(
      "State",
      _states,
      _selectedState,
          (val) {
        if (val != null) setState(() => _selectedState = val);
        widget.onChanged?.call(val ==  "Select State" ? "" : (val ?? ""));
      },
    );
  }

  Widget _buildDropdown(
      String label,
      List<String> items,
      String selectedValue,
      ValueChanged<String?> onChanged,
      ) {
    final colorTheme  = context.colors;

    return Row(
      children: [
        Text(
          "$label : ",
          style: context.textTheme.displaySmall?.copyWith(color: colorTheme.black54),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: colorTheme.grey300, width: 1),
              borderRadius: BorderRadius.circular(6),
              color: colorTheme.themBasedWhite,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedValue,
                isExpanded: true,
                isDense: true,
                icon:  Icon(Icons.keyboard_arrow_down_rounded, size: 20, color: colorTheme.black54),
                style:  TextStyle(
                  color: colorTheme.black87,
                  fontSize: 12,
                ),
                dropdownColor: colorTheme.themBasedWhite,
                borderRadius: BorderRadius.circular(6),
                items: items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style:  TextStyle(
                        color: colorTheme.black87,
                        fontSize: 12,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
