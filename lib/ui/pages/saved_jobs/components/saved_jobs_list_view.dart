import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/ui/pages/saved_jobs/components/saved_jobs_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../constants/app_colors.dart';
import '../../../../../../constants/enums.dart';
import '../../../../../../models/state_models/job/job_list_state.dart';
import '../../../../../../providers/providers.dart';
import '../../../../models/accessibility/acccessibility_settings.dart';
import '../../../../providers/theme_controller.dart';
import '../../../../widgets/others/custom_loader.dart';
import '../../search/components/search_job_card.dart';

class EmployeeSavedJobListView extends ConsumerStatefulWidget {
  const EmployeeSavedJobListView();

  @override
  ConsumerState<EmployeeSavedJobListView> createState() =>
      _SearchResultsViewState();
}

class _SearchResultsViewState extends ConsumerState<EmployeeSavedJobListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final state = ref.read(employeeSavedJobsProvider);

      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !state.isLoadingMore &&
          state.currentPage < state.lastPage) {
        ref.read(employeeSavedJobsProvider.notifier).loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(employeeSavedJobsProvider);
    final accessibility = ref.watch(accessibilityProvider);
    // return _shimmerLoader();
    if (state.pageState == PageState.loading && state.data?.isEmpty == true) {
      return _shimmerLoader();
    } else if (state.pageState == PageState.error) {
      return SomethingWentWrong();
    } else if (state.data?.isEmpty == true) {
      return SavedJobsEmptyScreen();
    } else {
      return _data(state,context,accessibility);
    }
  }

  Widget _data(JobListState state,BuildContext context,AccessibilitySettingsModel accessibility) {
    final theme = Theme.of(context).textTheme;
    final double baseFontSize = theme.labelMedium?.fontSize ?? 14;
    final double scaledFontSize =
    (baseFontSize * accessibility.fontScale).clamp(11.0, 14.0);
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: state.data!.length + (state.isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < state.data!.length) {
          final item = state.data![index];
          return SearchJobCard(
            scaledFontSize: scaledFontSize,
            key: ValueKey("${item.id}_${item.isApplied}_${item.isSaved}"),
            jobModel: item,
            onTap: () =>
                AppNavigator.loadJobDetailsScreen(jobId: item.id ?? ""),
          );
        } else {
          // bottom loader
          return const Padding(
            padding: EdgeInsets.all(12.0),
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.primaryColor,
              ),
            ),
          );
        }
      },
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
