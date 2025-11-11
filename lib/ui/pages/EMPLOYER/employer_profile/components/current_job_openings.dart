import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/ui/pages/employer/manage_jobs/components/manage_job_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../manage_jobs/manage_jobs_empty.dart';


class CurrentJobOpenings  extends ConsumerWidget {
  CurrentJobOpenings({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(currentJobOpeningsProvider);
    return  state.data?.isNotEmpty == true ? ListView.separated(
      itemCount: state.data?.length ?? 0,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ManageJobCard(jobModel: state.data![index],
          onTap: ()=>AppNavigator.loadEmployerJobDetailsScreen(),
        );
      },
      separatorBuilder: (context, index) => gapH16(),
    ): EmployerManageJobsEmptyScreen(category: "totalJobs");
  }
}
