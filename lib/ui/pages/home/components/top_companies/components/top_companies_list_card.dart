import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/ui/pages/home/components/top_companies/top_companies.dart';
import 'package:flutter/material.dart';

import '../../../../../../widgets/others/rounded_network_image.dart';


class TopCompaniesListCard extends StatelessWidget {
  final Company company;
  const TopCompaniesListCard({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(6),
          bottomLeft: Radius.circular(6),
          bottomRight: Radius.circular(16),
        ),
        side: BorderSide(color: Colors.black12, width: 1),
      ),
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            RoundedNetworkImage(
              imageUrl: company.logoUrl,
              width: 50,
              height: 50,
              borderRadius: 8,
            ),
            gapW16(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    company.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.labelMedium,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,

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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "B2B",
                            style: theme.displaySmall?.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                      ),
                      gapW8(),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            company.tag,
                            style: theme.displaySmall?.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
              color: Colors.black54,
            ),

          ],
        ),
      ),
    );
  }
}
