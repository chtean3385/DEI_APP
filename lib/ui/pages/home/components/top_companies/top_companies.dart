import 'dart:math';
import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/ui/pages/home/components/top_companies/top_company_card.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../widgets/others/view_all_button.dart';

class TopCompaniesSection extends StatelessWidget {
  TopCompaniesSection({super.key});

  // Sample list (replace with your API data)
  final tags = ['Foreign MNC', 'Corporate', 'Internet', 'Startup', 'Fintech'];
  final demoCompanies = List.generate(12, (i) {
    return Company(
      name: [
        'Four Seasons',
        'Seclore',
        'DHL',
        'Bosch',
        'Capgemini',
        'Adobe',
        'Microsoft',
        'HP',
        'Cisco',
        'Oracle',
        'Zoho',
        'Nvidia',
      ][i % 12],
      logoUrl: 'https://via.placeholder.com/112x112.png?text=Logo',
      rating: 3.8 + (i % 5) * 0.2,
      reviewCount: 50 + i * 7,
      tag:
          ['Foreign MNC', 'Corporate', 'Internet', 'Startup', 'Fintech'][i %
              [
                'Foreign MNC',
                'Corporate',
                'Internet',
                'Startup',
                'Fintech',
              ].length],
      // 🔹 Randomly cycles through tags
      onViewJobs: () {
        // open jobs for this company
      },
    );
  });

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
                  Text('Top companies', style: theme.titleMedium),
                  const Spacer(),
                  ViewAllButton(
                    onPressed: AppNavigator.loadTopCompaniesListScreen,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250,
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
                  return TopCompanyCard(company: company,
                      onTap:  AppNavigator.loadCompanyProfileScreen
                  );
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

class Company {
  final String name;
  final String? description;
  final String logoUrl; // can be a local asset with Image.asset if you prefer
  final double rating; // e.g., 4.1
  final int reviewCount; // e.g., 172
  final String tag; // e.g., "Foreign MNC"
  final VoidCallback? onViewJobs;

  Company({
    required this.name,
    required this.logoUrl,
    required this.rating,
    required this.reviewCount,
    required this.tag,
    this.onViewJobs,
    this.description,
  });
}
