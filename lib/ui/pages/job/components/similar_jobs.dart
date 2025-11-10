import 'package:dei_champions/main.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_navigator.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/enums.dart';
import '../../../../models/state_models/job/job_list_state.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/custom_loader.dart';
import '../../search/components/search_job_card.dart';

class SimilarJobsListView extends ConsumerWidget {
  final String jobId;

  SimilarJobsListView({super.key,required this.jobId});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final state = ref.watch(similarJobListProvider(jobId));
    print("jobs.length");
    print( state.data?.length);
    // return _shimmerLoader();
    if (state.pageState == PageState.loading && state.data?.isEmpty == true) {
      return _shimmerLoader();
    } else if (state.pageState == PageState.error) {
      return SomethingWentWrong();
    } else if (state.data?.isEmpty == true) {
      return SomethingWentWrong(text: "Sorry.. No similar jobs found",);
    } else {
      return _data(state);
    }
  }

  Widget _data(JobListState state) {
    final jobs = state.data ?? [];
    if (jobs.isEmpty) return const SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Similar jobs',
          style: navigatorKey.currentContext!.textTheme.titleMedium,

        ),
        gapH16(),
        ListView.builder(
          padding: EdgeInsets.zero,
          physics:  NeverScrollableScrollPhysics(),
          itemCount: state.data?.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final item = state.data![index];
            return SearchJobCard(
              key: ValueKey("${item.id}_${item.isApplied}_${item.isSaved}"),
              jobModel: item,
              onTap: () =>
                  AppNavigator.loadJobDetailsScreen(jobId: item.id ?? ""),
            );
          },
        ),
      ],
    );
  }
  Widget _shimmerLoader() {
    return ListView.builder(
      itemCount: 3,
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        return ShimmerSearchJobCard();
      },
    );
  }
}
