import 'package:flutter/material.dart';
import '../../home/champion_candidates/champion_candidates_section.dart';
import '../../home/explore_job_category/job_categories_horizontal_scroll.dart';
import '../../home/explore_our_services/explore_our_services.dart';
import '../../home/featured_empoyers/featured_employer_horizontal_scroll.dart';


class EmployerHomeScreen extends StatelessWidget {
  const EmployerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            JobsCategorySection(),
            ExploreOurServices(),
            FeaturedEmployersSection(),
            ChampionCandidatesSection(),
          ],
        ),
      ),
    );
  }
}
