import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/models/state_models/common/blog_state.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/enums.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/custom_loader.dart';
import 'blog_card.dart';

class BlogListView extends ConsumerStatefulWidget {
  const BlogListView();

  @override
  ConsumerState<BlogListView> createState() => _SearchResultsViewState();
}

class _SearchResultsViewState extends ConsumerState<BlogListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final state = ref.read(blogProvider);

      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200 &&
          !state.isLoadingMore &&
          state.currentPage < state.lastPage) {
        ref.read(blogProvider.notifier).loadMore();
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
    final state = ref.watch(blogProvider);
    // return _shimmerLoader();
    if (state.pageState == PageState.loading && state.data?.isEmpty == true) {
      return _shimmerLoader();
    } else if (state.pageState == PageState.error) {
      return SomethingWentWrong();
    } else if (state.data?.isEmpty == true) {
      return EmptyWidget();
    } else {
      return _data(state);
    }
  }

  Widget _data(BlogState state) {
    return Column(
      children: [
        ColoredBox(
          color: Colors.white,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Latest Posts",
                    style: context.textTheme.titleMedium?.copyWith(
                      color: AppColors.primaryColor,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  // gapH8(),
                  Text(
                    "Don't miss the trending news",
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            itemCount: state.data!.length + (state.isLoadingMore ? 1 : 0),
            separatorBuilder: (c, s) => gapH24(),
            itemBuilder: (context, index) {
              if (index < state.data!.length) {
                final item = state.data![index];
                return BlogCard(item:item);
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
          ),
        ),
      ],
    );
  }

  Widget _shimmerLoader() {
    return ListView.separated(
      itemCount: 3,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ShimmerBlogCard();
      },
      separatorBuilder: (c, s) => gapH24(),
    );
  }

}
