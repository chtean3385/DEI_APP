import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_navigator.dart';
import '../home/components/top_companies/top_companies.dart';
import 'components/appbar_search_screen.dart';
import 'components/featured_companies/featured_companies.dart';
import 'components/most_recent_search.dart';
import 'components/skills_designations_locations.dart';
import 'components/sponsored_companies/sponsored_companies.dart';

class JobSearchScreen extends StatelessWidget {
  const JobSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSearch(context, showSearchField: false),
      body: SafeArea(
        child: ColoredBox(
          color: AppColors.bg,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SkillsDesignationsLocations(
                  onNext: AppNavigator.loadJobSearchResultScreen,
                ),
                gapH16(),
                MostRecentSearches(
                  recentSearchList: [
                    "Java,Ahmadabad",
                    "Fluter,Dart,Ahmadabad,Delhi,Banglore",
                    "Designer ,Ahmadabad",
                  ],
                ),
                gapH16(),
                TopCompaniesSection(),
                gapH16(),
                FeaturedCompaniesSection(),
                gapH16(),
                SponsoredCompanies(),
                gapH16(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
