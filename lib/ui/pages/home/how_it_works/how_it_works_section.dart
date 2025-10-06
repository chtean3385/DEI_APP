import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/state_models/home/how_it_works_state.dart';
import 'how_it_work_slider.dart';
import 'how_it_works_card.dart';

class HowItWorksSection extends ConsumerWidget {
  const HowItWorksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(howItWorksProvider);
    final hasData = (state.data ?? []).isNotEmpty;

    if (!hasData && state.pageState != PageState.loading) {
      return const SizedBox.shrink();
    }
    return state.pageState == PageState.loading ? _loadingUi() :
    _data(state, context);
  }

  Widget _loadingUi() {
    return ShimmerLoader(
      child: Padding(
        padding: const EdgeInsets.only( top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // header row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ColoredBox(
                color: Colors.white,
                child: SizedBox(height: 14, width: 100),
              ),
            ),
            const SizedBox(height: 4),
            // horizontal list
            ShimmerHowItWorkCard(),
          ],
        ),
      ),
    );
  }

  Widget _data(HowItWorkState state, BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only( top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              state.data?.first.heading ?? "",
              style: theme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 4),
          // horizontal list
          _dataItems(state),
        ],
      ),
    );
  }

  Widget _dataItems(HowItWorkState state) {
    return (state.data?.first.howItsWorks?.length ?? 0) > 0
        ? HowItWorkSlider(howItWork: state.data?.first.howItsWorks ?? [])
        : SizedBox.shrink();
  }
}
