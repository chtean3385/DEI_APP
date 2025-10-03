import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/state_models/home/friendly_industries_state.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_styles.dart';
import 'dei_friendly_industry_card.dart';
import 'freindly_industry_filter_option.dart';


class DeiFriendlyIndustrySection extends ConsumerWidget {
  const DeiFriendlyIndustrySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(friendlyIndustryProvider);
    final hasData = (state.data ?? []).isNotEmpty;

    if (!hasData && state.pageState != PageState.loading) {
      return const SizedBox.shrink();
    }
    return state.pageState == PageState.loading
        ?_loadingUi():
    _data(state, context,ref);

  }

  Widget _loadingUi() {
    return ShimmerLoader(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24, top: 0),
        child: Column(
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
                    child: SizedBox(height: 14, width: 200),
                  ),
                  const SizedBox(height: 4),
                  ColoredBox(
                    color: Colors.white,
                    child: SizedBox(height: 10, width: 400),
                  ),
                  const SizedBox(height: 2),
                  ColoredBox(
                    color: Colors.white,
                    child: SizedBox(height: 10, width: 50),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            // horizontal list
            _loadingItems(),

          ],
        ),
      ),
    );
  }

  Widget _data(FriendlyIndustryState state, BuildContext context,WidgetRef ref) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 24, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Top DEI-Friendly Industries Hiring Now",
                  style: theme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  "Explore inclusive job opportunities across diverse industries that are championing equitable hiring.",
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: theme.displaySmall?.copyWith(
                    color: Colors.black45,
                    fontSize: 11,
                  ),
                ),

                const SizedBox(height: 8),
                FriendlyIndustryFilterOptions(),
                const SizedBox(height: 8),
              ],
            ),
          ),
          // horizontal list
          _dataItems(state,ref),
        ],
      ),
    );
  }
  Widget _loadingItems() {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 3,
        itemBuilder: (context, index) {
          return ShimmerDeiFriendlyIndustryCard();
        },
        separatorBuilder: (c, v) => gapW16(),
      ),
    );
  }

  Widget _dataItems(FriendlyIndustryState state, WidgetRef ref) {
    final controller = ref.read(friendlyIndustryProvider.notifier);
    final industries = controller.filteredIndustries;

    if (industries.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: industries.length,
        itemBuilder: (context, index) {
          return DeiFriendlyIndustryCard(
            employer: industries[index],
          );
        },
        separatorBuilder: (c, v) => gapW16(),
      ),
    );
  }

}