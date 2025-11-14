import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/ui/pages/home/top_dei_friendly_industries/dei_friendly_industry_horizontal_scroll.dart';
import 'package:dei_champions/ui/pages/home/we_are_hiring/we_are_hiring_section.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../career_explorers/components/explore_services_programs.dart';
import '../common_screens/blog/blogs_horizontal.dart';
import '../main/components/drawer/custom_drawer.dart';
import '../recommended_jobs/components/recommended_jobs_horizontal.dart';
import 'champion_candidates/champion_candidates_section.dart';
import 'components/boost/booster_slider.dart';
import 'components/boost/profile_completion_slider.dart';
import 'components/explore_more_jobs/explore_more_jobs.dart';
import 'components/hiring_info/hiring_info.dart';
import 'components/jobs_based_on_profile/jobs_you_might_like.dart';
import 'components/jobs_you_might_like/jobs_based_on_profile.dart';
import 'components/noticing_you/recruiters_noticing.dart';
import 'components/slider/home_top_slider.dart';
import 'components/top_companies/top_companies.dart';
import 'explore_job_category/job_categories_horizontal_scroll.dart';
import 'explore_our_services/explore_our_services.dart';
import 'featured_empoyers/featured_employer_horizontal_scroll.dart';
import 'how_it_works/how_it_works_section.dart';
import 'job_service_section/job_services_horizontal_scroll.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            ProfileCompletionSlider(),
            RecommendedJobsHorizontal(),
            // WeAreHiringBanner(),
            JobsCategorySection(),
            // ExploreOurServices(),
            ExploreServicesPrograms(),
            BlogsHorizontal(),
            // FeaturedEmployersSection(),
            // JobsServiceSection(),
            ChampionCandidatesSection(),
            DeiFriendlyIndustrySection(),
            // gapH16(),
            //

            // // gapH16(),
            // JobsYouMightLike(),
            // gapH16(),
            // ExploreMoreJobs(),
            // gapH16(),
            // TopCompaniesSection(),
            // gapH16(),
            // RecruitersNoticingWidget(
            //   recruiters: ["01", "02", "03", "04"], // sample data
            // ),
            HiringInfoWidget(),
          ],
        ),
      ),
    );
  }
}
