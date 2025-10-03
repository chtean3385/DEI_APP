import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_styles.dart';
import '../../../../models/state_models/job_category_state.dart';
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
        padding: const EdgeInsets.only(bottom: 24, top: 24),
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
                  const SizedBox(height: 4),
                  ColoredBox(
                    color: Colors.white,
                    child: SizedBox(height: 10, width: 400),
                  ),
                  const SizedBox(height: 2),
                  ColoredBox(
                    color: Colors.white,
                    child: SizedBox(height: 10, width: 50),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            // horizontal list
            _loadingItems(),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ColoredBox(
                      color: Colors.white,child: SizedBox(height: 8, width: double.infinity)),
                  const SizedBox(height: 2),
                  ColoredBox(
                      color: Colors.white,child: SizedBox(height: 8, width: double.infinity)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _data(JobCategoryState categoryState, BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 24, top: 24),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      categoryState.data?.title ?? "",
                      style: theme.titleMedium,
                    ),
                    const SizedBox(width: 6),
                    if ((categoryState.data?.categories.length ?? 0) > 0)
                      Text(
                        "(${categoryState.data!.categories.length.toString()})",
                        style: theme.titleMedium?.copyWith(
                          color: Colors.black45,
                        ),
                      ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  categoryState.data?.subtitle ?? "",
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: theme.displaySmall?.copyWith(
                    color: Colors.black45,
                    fontSize: 11,
                  ),
                ),

                const SizedBox(height: 8),
              ],
            ),
          ),
          // horizontal list
          _dataItems(categoryState),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              categoryState.data?.description ?? "",
              style: theme.displaySmall?.copyWith(
                color: Colors.black38,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _loadingItems() {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 3,
        itemBuilder: (context, index) {
          return ShimmerJobCategoryCard();
        },
        separatorBuilder: (c, v) => gapW16(),
      ),
    );
  }

  Widget _dataItems(JobCategoryState categoryState) {
    return (categoryState.data?.categories.length ?? 0) > 0
        ? SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: (categoryState.data?.categories.length ?? 0),
        // add extra card for "View all"
        itemBuilder: (context, index) {
          return JobCategoryCard(
            categoryModel: categoryState.data!.categories[index],
          );
        },
        separatorBuilder: (c, v) => gapW16(),
      ),
    )
        : SizedBox.shrink();
  }
}