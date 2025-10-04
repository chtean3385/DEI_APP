import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';
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
    return state.pageState == PageState.loading
        ? _loadingUi()
        : _data(state, context);
  }

  Widget _loadingUi() {
    return ShimmerLoader(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24, top: 0),
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
              const SizedBox(height: 4),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(height: 10, width: 200),
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
      child: ColoredBox(
        color: BootstrapColors.colors["purple"] ?? Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // header row
                  Text(
                    state.data?.first.heading ?? "",
                    style: theme.titleMedium?.copyWith(color: Colors.white),
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    state.data?.first.subheading ?? "",
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: theme.displaySmall?.copyWith(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // horizontal list
                ],
              ),
            ),
            _dataItems(state),
            gapH16(),
          ],
        ),
      ),
    );
  }

  Widget _dataItems(ChampionCandidatesState state) {
    return (state.data?.first.users?.length ?? 0) > 0
        ? SizedBox(
            height: 240,
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
      height: 240,
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
