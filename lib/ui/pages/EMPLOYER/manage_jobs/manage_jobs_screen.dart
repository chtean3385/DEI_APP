import 'package:dei_champions/ui/pages/EMPLOYER/manage_jobs/components/manage_jobs_filter_options.dart';
import 'package:flutter/material.dart';
import 'components/manage_jobs_list_view.dart';

class EmployerManageJobsScreen extends StatelessWidget {
  const EmployerManageJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          EmployerManageJobsFilterOptions(),
          Expanded(child: EmployerManageJobListView()),
        ],
      ),
    );
  }
}
