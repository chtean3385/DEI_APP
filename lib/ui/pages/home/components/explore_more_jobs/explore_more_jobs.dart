import 'package:dei_champions/constants/app_navigator.dart';
import 'package:flutter/material.dart';

import '../../../../../models/category/category_model.dart';
import 'jobe_domain_card.dart';

/// 🌐 Explore More Jobs section
class ExploreMoreJobs extends StatelessWidget {
  const ExploreMoreJobs({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final categories = [
      CategoryModel(
        id: 5,
        icon: Icons.computer,
        title: "IT / Tech domain jobs",
        count: "75 Jobs",
        color: Color(0xFF42A5F5),
      ),
      CategoryModel(
        id: 6,
        icon: Icons.bar_chart,
        title: "Sales / Marketing",
        count: "75 Jobs",
        color: Color(0xFFAB47BC),
      ),
      CategoryModel(
        id: 7,
        icon: Icons.headphones,
        title: "Operations domain jobs",
        count: "75 Jobs",
        color: Color(0xFFFFCA28),
      ),
      CategoryModel(
        id: 8,
        icon: Icons.build,
        title: "Core Engineering",
        count: "75 Jobs",
        color: Color(0xFF66BB6A),
      ),
      CategoryModel(
        id: 9,
        icon: Icons.account_balance,
        title: "Banking / Finance",
        count: "75 Jobs",
        color: Color(0xFF26C6DA),
      ),
      CategoryModel(
        id: 10,
        icon: Icons.local_hospital,
        title: "Healthcare domain jobs",
        count: "75 Jobs",
        color: Color(0xFFEF5350),
      ),
      CategoryModel(
        id: 11,
        icon: Icons.people,
        title: "HR / Admin domain jobs",
        count: "75 Jobs",
        color: Color(0xFF8E24AA),
      ),
    ];


    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24, top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Explore more jobs", style: theme.titleMedium),
            ),
            SizedBox(
              height: 90,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return ExploreJobCard(
                   categoryModel: category,
                    onTap: ()=>AppNavigator.loadRecommendedJobsScreen(initialCategoryId:category.id),
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
