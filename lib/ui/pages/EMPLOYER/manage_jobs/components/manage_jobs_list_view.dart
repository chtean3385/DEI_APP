import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/ui/pages/employer/manage_jobs/components/manage_job_card.dart';
import 'package:dei_champions/ui/pages/employer/manage_jobs/manage_jobs_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ManageJobListView  extends ConsumerWidget {
  ManageJobListView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(manageJobsProvider);
    return  state.data?.isNotEmpty == true ? ListView.separated(
      itemCount: state.data?.length ?? 0,
      padding: EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ManageJobCard(jobModel: state.data![index],
        );
      },
      separatorBuilder: (context, index) => gapH16(),
    ): ManageJobsEmptyScreen();
  }
}
