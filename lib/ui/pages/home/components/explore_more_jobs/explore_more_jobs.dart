import 'package:flutter/material.dart';

import 'jobe_domain_card.dart';

/// 🌐 Explore More Jobs section
class ExploreMoreJobs extends StatelessWidget {
  const ExploreMoreJobs({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final jobs = [
      {
        "icon": Icons.computer,
        "title": "IT / Tech domain jobs",
        "count": "75 Jobs",
        "color": Color(0xFF42A5F5), // blue 400
      },
      {
        "icon": Icons.bar_chart,
        "title": "Sales / Marketing",
        "count": "75 Jobs",
        "color": Color(0xFFAB47BC), // purple 400
      },
      {
        "icon": Icons.headphones,
        "title": "Operations domain jobs",
        "count": "75 Jobs",
        "color": Color(0xFFFFCA28), // amber 400
      },
      {
        "icon": Icons.build,
        "title": "Core Engineering",
        "count": "75 Jobs",
        "color": Color(0xFF66BB6A), // green 400
      },
      {
        "icon": Icons.account_balance,
        "title": "Banking / Finance",
        "count": "75 Jobs",
        "color": Color(0xFF26C6DA), // cyan 400
      },
      {
        "icon": Icons.local_hospital,
        "title": "Healthcare domain jobs",
        "count": "75 Jobs",
        "color": Color(0xFFEF5350), // red 400
      },
      {
        "icon": Icons.people,
        "title": "HR / Admin domain jobs",
        "count": "75 Jobs",
        "color": Color(0xFF8E24AA), // deep purple 400
      },
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
                itemCount: jobs.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final job = jobs[index];
                  return ExploreJobCard(
                    icon: job["icon"] as IconData,
                    title: job["title"] as String,
                    count: job["count"] as String,
                    color: job["color"] as Color,
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
