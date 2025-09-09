import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class SelectedFilters extends StatelessWidget {
  final List<String> selectedSkill;
  final Function(String) onRemove;

  const SelectedFilters({
    Key? key,
    required this.selectedSkill,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (selectedSkill.isNotEmpty)    Text(
              'Selected Filters',
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.black54,
              ),
            ),
            if (selectedSkill.isNotEmpty)   const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: selectedSkill.map((skill) {
                return GestureDetector(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        width: 2,
                        color: const Color(0xFF4285F4),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            skill,
                            style: context.textTheme.displaySmall?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {
                              onRemove(skill);
                            },
                            child: const Icon(
                              Icons.close,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

          ],
        ),
      ),
    );
  }
}
