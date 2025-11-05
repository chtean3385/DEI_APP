import 'package:dei_champions/models/state_models/common/faq_state.dart';
import 'package:dei_champions/ui/pages/search/components/search_job_card.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../../../../constants/enums.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/custom_loader.dart';
import 'faq_card.dart';

class FaqView extends ConsumerWidget {
  FaqView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(faqProvider);
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

  Widget _data(FaqState state) {
    return SafeArea(
      child: ListView.separated(
        itemCount: state.data!.length,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        itemBuilder: (context, index) {
          return FaqCard(item: state.data![index]);
        },
        separatorBuilder: (c, s) => Divider(color: Colors.white70, height: 12),
      ),
    );
  }

  Widget _shimmerLoader() {
    return ListView.separated(
      itemCount: 8,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      itemBuilder: (context, index) {
        return ShimmerLoader(
          child: ShimmerBox(height: 50, width: double.infinity, radius: 16),
        );
      },
      separatorBuilder: (c, s) => Divider(color: Colors.white70, height: 12),
    );
  }
}
