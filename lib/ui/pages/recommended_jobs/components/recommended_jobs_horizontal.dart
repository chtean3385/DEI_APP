import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/ui/pages/recommended_jobs/components/recommended_job_horizontal_view.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/others/view_all_button.dart';

/// 📌 "Jobs based on your profile" section
class RecommendedJobsHorizontal extends StatelessWidget {
  const RecommendedJobsHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return RecommendedJobHorizontalView();
  }
}
