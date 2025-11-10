import 'package:dei_champions/ui/pages/saved_jobs/saved_jobs_view.dart';
import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';

import '../search/components/bottom_filter_options.dart';

class SavedJobsScreen extends StatelessWidget {
  const SavedJobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(title: "Saved Jobs"),
      body: SafeArea(
        child: SavedJobsView(),
      ),
    );
  }
}
