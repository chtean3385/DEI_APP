import 'package:dei_champions/ui/pages/home/components/top_companies/top_companies.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_styles.dart';
import '../../../../../widgets/others/rounded_network_image.dart';
import '../../../../../widgets/others/view_all_button.dart';

class TopCompanyCard extends StatelessWidget {
  final Company company;
  final VoidCallback? onTap;

  const TopCompanyCard({required this.company, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(6),
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(16),
          ),
          border: Border.all(color: Colors.black12, width: 1),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                RoundedNetworkImage(
                  imageUrl: company.logoUrl,
                  width: 50,
                  height: 50,
                  borderRadius: 8,
                ),
                const SizedBox(height: 12),
                // Name
                Text(
                  company.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.labelMedium,
                ),
                const SizedBox(height: 8),
                // Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    // ⭐ Star + rating
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 16),
                        const SizedBox(width: 2),
                        Text(
                          company.rating.toStringAsFixed(1),
                          style: theme.displaySmall?.copyWith(
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 6),
                    // 🏢 Company Name
                    Flexible(
                      child: Text(
                        "  |  ${company.reviewCount} reviews",
                        style: theme.displaySmall?.copyWith(
                          color: Colors.black45,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
                // Tag chip
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF4D6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    company.tag,
                    style: theme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF9A6B00),
                    ),
                  ),
                ),
                gapH20(),
                // View jobs button
                ViewAllButton(text: 'View jobs'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
