import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/ui/pages/search/components/selected_filters.dart';
import 'package:dei_champions/widgets/others/custom_theme_button.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

/// 🔹 Separate widget for bottom filter options (with filter list + modal logic)
class FilterOptionsBar extends StatelessWidget {
  final List<String> filters;

  const FilterOptionsBar({Key? key, required this.filters}) : super(key: key);

  Future<void> _openFilterModal(BuildContext context, {String? initialFilter}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return FilterModal(
          categories: filters,
          initialCategory: initialFilter ?? filters.first,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // visual separation from list
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          // Left filter icon (circular with outline)
          GestureDetector(
            onTap: () => _openFilterModal(context),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.filter_list_alt,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Horizontal list of pills (scrollable)
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: filters.map((f) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: OutlinedButton(
                      onPressed: () =>
                          _openFilterModal(context, initialFilter: f),
                      style: OutlinedButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 4,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        side: BorderSide(color: Colors.black38, width: .5),
                      ),
                      child: Text(f, style: context.textTheme.displaySmall),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Full-screen style modal that shows left categories and right options.
/// Height is ~85% of screen to match screenshot feel.
class FilterModal extends StatefulWidget {
  final List<String> categories;
  final String initialCategory;

  const FilterModal({
    Key? key,
    required this.categories,
    required this.initialCategory,
  }) : super(key: key);

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  late String selectedCategory;
  final Map<String, Set<String>> selectedOptionsMap = {};

  // sample options per category (replace with real data)
  final Map<String, List<Map<String, dynamic>>> _options = {
    "Work mode": [
      {"label": "Work from office", "count": 59},
      {"label": "Work from home", "count": 12},
      {"label": "Hybrid", "count": 28},
    ],
    "Department": [
      {"label": "Development", "count": 42},
      {"label": "Design", "count": 10},
      {"label": "Product", "count": 7},
    ],
    "Experience": [
      {"label": "0-1 yrs", "count": 11},
      {"label": "1-3 yrs", "count": 20},
      {"label": "3-5 yrs", "count": 18},
      {"label": "5+ yrs", "count": 10},
    ],
    "Salary": [
      {"label": "0-2 LPA", "count": 10},
      {"label": "2-4 LPA", "count": 25},
      {"label": "4-8 LPA", "count": 12},
    ],
    "Companies": [
      {"label": "Company A", "count": 5},
      {"label": "Company B", "count": 8},
      {"label": "Company C", "count": 12},
    ],
    // fallback for other categories
  };

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.initialCategory;
    for (var c in widget.categories) {
      selectedOptionsMap[c] = <String>{};
    }
  }

  void _toggleOption(String category, String option) {
    setState(() {
      final set = selectedOptionsMap[category]!;
      if (set.contains(option)) {
        set.remove(option);
      } else {
        set.add(option);
      }
    });
  }

  void _applyAndClose() {
    // You can return the selectedOptionsMap if needed:
    // Navigator.pop(context, selectedOptionsMap);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final leftWidth = 140.0;
    final theme = Theme.of(context).textTheme;

    final options =
        _options[selectedCategory] ??
        ([
          {"label": "Option 1", "count": 0},
          {"label": "Option 2", "count": 0},
          {"label": "Option 3", "count": 0},
        ]);

    return FractionallySizedBox(
      heightFactor: 0.85,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              // handle
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: 64,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),

              // Title row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      "Filter results",
                      style: theme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),

                    TextButton(
                      onPressed: () {
                        // optionally clear filters
                        setState(() {
                          for (var k in selectedOptionsMap.keys) {
                            selectedOptionsMap[k]!.clear();
                          }
                        });
                      },
                      child: const Text("Clear all"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),
              /// 🔽 Show selected skills
              SelectedFilters(
                selectedSkill: selectedOptionsMap.values
                    .expand((s) => s)
                    .toList(),
                onRemove: (skill) {
                  setState(() {
                    for (var set in selectedOptionsMap.values) {
                      set.remove(skill);
                    }
                  });
                },
              ),


              const SizedBox(height: 8),

              // Main content — left categories / right options
              Expanded(
                child: Row(
                  children: [
                    // Left side (categories)
                    Container(
                      width: leftWidth,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Colors.grey.shade200),
                        ),
                      ),
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        itemCount: widget.categories.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, idx) {
                          final cat = widget.categories[idx];
                          final selected = cat == selectedCategory;
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedCategory = cat;
                              });
                            },
                            child: Container(
                              height: 56,
                              color: selected
                                  ? Colors.blue.shade50
                                  : Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Row(
                                children: [
                                  // small colored bar for selected
                                  Container(
                                    width: 4,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      color: selected
                                          ? Colors.blue
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      cat,
                                      style: theme.bodyMedium?.copyWith(
                                        fontWeight: selected
                                            ? FontWeight.w900
                                            : FontWeight.w500,
                                        color: selected
                                            ? AppColors.primaryColor
                                            : Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // Right side (options)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(selectedCategory, style: theme.labelMedium),
                            const SizedBox(height: 8),
                            Expanded(
                              child: ListView.builder(
                                itemCount: options.length,
                                itemBuilder: (context, i) {
                                  final opt = options[i];
                                  final label = opt['label'] as String;
                                  final count = opt['count'] as int;
                                  final checked =
                                      selectedOptionsMap[selectedCategory]!
                                          .contains(label);
                                  return Row(
                                    children: [
                                      Checkbox(
                                        value: checked,
                                        onChanged: (_) => _toggleOption(
                                          selectedCategory,
                                          label,
                                        ),
                                        activeColor: AppColors.primaryColor,
                                        // checked color
                                        checkColor: Colors.white,
                                        // tick color
                                        side: const BorderSide(
                                          // 👈 ensures border visible when unchecked
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          label,
                                          style: theme.bodyMedium,
                                        ),
                                      ),
                                      Text(
                                        count > 0 ? "$count" : "",
                                        style: theme.bodyMedium?.copyWith(
                                          color: Colors.black38,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom sticky buttons
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey.shade200)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomThemeButton(
                        child: Text(
                          "Cancel",
                          style: theme.labelMedium?.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        radius: 30,
                        onTap: () => Navigator.pop(context),
                        isExpanded: true,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomThemeButton(
                        child: Text(
                          "Apply filters",
                          style: theme.labelMedium?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        radius: 30,
                        onTap: _applyAndClose,
                        isExpanded: true,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
