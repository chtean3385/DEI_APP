import 'package:flutter/material.dart';

import 'applied_jobs_screen.dart';
import 'apply_empty.dart';

class ApplyScreen extends StatelessWidget {
  final bool showAppliedList;
  const ApplyScreen({super.key,this.showAppliedList = false});

  @override
  Widget build(BuildContext context) {
    return showAppliedList  ? AppliedJobsScreen()   :  ApplyEmptyScreen();
  }
}
