import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../search/components/bottom_filter_options.dart';
import 'components/saved_jobs_list_view.dart';


class SavedJobsScreen extends StatelessWidget {
  const SavedJobsScreen({Key? key}) : super(key: key);
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
      appBar: appBarCommon(title: "Saved Jobs"),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text("Track the status of all your saved jobs in one place ", style: context.textTheme.displaySmall?.copyWith(fontSize: 10),textAlign: TextAlign.left,maxLines: 2,overflow: TextOverflow.ellipsis,softWrap: true)),
                  gapW16(),
                  Text("10 results ", style: context.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            // Job list
            Expanded(
              child: SavedJobListView(),
            ),

            // Sticky bottom filter bar
            const FilterOptionsBar(filters: filters),
          ],
        ),
      ),
    );
  }
}
