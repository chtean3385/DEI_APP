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

class BlogView extends ConsumerWidget {
  BlogView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(blogProvider);
    // return _shimmerLoader();
    if (state.pageState == PageState.loading) {
      return _shimmerLoader();
    } else if (state.pageState == PageState.error) {
      return SomethingWentWrong();
    } else if (state.data?.isEmpty == true) {
      return EmptyWidget();
    } else {
      return _data(state,context);
    }
  }

  Widget _data(BlogState state,BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
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
            ListView.separated(
              itemCount: state.data!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              itemBuilder: (context, index) {
                return BlogCard(item: state.data![index]);
              },
              separatorBuilder: (c, s) => gapH24(),
            ),
          ],
        ),
      ),
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
