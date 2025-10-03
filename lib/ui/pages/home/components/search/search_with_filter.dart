import 'package:flutter/material.dart';
import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/custom_theme_button.dart';


/// BottomSheet for simple filters (Category & Location)
class SimpleFilterModal extends StatefulWidget {
  const SimpleFilterModal({Key? key}) : super(key: key);

  @override
  State<SimpleFilterModal> createState() => _SimpleFilterModalState();
}

class _SimpleFilterModalState extends State<SimpleFilterModal> {
  String selectedFilter = "Category"; // default left menu
  final Map<String, Set<String>> selectedMap = {
    "Category": <String>{},
    "Location": <String>{},
  };

  final Map<String, List<String>> options = {
    "Category": [
      "Multi-generation",
      "Gen Z",
      "PWD",
      "All inclusive",
      "LGBTQIA+",
      "Women",
    ],
    "Location": [
      "India",
      "United States",
      "United Kingdom",
      "Remote",
    ],
  };

  void _toggle(String filter, String value) {
    setState(() {
      if (selectedMap[filter]!.contains(value)) {
        selectedMap[filter]!.remove(value);
      } else {
        selectedMap[filter]!.add(value);
      }
    });
  }

  void _applyAndClose() {
    // Here you can pass back selectedMap if needed
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final leftWidth = 140.0;

    final items = options[selectedFilter] ?? [];

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
              // handle bar
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

              // Title
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
                        setState(() {
                          for (var k in selectedMap.keys) {
                            selectedMap[k]!.clear();
                          }
                        });
                      },
                      child: const Text("Clear all"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              Expanded(
                child: Row(
                  children: [
                    // Left (filters)
                    Container(
                      width: leftWidth,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Colors.grey.shade200),
                        ),
                      ),
                      child: ListView(
                        children: options.keys.map((filter) {
                          final selected = filter == selectedFilter;
                          return InkWell(
                            onTap: () => setState(() {
                              selectedFilter = filter;
                            }),
                            child: Container(
                              height: 56,
                              color: selected
                                  ? Colors.blue.shade50
                                  : Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                children: [
                                  Container(
                                    width: 4,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      color: selected
                                          ? AppColors.primaryColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      filter,
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
                        }).toList(),
                      ),
                    ),

                    // Right (options)
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: items.map((opt) {
                          final checked =
                          selectedMap[selectedFilter]!.contains(opt);
                          return CheckboxListTile(
                            value: checked,
                            visualDensity: VisualDensity.compact,
                            onChanged: (_) => _toggle(selectedFilter, opt),
                            title: Text(opt, style: theme.bodyMedium),
                            activeColor: AppColors.primaryColor,
                            checkColor: Colors.white,
                            side: const BorderSide(
                              // 👈 ensures border visible when unchecked
                              color: Colors.grey,
                              width: 2,
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom buttons
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12),
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
