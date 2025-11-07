import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class SortByDropdown extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  const SortByDropdown({super.key, this.onChanged});

  @override
  State<SortByDropdown> createState() => _SortByDropdownState();
}

class _SortByDropdownState extends State<SortByDropdown> {
  final List<String> _sortOptions = ["New", "Old",];

  late String _selected;

  @override
  void initState() {
    super.initState();
    _selected = _sortOptions.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Sort by : ",
          style: context.textTheme.displaySmall?.copyWith(
            color: Colors.black45,
          ),
        ),
        gapW8(),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: 1),
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selected,
              isDense: true,
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 20,
                color: Colors.black54,
              ),
              style: const TextStyle(color: Colors.black87, fontSize: 12),
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(6),
              items: _sortOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.black87, fontSize: 12),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() => _selected = newValue);
                }
                widget.onChanged?.call(newValue ==  "New" ? "newest" : "oldest");

              },
            ),
          ),
        ),
      ],
    );
  }
}
