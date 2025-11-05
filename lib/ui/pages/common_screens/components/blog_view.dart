import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/models/state_models/common/blog_state.dart';
import 'package:dei_champions/ui/pages/search/components/search_job_card.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
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
      return _data(state);
    }
  }

  Widget _data(BlogState state) {
    return SafeArea(
      child: ListView.separated(
        itemCount: state.data!.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        itemBuilder: (context, index) {
          return BlogCard(item: state.data![index]);
        },
        separatorBuilder: (c, s) => gapH24(),
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
        return ShimmerLoader(
          child: ShimmerBox(height: 300, width: double.infinity, radius: 16),
        );
      },
      separatorBuilder: (c, s) => gapH24(),
    );
  }
}
