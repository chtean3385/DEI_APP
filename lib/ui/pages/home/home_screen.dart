import 'package:dei_champions/ui/pages/home/promo_banner/promo_banner_section.dart';
import 'package:dei_champions/ui/pages/home/top_dei_friendly_industries/dei_friendly_industry_horizontal_scroll.dart';
import 'package:flutter/material.dart';

import '../career_explorers/components/explore_services_programs.dart';
import '../common_screens/blog/blogs_horizontal.dart';
import '../recommended_jobs/components/recommended_jobs_horizontal.dart';
import 'components/boost/profile_completion_slider.dart';
import 'components/hiring_info/hiring_info.dart';
import 'explore_job_category/job_categories_horizontal_scroll.dart';

class HomeScreen extends StatelessWidget {
  final bool isGuest;
  const HomeScreen({super.key,this.isGuest = false});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         if(!isGuest) ProfileCompletionSlider(),
          PromoBannerSection(),
          if(!isGuest)  RecommendedJobsHorizontal(),
          JobsCategorySection(),
          ExploreServicesPrograms(),
          BlogsHorizontal(),
          DeiFriendlyIndustrySection(),
          HiringInfoWidget(),
        ],
      ),
    );
  }
}
