import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/controllers/job/employee_search_jobs_controller.dart';
import '../../../providers/providers.dart';
import 'components/appbar_search_screen.dart';
import 'components/bottom_filter_options.dart';
import 'components/category_drop_down.dart';
import 'components/search_result_view.dart';
import 'components/sort_by_job.dart';
import 'components/state_drop_down.dart';

class JobSearchResultScreen extends ConsumerStatefulWidget {
  final EmployeeSearchJobsParams? params;

  const JobSearchResultScreen({Key? key, this.params}) : super(key: key);
  static const List<String> filters = ["Industry", "Salary Range", "Job Type"];

  @override
  ConsumerState<JobSearchResultScreen> createState() =>
      _JobSearchResultScreenState();
}

class _JobSearchResultScreenState extends ConsumerState<JobSearchResultScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.params != null) {
        if (widget.params?.showFilter == true) {
          FilterOptionsBar(
            filters: JobSearchResultScreen.filters,
          ).openFilterModal(context);
        } else {
          ref
              .read(searchJobListProvider.notifier)
              .fetchJobs(
                query: widget.params?.searchQuery,
                sortBy: widget.params?.sortBy,
                categoryId: widget.params?.categoryId,
                selectedState: widget.params?.selectedState,
                industryId: widget.params?.industryId,
              );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchJobListProvider);
    final categoryState = ref.watch(jobCategoryProvider);
    final controller = ref.read(searchJobListProvider.notifier);
    final jobTypeState = ref.watch(jobTypesProvider);
    final industryState = ref.watch(friendlyIndustryProvider);
    final salaryTypeState = ref.watch(salaryRangeTypesProvider);

    return Scaffold(
      appBar: appBarSearch(
        context,
        onChanged: (query) => controller.fetchJobs(query: query),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sort and State dropdowns
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SortByDropdown(
                      onChanged: (stateValue) =>
                          controller.fetchJobs(sortBy: stateValue),
                    ),
                  ),
                  Expanded(
                    child: StateDropdown(
                      onChanged: (stateValue) =>
                          controller.fetchJobs(selectedState: stateValue),
                    ),
                  ),
                ],
              ),
            ),

            // Category and total count
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 8,
                top: 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "${state.totalCount ?? 0} results ",
                      style: context.textTheme.displaySmall,
                    ),
                  ),
                  Expanded(
                    child: CategoryDropdown(
                      onChanged: (categoryId) =>
                          controller.fetchJobs(categoryId: categoryId),
                      categories: categoryState.data?.categories ?? [],
                    ),
                  ),
                ],
              ),
            ),

            // Job list
            Expanded(child: SearchResultsView()),

            // Sticky bottom filter bar
            const FilterOptionsBar(filters: JobSearchResultScreen.filters),
          ],
        ),
      ),
    );
  }
}
