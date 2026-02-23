import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_theme.dart';
import '../auth/guest/guest_promt_widget.dart';
import '../search/components/search_job_card.dart';
import 'components/saved_jobs_list_view.dart';

class SavedJobsView extends StatelessWidget {
  final bool isGuest;
  const SavedJobsView({Key? key,  this.isGuest = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(isGuest) {
      return Center(child: GuestPromptWidget(
        subTitle: "You're browsing as a guest. Sign in to track the status of all your saved jobs in one place ",
      ));
    }
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    "Track the status of all your saved jobs in one place ",
                    style: context.theme
                        .extension<AppTextSizes>()
                        ?.xSmall ?? const TextStyle(fontSize: 11),
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
