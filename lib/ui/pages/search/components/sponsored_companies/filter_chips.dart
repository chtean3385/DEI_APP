import 'package:dei_champions/constants/app_colors.dart';
import 'package:flutter/material.dart';

class FilterChips extends StatelessWidget {
  final List<String> filters;
  final ValueNotifier<String?> selectedFilter = ValueNotifier(null);
  final ValueChanged<String>? onSelected;

  FilterChips({super.key, required this.filters, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 16, bottom: 16),
      child: Row(
        children: filters.map((f) {
          print("builddd -$f");
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ValueListenableBuilder<String?>(
              valueListenable: selectedFilter,
              builder: (_, value, __) {
                return _FilterChipItem(
                  label: f,
                  isSelected: value == f,
                  onTap: () {
                    selectedFilter.value = f;
                    onSelected?.call(f);
                  },
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
class _FilterChipItem extends StatefulWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChipItem({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_FilterChipItem> createState() => _FilterChipItemState();
}

class _FilterChipItemState extends State<_FilterChipItem> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return OutlinedButton(
      onPressed: widget.onTap,
      style: OutlinedButton.styleFrom(
        visualDensity: VisualDensity.compact,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        side: BorderSide(
          color: widget.isSelected ? AppColors.primaryColor : Colors.black38,
          width: 1,
        ),
        backgroundColor: widget.isSelected
            ? AppColors.primaryColor.withValues(alpha: 0.2)
            : Colors.transparent,
      ),
      child: Text(
        widget.label,
        style: theme.bodySmall?.copyWith(
          fontSize: 12,
          color: widget.isSelected ? Colors.black : Colors.black87,
          fontWeight: widget.isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }
}


