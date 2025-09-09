import 'package:flutter/material.dart';

import '../../../../../constants/app_styles.dart';
import '../../../../../widgets/others/rounded_network_image.dart';

/// 📌 Single Job Card
class JobCard extends StatelessWidget {
  final String title;
  final String company;
  final String image;
  final String location;
  final String posted;
  final double rating;

  const JobCard({
    super.key,
    required this.title,
    required this.company,
    required this.location,
    required this.posted,
    required this.rating,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.black12, width: 1),
        ),
        elevation: 0,
        color: Colors.white,
        margin: const EdgeInsets.only(right: 12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company logo placeholder
              RoundedNetworkImage(
                imageUrl: image,
                width: 40,
                height: 40,
                borderRadius: 8,
              ),

              const SizedBox(height: 8),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.labelMedium,
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  // 🏢 Company Name
                  Flexible(
                    child: Text(
                      company,
                      style: theme.displaySmall?.copyWith(
                        color: Colors.black45,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  const SizedBox(width: 6),

                  // ⭐ Star + rating
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const SizedBox(width: 2),
                      Text(
                        rating.toStringAsFixed(1),
                        style: theme.displaySmall?.copyWith(
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              gapH20(),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 14,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      location,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                posted,
                style: TextStyle(color: Colors.grey.shade500, fontSize: 11),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
