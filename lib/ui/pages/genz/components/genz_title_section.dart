import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/custom_loader.dart';
import 'package:dei_champions/widgets/others/rounded_network_image.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../widgets/others/custom_theme_button.dart';

class GenZTitleSection extends ConsumerWidget {
  const GenZTitleSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(genZTitleSectionProvider);
    // Handle loading, error, and data states

    if (state.pageState == PageState.loading) {
      return _loading();
    }

    if (state.pageState == PageState.error) {
      return SomethingWentWrong(text: state.errorMessage ?? 'Something went wrong.',);
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
          RoundedNetworkImage(
            imageUrl: item.image ?? "",
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
                alpha: 0.3,
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
                  item.description ?? '',
                  style: context.textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.left,
                ),
                gapH8(),
                if (item.ctas != null && item.ctas!.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(item.ctas!.length, (index) {
                      final cta = item.ctas![index];
                      final isEven = index % 2 == 0;

                      return Padding(
                        padding: EdgeInsets.only(right: 12), // spacing between buttons
                        child: CustomThemeButton(
                          radius: 8,
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          color: isEven ? AppColors.bg : AppColors.primaryColor,
                          borderColor: isEven ? Colors.white : Colors.transparent,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                cta.text ?? "", // assuming CtaModels has a text property
                                style: context.textTheme.displaySmall?.copyWith(
                                  color: isEven ? Colors.black : Colors.white,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            // perform your action (e.g., open link or navigate)
                            if (cta.link != null) {
                              // AppNavigator.handleCta(cta);
                            }
                          },
                        ),
                      );
                    }),
                  ),
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
