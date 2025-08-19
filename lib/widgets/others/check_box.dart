import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final String label;
  final bool selected;
  final void Function(String label, bool isSelected) onChanged;

  const CustomCheckbox({
    super.key,
    required this.label,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 25,
          height: 25,
          child: Checkbox(
            value: selected,
            onChanged: (val) => onChanged(label, val ?? false),
            visualDensity: VisualDensity.compact,
            activeColor: Colors.blue,
            checkColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: const BorderSide(
                color: Colors.grey,
                width: 1.2,
              ),
            ),
          ),
        ),
        Text(label),
      ],
    );
  }
}