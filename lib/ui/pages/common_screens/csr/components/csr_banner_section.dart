import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/custom_loader.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/enums.dart';
import '../../../../../widgets/others/rounded_network_image.dart';

class CsrBannerSection extends ConsumerWidget {
  const CsrBannerSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(csrBannerSectionProvider);
    // Handle loading, error, and data states

    if (state.pageState == PageState.loading) {
      return _loading();
    }

    if (state.pageState == PageState.error) {
      return SomethingWentWrong(
        text: state.errorMessage ?? 'Something went wrong.',
      );
    }

    final data = state.data;
    if (data == null || data.isEmpty) {
      return const SizedBox.shrink();
    }

    final item = data.first;

    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          // Overlay
          RoundedNetworkImage(
            imageUrl: item.backgroundImage ?? "",
            width: double.infinity,
            height: 250,
            borderRadius: 0,
          ),
          // Overlay
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Colors.black.withValues(
                alpha: 0.1,
              ), // Adjust opacity as needed
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                gapH8(),
                Text(
                  item.heading ?? '',
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
                gapH8(),
                Text(
                  item.subHeading ?? '',
                  style: context.textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.left,
                ),
                gapH8(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _loading() {
    return ShimmerLoader(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: ColoredBox(
          color: Colors.white,
          child: SizedBox(width: double.infinity, height: 250),
        ),
      ),
    );
  }
}
