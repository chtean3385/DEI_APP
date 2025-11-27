import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/models/state_models/common/blog_state.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/enums.dart';
import '../../../../main.dart';
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
        Expanded(
          child: ListView.separated(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            itemCount: state.data!.length + (state.isLoadingMore ? 1 : 0),
            separatorBuilder: (c, s) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: coloredGap(),
            ),
            itemBuilder: (context, index) {
              if (index < state.data!.length) {
                final item = state.data![index];
                return BlogCard(item:item);
              } else {
                // bottom loader
                return  Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: context.colors.buttonPrimaryColor,
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
