import 'package:dei_champions/constants/app_colors.dart';
import 'package:flutter/material.dart';

/// 🔹 Reusable Chip Widget
class TopFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const TopFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 14),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primaryColor.withValues(alpha: .2)
                : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? AppColors.primaryColor : Colors.grey.shade300,
              width: .5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            child: Text(
              label,
              style: theme.bodyMedium?.copyWith(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected ? AppColors.primaryColor : Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 🔹 Chips Row (uses above widget)
class TopChipsRow extends StatefulWidget {
  const TopChipsRow({super.key});

  @override
  State<TopChipsRow> createState() => _TopChipsRowState();
}

class _TopChipsRowState extends State<TopChipsRow> {
  int selectedIndex = 0;

  final List<String> chips = ["All (1)", "Unread (1)"];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(chips.length, (index) {
        return TopFilterChip(
          label: chips[index],
          isSelected: selectedIndex == index,
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
        );
      }),
    );
  }
}
