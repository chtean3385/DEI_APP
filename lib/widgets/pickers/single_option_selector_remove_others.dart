import 'package:flutter/material.dart';

class SingleOptionSelectorRemoveOthers extends StatefulWidget {
  final String title;
  final List<String> options;
  final ValueChanged<String> onChanged;

  /// ✅ Add callback to handle remove

  const SingleOptionSelectorRemoveOthers({
    super.key,
    required this.title,
    required this.options,
    required this.onChanged,
  });

  @override
  State<SingleOptionSelectorRemoveOthers> createState() =>
      _SingleOptionSelectorRemoveOthersState();
}

class _SingleOptionSelectorRemoveOthersState
    extends State<SingleOptionSelectorRemoveOthers> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // If selectedValue is not null, show only the chosen item
    final itemsToShow = selectedValue == null
        ? widget.options
        : [selectedValue!];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: itemsToShow.map((option) {
            final isSelected = selectedValue == option;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedValue = option;
                });
                widget.onChanged(option);
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    width: isSelected ? 2 : 0.2,
                    color: isSelected
                        ? const Color(0xFF4285F4)
                        : Colors.grey.shade300,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        option,
                        style: textTheme.displaySmall?.copyWith(
                          color: isSelected ? Colors.white : Colors.white70,
                          fontWeight: isSelected
                              ? FontWeight.w500
                              : FontWeight.normal,
                        ),
                      ),
                      if (isSelected) const SizedBox(width: 4),
                      if (isSelected)
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            setState(() {
                              selectedValue = null;
                            });
                            widget.onChanged("");
                          },
                          child: const Icon(
                            Icons.close,
                            size: 18,
                            color: Colors.white,
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
    );
  }
}
