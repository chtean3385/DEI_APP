// ---------------------------- Verified Benefits ----------------------------
import 'package:dei_champions/widgets/others/custom_decorated_box.dart';
import 'package:dei_champions/widgets/others/view_all_button.dart';
import 'package:flutter/material.dart';

class VerifiedBenefits extends StatelessWidget {
  const VerifiedBenefits({Key? key}) : super(key: key);

  final List<Map<String, String>> _items = const [
    {
      'title': 'Give back',
      'subtitle': 'Help improve our communities and environment.',
    },
    {
      'title': 'Stay healthy',
      'subtitle': 'Be well supported with medical cover.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.verified, color: Colors.green.shade700, size: 20),
                const SizedBox(width: 8),
                Text('Company verified benefits', style: theme.titleMedium),
              ],
            ),
            TextButton(onPressed: () {}, child: ViewAllButton(isSmall: true)),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _items.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final item = _items[index];
              return CustomDecoratedBox(
                child: SizedBox(
                  width: 260,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['title']!, style: theme.labelMedium),
                      const SizedBox(height: 6),
                      Text(
                        item['subtitle']!,
                        style: theme.bodyMedium?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
