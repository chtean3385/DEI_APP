import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_navigator.dart';
import '../../../../constants/enums.dart';
import '../../../../models/state_models/common/blog_state.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/view_all_button.dart';
import '../components/blog_card.dart';

class BlogsHorizontalView extends ConsumerWidget {
  const BlogsHorizontalView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(blogProvider);
    // return _shimmerLoader();
    if (state.pageState == PageState.loading && state.data?.isEmpty == true) {
      return _shimmerLoader();
    } else if (state.pageState == PageState.error) {
      return SizedBox.shrink();
    } else if (state.data?.isEmpty == true) {
      return SizedBox.shrink();
    } else {
      return _data(state);
    }
  }

  Widget _data(BlogState state) {
    // Safely handle null or empty list
    if (state.data == null || state.data?.isEmpty == true)
      return const SizedBox();
    int length = (state.data?.length ?? 0) > 5
        ? 5
        : state.data!.length;
    return Padding(
      padding: const EdgeInsets.only(bottom: 24, top: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // header row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Stay Informed With Us",
                      style: navigatorKey.currentContext!.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Don't miss the trending news",
                      style: navigatorKey.currentContext!.textTheme.displaySmall
                          ?.copyWith(color: navigatorKey.currentContext!.colors.black54),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                const Spacer(),
                ViewAllButton(
                  isSmall: true,
                  onPressed: AppNavigator.loaBlogScreen,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: length,
              itemBuilder: (context, index) {
                final item = state.data![index];
                return BlogCardHorizontal(item: item);
              },
              separatorBuilder: (context, index)=>gapW8(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _shimmerLoader() {
    return ShimmerLoader(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24, top: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                    child: SizedBox(height: 14, width: 180),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return BlogCardHorizontalShimmer();
                },
                separatorBuilder: (context, index)=>gapW8(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
