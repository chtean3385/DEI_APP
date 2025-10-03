import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_styles.dart';
import '../../../../models/state_models/featured_employers_state.dart';
import 'featured_employer_card.dart';


class FeaturedEmployersSection extends ConsumerWidget {
  const FeaturedEmployersSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredState = ref.watch(featuredEmployersProvider);
    final hasData = (featuredState.data ?? []).isNotEmpty;

    if (!hasData && featuredState.pageState != PageState.loading) {
      return const SizedBox.shrink();
    }
    return featuredState.pageState == PageState.loading
        ?_loadingUi():
    _data(featuredState, context);

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

  Widget _data(FeaturedEmployersState state, BuildContext context) {
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
                  "Featured Employers (Premium Partners)",
                  style: theme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  "Over 300 organizations certified for inclusive hiring — PWD accessibility, LGBTQ+ policies, flexible returnships, and more.",
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
              ],
            ),
          ),
          // horizontal list
          _dataItems(state),
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
          return ShimmerFeaturedEmployerCard();
        },
        separatorBuilder: (c, v) => gapW16(),
      ),
    );
  }

  Widget _dataItems(FeaturedEmployersState state) {
    return (state.data?.length ?? 0) > 0
        ? SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: (state.data?.length ?? 0),
        // add extra card for "View all"
        itemBuilder: (context, index) {
          return FeaturedEmployerCard(
            employer:  state.data![index]
          );
        },
        separatorBuilder: (c, v) => gapW16(),
      ),
    )
        : SizedBox.shrink();
  }
}