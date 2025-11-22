import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_styles.dart';
import '../../../../models/state_models/home/champion_candidates_state.dart';
import 'champion_candidate_card.dart';

class ChampionCandidatesSection extends ConsumerWidget {
  const ChampionCandidatesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(championCandidatesProvider);
    final hasData = (state.data ?? []).isNotEmpty;

    if (!hasData && state.pageState != PageState.loading) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom:12),
      child: ColoredBox(
        color: context.colors.commonDividerBgColor,
        child: state.pageState == PageState.loading
            ? _loadingUi()
        // :_loadingUi()
            : _data(state, context),
      ),
    );
  }

  Widget _loadingUi() {
    return ShimmerLoader(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12, top: 12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header row
              ColoredBox(
                color: Colors.white,
                child: SizedBox(height: 14, width: 100),
              ),
              const SizedBox(height: 8),

              // horizontal list
              _shimmerItems(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _data(ChampionCandidatesState state, BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 24, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // header row
                Text(
                  state.data?.first.heading ?? "",
                  style: theme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          _dataItems(state),
        ],
      ),
    );
  }

  Widget _dataItems(ChampionCandidatesState state) {
    return (state.data?.first.users?.length ?? 0) > 0
        ? SizedBox(
            height: 230,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: (state.data?.first.users?.length ?? 0),
              itemBuilder: (context, index) {
                return ChampionCandidateCard(
                  categoryModel: state.data!.first.users![index],
                );
              },
              separatorBuilder: (c, v) => gapW16(),
            ),
          )
        : SizedBox.shrink();
  }

  Widget _shimmerItems() {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 0),
        itemCount: 3,
        itemBuilder: (context, index) {
          return ShimmerChampionCandidateCard();
        },
        separatorBuilder: (c, v) => gapW16(),
      ),
    );
  }
}
