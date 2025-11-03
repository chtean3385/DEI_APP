import 'package:flutter/material.dart';

import 'components/applied_fitler_options.dart';
import 'components/applied_jobs_list_view.dart';

class ApplyScreen extends StatelessWidget {
  final Map<String, dynamic>? params;
  const ApplyScreen({super.key, this.params});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppliedFilterOptions(params),
        Expanded(child: AppliedJobListView()),
      ],
    );
  }
}
