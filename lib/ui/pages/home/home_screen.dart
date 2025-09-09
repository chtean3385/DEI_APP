import 'package:dei_champions/constants/app_styles.dart';
import 'package:flutter/material.dart';

import 'components/boost/booster_slider.dart';
import 'components/jobs_based_on_profile/jobs_you_might_like.dart';
import 'components/jobs_you_might_like/jobs_based_on_profile.dart';
import 'components/slider/home_top_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         gapH16(),
          HomeTopSlider(),
          gapH16(),
          ResumeBoostSlider(),
          gapH16(),
          JobsBasedOnProfile(),
          gapH16(),
          JobsYouMightLike(),
        ],
      ),
    );
  }
}
