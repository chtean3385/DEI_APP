import 'package:dei_champions/ui/pages/search/components/seach_job_card.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import 'components/appbar_search_screen.dart';
import 'components/bottom_filter_options.dart';

class JobSearchResultScreen extends StatelessWidget {
  const JobSearchResultScreen({Key? key}) : super(key: key);
  static const List<String> filters = [
    "Work mode",
    "Department",
    "Experience",
    "Salary",
    "Companies",
    "Industries",
    "Role",
    "Stipend",
    "Duration",
    "Education",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSearch(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "59 results ",
                style: context.textTheme.displaySmall
              ),
            ),
            // Job list
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemBuilder: (context, index) {
                  return const SearchJobCard();
                },
              ),
            ),

            // Sticky bottom filter bar
            const FilterOptionsBar(filters: filters,),
          ],
        ),
      ),
    );
  }
}