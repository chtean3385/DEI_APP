import 'dart:math';
import 'package:dei_champions/ui/pages/search/components/sponsored_companies/sponsored_company_card.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../widgets/others/view_all_button.dart';
import '../../../home/components/top_companies/top_companies.dart';
import 'filter_chips.dart';

class SponsoredCompanies extends StatelessWidget {
  SponsoredCompanies({super.key});

  // Sample list (replace with your API data)
  final tags = ['Foreign MNC', 'Corporate', 'Internet', 'Startup', 'Fintech'];
  final demoCompanies = [
    Company(
      name: "Lenovo",
      logoUrl: "https://img.icons8.com/color/96/000000/lenovo.png",
      rating: 4.1,
      reviewCount: 210,
      tag: "Technology",
      description:
          "Lenovo is a global leader in PCs, laptops, and smart devices, driving innovation in consumer and enterprise solutions.",
      onViewJobs: () {
        // Navigate to Lenovo jobs
      },
    ),
    Company(
      name: "EPAM Systems",
      logoUrl: "https://img.icons8.com/ios-filled/100/000000/epam.png",
      rating: 3.7,
      reviewCount: 1800,
      tag: "IT Services",
      description:
          "EPAM Systems is a leading provider of digital platform engineering and product development services worldwide.",
      onViewJobs: () {
        // Navigate to EPAM jobs
      },
    ),
    Company(
      name: "Dow Chemical",
      logoUrl: "https://img.icons8.com/color/96/000000/chemical-plant.png",
      rating: 3.9,
      reviewCount: 850,
      tag: "Chemicals",
      description:
          "Dow Chemical delivers a broad range of science-based products and solutions for packaging, infrastructure, and consumer care.",
      onViewJobs: () {
        // Navigate to Dow Chemical jobs
      },
    ),
    Company(
      name: "EC-Council",
      logoUrl:
          "https://img.icons8.com/color/96/000000/security-configuration.png",
      rating: 4.0,
      reviewCount: 650,
      tag: "Cybersecurity",
      description:
          "EC-Council is a global leader in cybersecurity certification programs such as CEH, CHFI, and CND.",
      onViewJobs: () {
        // Navigate to EC-Council jobs
      },
    ),
    Company(
      name: "Tech Mahindra",
      logoUrl: "https://img.icons8.com/color/96/000000/tech.png",
      rating: 4.2,
      reviewCount: 4200,
      tag: "IT Services",
      description:
          "Tech Mahindra provides innovative IT services, networking technology solutions, and business process outsourcing worldwide.",
      onViewJobs: () {
        // Navigate to Tech Mahindra jobs
      },
    ),
  ];

  static const List<String> filters = [
    "Work mode",
    "Department",
    "Experience",
    "Salary",
    "Companies",
    "Industries",
    "Role",
    "Stipend",
    "Duration",
    "Education",
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final displayCount = min(10, demoCompanies.length);
    final itemCount = displayCount; // +1 for the trailing "View all" tile

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
                  Text('Sponsored companies', style: theme.titleMedium),
                  const Spacer(),
                  ViewAllButton(),
                ],
              ),
            ),
            FilterChips(
              filters: filters,
              onSelected: (filter) {
                print("Selected: $filter");
              },
            ),
            SizedBox(
              height: 180,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: itemCount,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final company = demoCompanies[index];
                  return SponsoredCompanyCard(company: company, onTap: () {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
