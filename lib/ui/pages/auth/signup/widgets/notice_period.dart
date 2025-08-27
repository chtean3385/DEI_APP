import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class NoticePeriodWidget extends StatelessWidget {
  final String selectedPeriod;
  final Function(String) onChanged;

  const NoticePeriodWidget({
    Key? key,
    required this.selectedPeriod,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final periods = [
      '15 Days or less',
      '1 Month',
      '2 Months',
      '3 Months',
      'More than 3 Months',
      'Serving Notice Period',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notice period*',
          style: context.textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: periods.map((period) {
            final isSelected = selectedPeriod == period;
            return GestureDetector(
              onTap: () => onChanged(period),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  // color: isSelected ? const Color(0xFF4285F4) : Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    width: isSelected ? .5: .2,
                    color: isSelected
                        ? const Color(0xFF4285F4)
                        : Colors.grey.shade300,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text(
                    period,
                    style: context.textTheme.displaySmall?.copyWith(
                      color: isSelected ? Colors.white : Colors.white70,
                      fontWeight: isSelected
                          ? FontWeight.w500
                          : FontWeight.normal,
                    ),
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
