import 'package:flutter/material.dart';
import 'package:dei_champions/constants/app_colors.dart';

class ApplicationStatusProgressBars extends StatelessWidget {
  const ApplicationStatusProgressBars({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    final List<Map<String, dynamic>> statuses = [
      {"label": "New", "count": 12, "color": BootstrapColors.colors["yellow"]},
      {"label": "Reviewed", "count": 18, "color": BootstrapColors.colors["teal"]},
      {"label": "Interview", "count": 8, "color": BootstrapColors.colors["primary"]},
      {"label": "Rejected", "count": 4, "color": BootstrapColors.colors["danger"]},
    ];

    final int totalCount =
    statuses.fold(0, (sum, item) => sum + (item["count"] as int));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),

        // 🟢 One bar per status
        ...statuses.map((status) {
          final count = status["count"] as int;
          final double percentage = totalCount > 0 ? count / totalCount : 0.0;
          final color = status["color"] as Color;

          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Label and count row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      status["label"],
                      style: theme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      "$count",
                      style: theme.bodyMedium?.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                // Progress bar
                LayoutBuilder(
                  builder: (context, constraints) {
                    final fullWidth = constraints.maxWidth;
                    return Container(
                      height: 10,
                      width: fullWidth,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeInOutCubic,
                          width: fullWidth * percentage.clamp(0.0, 1.0),
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
