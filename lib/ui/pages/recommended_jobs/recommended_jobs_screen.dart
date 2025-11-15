import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_styles.dart';
import '../../../constants/enums.dart';
import '../../../widgets/others/shimmer_loader.dart';
import '../search/components/search_job_card.dart';
import 'components/recommended_jobs_view.dart';

class RecommendedJobsScreen extends StatelessWidget {
  const RecommendedJobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(title: "Recommended Jobs", titleStyleSmall: true),
      body: SafeArea(child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "Discover jobs tailored to your profile and career goals.",
                    style: context.textTheme.displaySmall?.copyWith(
                      fontSize: 11,
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
                gapW16(),
                Consumer(
                  builder: (context, ref, _) {
                    final state = ref.watch(
                      recommendedJobListProvider,
                    ); // example provider
                    final count = state.totalCount; // example provider
                    final loading =
                        state.pageState ==
                            PageState.loading; // example provider
                    return loading
                        ? ShimmerLoader(
                      child: ShimmerBox(height: 12, width: 60, radius: 4),
                    )
                        : Text(
                      "${count ?? 0} results",
                      style: context.textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // Job list
          Expanded(child: RecommendedJobsView()),
        ],
      )),
    );
  }
}
