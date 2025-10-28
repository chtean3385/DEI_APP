import 'package:dei_champions/models/job/job_model_api.dart';
import 'package:dei_champions/ui/pages/search/components/search_job_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/enums.dart';
import '../../../../models/state_models/job/job_list_state.dart';
import '../../../../providers/providers.dart';

class SearchResultsView extends ConsumerStatefulWidget {
  const SearchResultsView();

  @override
  ConsumerState<SearchResultsView> createState() => _SearchResultsViewState();
}

class _SearchResultsViewState extends ConsumerState<SearchResultsView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final state = ref.read(searchJobListProvider);

      // if (_scrollController.position.pixels >=
      //     _scrollController.position.maxScrollExtent - 200 &&
      //     !state.isLoadingMore &&
      //     state.currentPage < state.lastPage) {
      //   ref.read(searchDishProvider.notifier).loadMore();
      // }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchJobListProvider);
    // return _shimmerLoader();
    if (state.pageState == PageState.loading && state.data?.isEmpty == true) {
      return _shimmerLoader();
    } else if (state.pageState == PageState.initial) {
      return _initialView();
    } else if (state.data?.isEmpty == true) {
      return const Center(child: Text("No results found"));
    } else {
      return _data(state);
    }
  }

  Widget _data(JobListState state) {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: state.data!.length,
      itemBuilder: (context, index) {
        if (index < state.data!.length) {
          final item = state.data![index];
          return SearchJobCard(
            jobModel: item,
            showSave: true,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (_) => ChefDetails(id: item.chef?.id ?? 0),
              //   ),
              // );
            },
          );
        } else {
          // bottom loader
          return const Padding(
            padding: EdgeInsets.all(12.0),
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.secondaryColor,
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

  Widget _initialView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_rounded, size: 64, color: Colors.grey.shade400),
          const SizedBox(height: 12),
          Text(
            "Start typing to discover jobs",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
