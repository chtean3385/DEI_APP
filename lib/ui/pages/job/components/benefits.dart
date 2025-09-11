// ---------------------------- Benefits grid ----------------------------
import 'package:flutter/material.dart';

class BenefitsGrid extends StatelessWidget {
  const BenefitsGrid({Key? key}) : super(key: key);

  final List<Map<String, String>> _benefits = const [
    {'icon': 'rocket', 'title': 'Job/Soft skill training'},
    {'icon': 'health', 'title': 'Health insurance'},
    {'icon': 'cafe', 'title': 'Cafeteria'},
    {'icon': 'work', 'title': 'Work from Home'},
  ];

  IconData _iconFromString(String key) {
    switch (key) {
      case 'rocket':
        return Icons.rocket_launch;
      case 'health':
        return Icons.favorite;
      case 'cafe':
        return Icons.coffee;
      default:
        return Icons.work;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Benefits', style: theme.titleMedium),
        Text(
          '5470 Users reported these benefits',
          style: theme.bodyMedium?.copyWith(color: Colors.black54),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _benefits.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final b = _benefits[index];
              return Container(
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _iconFromString(b['icon']!),
                      size: 28,
                      color: Colors.black45,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      b['title']!,
                      textAlign: TextAlign.center,
                      style: theme.bodyMedium,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
