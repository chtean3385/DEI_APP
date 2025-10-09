import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/ui/pages/empower_women/components/women_program.dart';
import 'package:dei_champions/ui/pages/empower_women/components/women_quotes.dart';
import 'package:flutter/material.dart';

import 'empower_women_workforce.dart';
import 'explore_women_focused_job.dart';


class EmpowerWomenView extends StatelessWidget {
  const EmpowerWomenView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WomenPrograms(),
          EmpowerWomenWorkForce(),
          ExploreWomenJobs(),
          WomenQuotes(),
        ],
      ),
    );
  }
}
