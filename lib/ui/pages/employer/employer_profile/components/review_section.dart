// ---------------------------- Reviews carousel ----------------------------
import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/custom_decorated_box.dart';
import 'package:flutter/material.dart';

class ReviewsCarousel extends StatelessWidget {
  const ReviewsCarousel({Key? key}) : super(key: key);

  final List<Map<String, String>> reviews = const [
    {
      'rating': '5.0',
      'text': 'Company is good to work',
      'meta': 'Anonymous, fresher for 5 years in Gurgaon',
    },
    {
      'rating': '5.0',
      'text': 'This company improved my knowledge and life',
      'meta': 'Anonymous, fresher in Hyderabad',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Reviews', style: theme.titleMedium),
        Text(
          'Total 56.4K+ reviews',
          style: theme.bodyMedium?.copyWith(color: Colors.black54),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 130,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: reviews.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final r = reviews[index];
              return CustomDecoratedBox(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .65,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withValues(alpha: .2),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(r['rating']!, style: theme.labelMedium),
                            const SizedBox(width: 6),
                            const Icon(
                              Icons.star,
                              size: 16,
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        r['text']!,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Text(
                        r['meta']!,
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
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
