import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class CategoryDropdown extends StatefulWidget {
  const CategoryDropdown({super.key});

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  final List<String> _categories = [
    "All Categories",
    "Multi-generation",
    "Gen Z",
    "PWD",
    "All inclusive",
    "LGBTQIA+",
    "Women",
  ];

  late String _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = _categories.first;
  }

  @override
  Widget build(BuildContext context) {
    return _buildDropdown(
      "Category",
      _categories,
      _selectedCategory,
          (val) {
        if (val != null) setState(() => _selectedCategory = val);
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
