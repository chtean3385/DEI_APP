import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/ui/pages/EMPLOYER/manage_jobs/components/manage_job_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/enums.dart';
import '../../../../../models/state_models/job/job_list_state.dart';
import '../../../../../widgets/others/custom_loader.dart';
import '../manage_jobs_empty.dart';

class EmployerManageJobListView extends ConsumerWidget {
  EmployerManageJobListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(employerManageJobsProvider);
    // return _shimmerLoader();
    if (state.pageState == PageState.loading) {
      return _shimmerLoader();
    } else if (state.pageState == PageState.error) {
      return SomethingWentWrong();
    } else if (state.data?.isEmpty == true) {
      return EmployerManageJobsEmptyScreen(
        category: state.status ?? "totalJobs",
      );
    } else {
      return _data(state);
    }
  }

  Widget _data(JobListState state) {
    return (state.data?.length ?? 0) > 0
        ? ListView.separated(
            itemCount: state.data?.length ?? 0,
            padding: EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              // return EmployeeManageJobCard(jobModel: state.data![index]);
            },
            separatorBuilder: (context, index) => gapH16(),
          )
        : SizedBox();
  }

  Widget _shimmerLoader() {
    return ListView.builder(
      itemCount: 3,
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        // return ShimmerEmployeeManageJobCard();
      },
    );
  }
}
