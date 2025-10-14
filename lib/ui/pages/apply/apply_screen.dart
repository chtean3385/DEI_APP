import 'package:flutter/material.dart';

import 'components/applied_fitler_options.dart';
import 'components/applied_jobs_list_view.dart';

class ApplyScreen extends StatelessWidget {
  const ApplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppliedFilterOptions(),
        Expanded(child: AppliedJobListView()),
      ],
    );
  }
}
