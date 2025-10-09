import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../main.dart';
import '../../../../models/disability/disability_inclusion_steps_model.dart';
import '../../../../utils/fa_icon.dart';
import '../../../../widgets/pickers/filter_tabs.dart';

class DisabilityInclusionStepsSection extends ConsumerWidget {
  const DisabilityInclusionStepsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(disabilityInclusionStepsProvider.notifier);
    final state = ref.watch(disabilityInclusionStepsProvider);
    if (state.pageState == PageState.loading) return _loading();
    if (state.pageState == PageState.error) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          state.errorMessage ?? 'Something went wrong.',
          style: const TextStyle(color: Colors.black54),
        ),
      );
    }

    final data = state.data?.first;
    if (data == null) return const SizedBox.shrink();

    final filteredList = controller.getFilteredList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilterTabs(
            tabs: [
              data.sectionLeftTitle ?? "Left",
              data.sectionRightTitle ?? "Right",
            ],
            selected: state.selectedFilter == 'left'
                ? data.sectionLeftTitle
                : data.sectionRightTitle,
            onSelected: (selected) {
              controller.changeFilter(
                selected == data.sectionLeftTitle ? 'left' : 'right',
              );
            },
          ),

          const SizedBox(height: 8),

          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            // disable inner scroll
            shrinkWrap: true,
            // important!
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              final card = filteredList[index];
              return buildCard(card); // full-width card
            },
            separatorBuilder: (context, index) => const SizedBox(height: 12),
          ),
        ],
      ),
    );
  }

  Widget buildCard(RowContentModel card) {
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
              children: [
                iconCircleCard(card.icon, card.step),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        card.title ?? "",
                        style: theme.labelMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        card.text ?? card.aux ?? '',
                        style: theme.displaySmall?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget iconCircleCard(String? iconName, String? step) {
    return Container(
      width: 40, // adjust size as needed
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white, // background color
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withValues(alpha: 0.2), // subtle glow
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Center(
        child: iconName != null
            ? Icon(
                getFontAwesomeIcon(iconName),
                color:
                    BootstrapColors.colors["lightNavy"] ??
                    AppColors.primaryColor,
                size: 20,
              )
            : Text(
                step ?? "",
                style: navigatorKey.currentContext!.textTheme.labelMedium
                    ?.copyWith(
                      color:
                          BootstrapColors.colors["lightNavy"] ??
                          AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
      ),
    );
  }

  Widget _loading() {
    // Show 4 shimmer placeholders
    return Column(
      children: List.generate(4, (index) {
        return Padding(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
          child: ShimmerLoader(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              clipBehavior: Clip.antiAlias,
              child: ColoredBox(
                color: Colors.white,
                child: SizedBox(
                  width: double.infinity,
                  height: 120, // approximate height of your card
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
