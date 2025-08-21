import 'package:dei_champions/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final String label;
  final bool initialValue;
  final void Function(String label, bool isSelected) onChanged;

  const CustomCheckbox({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialValue;
  }

  void _toggle(bool? value) {
    setState(() {
      _selected = value ?? false;
    });

    // 🔹 Call parent callback too
    widget.onChanged(widget.label, _selected);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 25,
          height: 25,
          child: Checkbox(
            value: _selected,
            onChanged: _toggle,
            visualDensity: VisualDensity.compact,
            activeColor: AppColors.primaryColor,
            checkColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            fillColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (states.contains(WidgetState.selected)) {
                return AppColors.primaryColor;
              }
              return Colors.transparent;
            }),
            side: const BorderSide(color: AppColors.primaryColor, width: 1.2), // visible border
          ),
        ),
        const SizedBox(width: 6),
        Text(widget.label),
      ],
    );
  }
}
