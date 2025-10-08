import 'package:dei_champions/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/enums.dart';
import '../../../../models/empower_women/empower_women_workforce_model.dart';
import '../../../../providers/providers.dart';
import '../../../../utils/fa_icon.dart';
import '../../../../widgets/others/custom_theme_button.dart';
import '../../../../widgets/others/shimmer_loader.dart';

class EmpowerWomenWorkForce extends ConsumerWidget {
  const EmpowerWomenWorkForce({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(womenWorkForceProvider);
    // Handle loading, error, and data states
    if (state.pageState == PageState.loading) {
      return _loading();
    }

    if (state.pageState == PageState.error) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          state.errorMessage ?? 'Something went wrong.',
          style: TextStyle(color: Colors.black54),
        ),
      );
    }

    final data = state.data;
    if (data == null || data.isEmpty) {
      return const SizedBox.shrink();
    }

    final item = data.first;
    final theme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          item.sectionTitle ?? "",
          style: theme.displaySmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        if (item.cards?.isNotEmpty == true)
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(item.cards?.length ?? 0, (index) {
              return buildCard(item.cards![index]);
            }),
          ),
        gapH8(),
        CustomThemeButton(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Explore Women Focused Jobs",
                style: theme.displaySmall?.copyWith(color: Colors.white),
              ),
              gapW16(),
              Icon(Icons.arrow_forward_ios, color: Colors.white, size: 10),
            ],
          ),
          color: AppColors.primaryColor,
          radius: 8,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          onTap: () {},
        ),
      ],
    );
  }

  // assuming you have your model and API data parsed already
  Widget buildCard(CardData card) {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  getFontAwesomeIcon(card.icon),
                  color:
                      BootstrapColors.colors["lightNavy"] ??
                      AppColors.primaryColor,
                  size: 20,
                ),
                gapW16(),
                Expanded(
                  child: Text(
                    card.title ?? "",
                    style: theme.labelMedium,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              card.description ?? '',
              style: theme.displaySmall?.copyWith(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildShimmerCard() {
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(height: 100, width: double.infinity),
    );
  }

  Widget _loading() {
    return ShimmerLoader(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
            child: ColoredBox(
              color: Colors.white,
              child: SizedBox(width: double.infinity, height: 14),
            ),
          ),
          SizedBox(height: 2),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(4, (index) {
              return buildShimmerCard();
            }),
          ),
        ],
      ),
    );
  }
}
