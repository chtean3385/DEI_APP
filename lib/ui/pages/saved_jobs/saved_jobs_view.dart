import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../search/components/search_job_card.dart';
import 'components/saved_jobs_list_view.dart';

class SavedJobsView extends StatelessWidget {
  const SavedJobsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "Track the status of all your saved jobs in one place ",
                    style: context.textTheme.displaySmall?.copyWith(
                      fontSize: 10,
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
                      employeeSavedJobsProvider,
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
          Expanded(child: EmployeeSavedJobListView()),
        ],
      ),
    );
  }
}
