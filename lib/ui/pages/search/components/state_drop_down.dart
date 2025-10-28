import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class StateDropdown extends StatefulWidget {
  const StateDropdown({super.key});

  @override
  State<StateDropdown> createState() => _StateDropdownState();
}

class _StateDropdownState extends State<StateDropdown> {
  final List<String> _states = [
    "All States",
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
      },
    );
  }

  Widget _buildDropdown(
      String label,
      List<String> items,
      String selectedValue,
      ValueChanged<String?> onChanged,
      ) {
    return Row(
      children: [
        Text(
          "$label : ",
          style: context.textTheme.displaySmall?.copyWith(color: Colors.black45),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 1),
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedValue,
                isExpanded: true,
                isDense: true,
                icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 20, color: Colors.black54),
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 12,
                ),
                dropdownColor: Colors.white,
                borderRadius: BorderRadius.circular(6),
                items: items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(
                        color: Colors.black87,
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
