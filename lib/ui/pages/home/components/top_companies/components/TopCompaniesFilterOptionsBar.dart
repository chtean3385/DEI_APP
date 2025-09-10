import 'package:flutter/material.dart';
import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/ui/pages/search/components/selected_filters.dart';
import 'package:dei_champions/widgets/others/custom_theme_button.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';

/// 🔹 Reusable Filter Options Bar (bottom sticky bar + pills + modal trigger)
class CommonFilterOptionsBar extends StatelessWidget {
  final List<String> filters; // pill names / categories
  final Map<String, List<Map<String, dynamic>>> options;
  final Map<String, Set<String>> initialSelected;
  final void Function(Map<String, Set<String>> selected)? onApply;
  final VoidCallback? onClearAll;

  const CommonFilterOptionsBar({
    super.key,
    required this.filters,
    required this.options,
    this.initialSelected = const {},
    this.onApply,
    this.onClearAll,
  });

  Future<void> _openFilterModal(BuildContext context, {String? initialFilter}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return CommonFilterModal(
          categories: filters,
          initialCategory: initialFilter ?? filters.first,
          options: options,
          initialSelected: initialSelected,
          onApply: onApply,
          onClearAll: onClearAll,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          // Left filter icon
          GestureDetector(
            onTap: () => _openFilterModal(context),
            child: Container(
              height: 40,
              width: 40,
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

          // Scrollable pills
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        side: const BorderSide(
                          color: Colors.black38,
                          width: .5,
                        ),
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

/// 🔹 Common reusable filter modal
class CommonFilterModal extends StatefulWidget {
  final List<String> categories;
  final String initialCategory;
  final Map<String, List<Map<String, dynamic>>> options;
  final Map<String, Set<String>> initialSelected;
  final VoidCallback? onCancel;
  final VoidCallback? onClearAll;
  final void Function(Map<String, Set<String>> selected)? onApply;

  const CommonFilterModal({
    super.key,
    required this.categories,
    required this.initialCategory,
    required this.options,
    this.initialSelected = const {},
    this.onCancel,
    this.onClearAll,
    this.onApply,
  });

  @override
  State<CommonFilterModal> createState() => _CommonFilterModalState();
}

class _CommonFilterModalState extends State<CommonFilterModal> {
  late String selectedCategory;
  late Map<String, Set<String>> selectedOptionsMap;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.initialCategory;

    // Initialize with given initial selections
    selectedOptionsMap = {
      for (var c in widget.categories)
        c: {...(widget.initialSelected[c] ?? {})},
    };
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

  void _clearAll() {
    setState(() {
      for (var k in selectedOptionsMap.keys) {
        selectedOptionsMap[k]!.clear();
      }
    });
    widget.onClearAll?.call();
  }

  void _applyAndClose() {
    widget.onApply?.call(selectedOptionsMap);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final options = widget.options[selectedCategory] ?? [];

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
              // Handle bar
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

              // Title + Clear all
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
                      onPressed: _clearAll,
                      child: const Text("Clear all"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // Selected filter chips
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

              // Categories + Options
              Expanded(
                child: Row(
                  children: [
                    // Left Categories
                    Container(
                      width: 140,
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
                            onTap: () => setState(() => selectedCategory = cat),
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

                    // Right Options
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
                                        checkColor: Colors.white,
                                        side: const BorderSide(
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

              // Bottom Buttons
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
                        onTap: () {
                          widget.onCancel?.call();
                          Navigator.pop(context);
                        },
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
