import 'package:flutter/material.dart';

import 'genz_advantages.dart';
import 'genz_bottom_buttons.dart';
import 'genz_growth_points.dart';
import 'genz_title_section.dart';

class GenZView extends StatelessWidget {
  const GenZView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GenZTitleSection(),
          GenZGrowthPoints(),
          GenZButtonSection(),
          GenZAdvantages(),
        ],
      ),
    );
  }
}
