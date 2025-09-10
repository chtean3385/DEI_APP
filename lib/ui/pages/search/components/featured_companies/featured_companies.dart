import 'dart:math';
import 'package:dei_champions/ui/pages/search/components/featured_companies/featured_company_card.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../widgets/others/view_all_button.dart';
import '../../../home/components/top_companies/top_companies.dart';

class FeaturedCompaniesSection extends StatelessWidget {
  FeaturedCompaniesSection({super.key});

  // Sample list (replace with your API data)
  final tags = ['Foreign MNC', 'Corporate', 'Internet', 'Startup', 'Fintech'];
  final demoCompanies = [
    Company(
      name: "Microsoft",
      logoUrl: "https://img.icons8.com/color/96/000000/microsoft.png",
      rating: 4.2,
      reviewCount: 120,
      tag: "Fintech",
      description:
          "Kotak Life is a leading insurance provider offering innovative life and savings plans for individuals and families.",
      onViewJobs: () {
        // Navigate to Kotak Life jobs
      },
    ),
    Company(
      name: "Amazon",
      logoUrl: "https://img.icons8.com/color/96/000000/amazon.png",
      rating: 4.5,
      reviewCount: 230,
      tag: "Internet",
      description:
          "Amazon is a global leader in e-commerce and cloud services, driving innovation across multiple industries.",
      onViewJobs: () {
        // Navigate to Amazon jobs
      },
    ),
    Company(
      name: "IBM",
      logoUrl: "https://img.icons8.com/color/96/000000/ibm.png",
      rating: 4.0,
      reviewCount: 180,
      tag: "Corporate",
      description:
          "IBM provides cutting-edge cloud and AI solutions, helping enterprises transform through technology and services.",
      onViewJobs: () {
        // Navigate to IBM jobs
      },
    ),
    Company(
      name: "Meta",
      logoUrl: "https://img.icons8.com/color/96/000000/meta.png",
      rating: 3.8,
      reviewCount: 95,
      tag: "Startup",
      description:
          "Meta connects people worldwide through social platforms and invests heavily in virtual reality and the metaverse.",
      onViewJobs: () {
        // Navigate to Meta jobs
      },
    ),
    Company(
      name: "NoBroker.com",
      logoUrl: "https://img.icons8.com/color/96/000000/google-logo.png",
      rating: 3.1,
      reviewCount: 60,
      tag: "Internet",
      description:
          "NoBroker is a fast-growing proptech startup revolutionizing real estate with zero-brokerage rental and property services.",
      onViewJobs: () {
        // Navigate to NoBroker jobs
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final displayCount = min(10, demoCompanies.length);
    final itemCount = displayCount + 1; // +1 for the trailing "View all" tile

    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24, top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text('Featured companies', style: theme.titleMedium),
                  const Spacer(),
                  ViewAllButton(),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: itemCount,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  // Last tile is "View all"
                  if (index == itemCount - 1) {
                    return _ViewAllCard(onTap: () {});
                  }
                  final company = demoCompanies[index];
                  return FeaturedCompanyCard(company: company, onTap: () {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ViewAllCard extends StatelessWidget {
  final VoidCallback onTap;

  const _ViewAllCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(width: 1, color: Colors.black12),
      ),
      elevation: 0,
      margin: const EdgeInsets.only(right: 12),
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // navigate to jobs list
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  "View all \ntop companies",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: theme.labelMedium?.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              SizedBox(width: 6),
              Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
