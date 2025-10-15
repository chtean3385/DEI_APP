import 'package:dei_champions/ui/pages/career_explorers/components/start_your_journey.dart';
import 'package:flutter/material.dart';

import 'explore_career_title.dart';
import 'explore_services_programs.dart';


class CareerExplorersView extends StatelessWidget {
  const CareerExplorersView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ExploreCareerTitle(),
          ExploreServicesPrograms(),
          StartYourJourney(),



        ],
      ),
    );
  }
}
