import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_navigator.dart';
import '../../../../constants/app_styles.dart';
import '../../../../models/state_models/home/job_category_state.dart';
import '../../../../providers/controllers/job/employee_search_jobs_controller.dart';
import 'job_category_card.dart';

/// 📌 "Jobs categories based
class JobsCategorySection extends ConsumerWidget {
  const JobsCategorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryState = ref.watch(jobCategoryProvider);
    final hasData = (categoryState.data?.categories ?? []).isNotEmpty;

    if (!hasData && categoryState.pageState != PageState.loading) {
      return const SizedBox.shrink();
    }
    return categoryState.pageState == PageState.loading
        ?_loadingUi():
    _data(categoryState, context);

  }

  Widget _loadingUi() {
    return ShimmerLoader(
      child: Padding(
        padding: const EdgeInsets.only( top: 12),
        child: Column(
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
            // horizontal list
            _loadingItems(),

          ],
        ),
      ),
    );
  }

  Widget _data(JobCategoryState categoryState, BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only( top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  categoryState.data?.title ?? "",
                  style: theme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          // horizontal list
          _dataItems(categoryState),
        ],
      ),
    );
  }
  Widget _loadingItems() {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 4,
        itemBuilder: (context, index) {
          return ShimmerJobCategoryCard();
        },
        separatorBuilder: (c, v) => gapW8(),
      ),
    );
  }

  Widget _dataItems(JobCategoryState categoryState) {
    return (categoryState.data?.categories.length ?? 0) > 0
        ? SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: (categoryState.data?.categories.length ?? 0),
        // add extra card for "View all"
        itemBuilder: (context, index) {
          return JobCategoryCard(
            categoryModel: categoryState.data!.categories[index],
            onTap: ()=>AppNavigator.loadJobSearchResultScreen(params:EmployeeSearchJobsParams(categoryId:categoryState.data!.categories[index].id ?? "" ) ),
          );
        },
        separatorBuilder: (c, v) => gapW2(),
      ),
    )
        : SizedBox.shrink();
  }
}