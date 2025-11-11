import 'package:dei_champions/ui/pages/employer/manage_jobs/components/manage_jobs_filter_options.dart';
import 'package:flutter/material.dart';
import 'components/manage_jobs_list_view.dart';

class ManageJobsScreen extends StatelessWidget {
  const ManageJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ManageJobsFilterOptions(),
        Expanded(child: ManageJobListView()),
      ],
    );
  }
}
