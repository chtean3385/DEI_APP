import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'job_category_card.dart';

/// 📌 "Jobs categories based
class JobsCategorySection extends ConsumerWidget {
  const JobsCategorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryState = ref.watch(jobCategoryProvider);
    final theme = Theme.of(context).textTheme;
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24, top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // header row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    categoryState.data?.title ?? "",
                    style: theme.titleMedium,
                  ),
                  const SizedBox(width: 6),
                  if ((categoryState.data?.categories.length ?? 0) > 0)
                    Text(
                      "(${categoryState.data!.categories.length.toString()})",
                      style: theme.titleMedium?.copyWith(color: Colors.black45),
                    ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // horizontal list
            (categoryState.data?.categories.length ?? 0) >0 ? SizedBox(
              height: 190,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: (categoryState.data?.categories.length ?? 0) + 1, // add extra card for "View all"
                itemBuilder: (context, index) {
                  if (index < (categoryState.data?.categories.length ?? 0) ) {
                    return JobCategoryCard(
                      categoryModel: categoryState.data!.categories[index],
                    );
                  } else {
                    // special "View all jobs" card
                    return SizedBox(
                      width: 180,
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
                          onTap: () {
                            // navigate to jobs list
                          },
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "View all categories",
                                  style: theme.labelMedium?.copyWith(
                                    color: AppColors.primaryColor,
                                  ),
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
            ) :SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
