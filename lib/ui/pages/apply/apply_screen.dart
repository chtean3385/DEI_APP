import 'package:flutter/material.dart';

import '../auth/guest/guest_promt_widget.dart';
import 'components/applied_fitler_options.dart';
import 'components/applied_jobs_list_view.dart';

class ApplyScreen extends StatelessWidget {
  final bool isGuest;
  final Map<String, dynamic>? params;
  const ApplyScreen({super.key, this.params,this.isGuest = false});

  @override
  Widget build(BuildContext context) {
    if(isGuest) {
      return Center(child: GuestPromptWidget(
        subTitle: "You're browsing as a guest. Sign in to access your applied jobs and track your application progress.",
      ));
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppliedFilterOptions(params),
        Expanded(child: AppliedJobListView()),
      ],
    );
  }
}
