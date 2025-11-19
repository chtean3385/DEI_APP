import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_navigator.dart';
import '../../../../constants/enums.dart';
import '../../../../models/state_models/job/job_list_state.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/view_all_button.dart';
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
      return SizedBox.shrink();
    } else if (state.data?.isEmpty == true) {
      return SizedBox.shrink();
    } else {
      return _data(state);
    }
  }

  Widget _data(JobListState state) {
    // Safely handle null or empty list
    if (state.data == null || state.data?.isEmpty == true) return const SizedBox();
    int length = state.data!.length > 5
        ? (state.data!.length + 1)
        : state.data!.length;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16, top: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // header row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      "Recommended jobs for you",
                      style: navigatorKey.currentContext!.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                  if(state.data!.length > 5)  ViewAllButton(
                      isSmall: true,
                      onPressed: AppNavigator.loadRecommendedJobsScreen,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 190,
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
                                    "View all ${state.totalCount?.toString() ?? ""} jobs",
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
              ),
            ],
          ),
        ),
        coloredGap()
      ],
    );
  }

  Widget _shimmerLoader() {
    return ShimmerLoader(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24, top: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ColoredBox(
                    color: Colors.white,
                    child: SizedBox(height: 14, width: 200),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ShimmerRecommendedJobCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
