import 'package:dei_champions/main.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_navigator.dart';
import '../../../../constants/enums.dart';
import '../../../../models/state_models/job/job_list_state.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/custom_loader.dart';
import '../../home/components/jobs_you_might_like/jobs_card.dart';

class RecommendedJobHorizontalView extends ConsumerWidget {
  const RecommendedJobHorizontalView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recommendedJobListProvider);
    // return _shimmerLoader();
    if (state.pageState == PageState.loading && state.data?.isEmpty == true) {
      return _shimmerLoader();
    } else if (state.pageState == PageState.error) {
      return SomethingWentWrong();
    } else if (state.data?.isEmpty == true) {
      return SomethingWentWrong(text: "Sorry.. No jobs found");
    } else {
      return _data(state);
    }
  }

  Widget _data(JobListState state) {
    if (state.data?.isEmpty == true) return SizedBox();
    int length = state.data!.length > 5
        ? (state.data!.length + 1)
        : state.data!.length;
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: length,
        itemBuilder: (context, index) {
          if (index < state.data!.length) {
            final item = state.data![index];
            return RecommendedJobCard(
              key: ValueKey("${item.id}_${item.isApplied}_${item.isSaved}"),
              jobModel: item,
              onTap: () =>
                  AppNavigator.loadJobDetailsScreen(jobId: item.id ?? ""),
            );
          } else {
            // special "View all jobs" card
            return SizedBox(
              width: 200,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(width: 1, color: Colors.black12),
                ),
                elevation: 0,
                margin: const EdgeInsets.only(right: 12),
                color: Colors.white,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => AppNavigator.loadRecommendedJobsScreen(),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "View all 70 jobs",
                          style: navigatorKey
                              .currentContext!
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: AppColors.primaryColor),
                        ),
                        SizedBox(width: 6),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _shimmerLoader() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: 3,
        itemBuilder: (context, index) {
          return ShimmerRecommendedJobCard();
        },
      ),
    );
  }
}
