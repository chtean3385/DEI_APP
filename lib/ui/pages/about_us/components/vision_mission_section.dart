import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../models/state_models/about_us/about_vision_state.dart';
import 'about_vision_card.dart';

class VisionMissionSection extends ConsumerWidget {
  const VisionMissionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(aboutVisionProvider);
    final hasData = (state.data ?? []).isNotEmpty;

    if (!hasData && state.pageState != PageState.loading) {
      return const SizedBox.shrink();
    }
    return ColoredBox(
      color: AppColors.bg,
      child: state.pageState == PageState.loading
          ? _shimmerItems()
          : _dataItems(state),
    );
  }

  Widget _dataItems(AboutVisionState state) {
    return (state.data?.isNotEmpty ?? false)
        ? SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AboutVisionCard(
                  title: state.data!.first.missionTitle ?? "",
                  value: state.data!.first.missionDescription ?? "",
                ),
                const SizedBox(width: 16),
                AboutVisionCard(
                  title: state.data!.first.visionTitle ?? "",
                  value: state.data!.first.visionDescription ?? "",
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }

  Widget _shimmerItems() {
    return ShimmerLoader(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerAboutVisionCard(),
            const SizedBox(width: 16),
            ShimmerAboutVisionCard(),
          ],
        ),
      ),
    );
  }
}
