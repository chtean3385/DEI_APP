import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../models/home/job_category/job_category_model.dart';

class CategoryDropdown extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final List<JobCategoryMode> categories;

  const CategoryDropdown({super.key, this.onChanged, required this.categories});

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  late String _selectedCategoryTitle;

  @override
  void initState() {
    super.initState();
    _selectedCategoryTitle = "All Categories";
  }

  @override
  Widget build(BuildContext context) {
    // Create a combined list: "All Categories" + fetched category titles
    final List<String> categoryTitles = [
      "All Categories",
      ...widget.categories.map((c) => c.title),
    ];
    return _buildDropdown("Category", categoryTitles, _selectedCategoryTitle, (
      val,
    ) {
      if (val != null) {
        setState(() => _selectedCategoryTitle = val);

        // Find matching category ID or send empty for "All Categories"
        final selectedCategory = widget.categories.firstWhere(
          (cat) => cat.title == val,
          orElse: () => JobCategoryMode(
            id: "",
            title: "",
            image: "",
            desc: "",
            status: "",
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            v: 0,
          ),
        );

        final selectedId = val == "All Categories" ? "" : selectedCategory.id;
        widget.onChanged?.call(selectedId); // 🔥 send category ID to parent
      }
    });
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
          style: context.textTheme.displaySmall?.copyWith(
            color: Colors.black45,
          ),
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
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 20,
                  color: Colors.black54,
                ),
                style: const TextStyle(color: Colors.black87, fontSize: 12),
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
