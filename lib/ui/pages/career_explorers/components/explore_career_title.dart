
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/rounded_network_image.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/enums.dart';
import '../../../../widgets/others/custom_theme_button.dart';

class ExploreCareerTitle extends ConsumerWidget {
  const ExploreCareerTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(menAliasTitleProvider);
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

    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          RoundedNetworkImage(
            imageUrl: "https://res.cloudinary.com/dv4aury9e/image/upload/v1758783150/DEICHAMP/q3wytvpyx9nwkubfngx4.png",
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
              color: Colors.black.withValues(alpha: 0.5), // Adjust opacity as needed
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   item.title ?? '',
                //   style: context.textTheme.labelSmall?.copyWith(color: Colors.white),
                //   softWrap: true,
                //   overflow: TextOverflow.ellipsis,
                //   textAlign: TextAlign.left,
                //   maxLines: 2,
                // ),
                gapH8(),
                Text(
                  "Build your future with inclusive opportunities, career programs, and growth-focused services." ,
                  style: context.textTheme.displaySmall?.copyWith(
                    color: Colors.white,fontSize: 10
                  ),
                  textAlign: TextAlign.left,
                ),
                gapH8(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomThemeButton(
                      radius: 8,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      color: AppColors.bg,
                      borderColor: Colors.white,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                             "Register Free",
                            style: context.textTheme.displaySmall?.copyWith(
                              color: Colors.black,
                              fontSize: 11,
                            ),
                          ),
                          // gapW8(),
                          // Icon(Icons.arrow_forward_ios,color: Colors.white,size: 10,)
                        ],
                      ),
                    ),
                    gapW16(),
                    CustomThemeButton(
                      radius: 8,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      color: AppColors.primaryColor,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                             "Explore Paid Services",
                            style: context.textTheme.displaySmall?.copyWith(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ),
                          // gapW8(),
                          // Icon(Icons.arrow_forward_ios,color: Colors.white,size: 10,)
                        ],
                      ),
                    ),
                  ],
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
        padding: const EdgeInsets.only( bottom: 16),
        child:  ColoredBox(
          color: Colors.white,
          child: SizedBox(
            width: double.infinity,
            height: 250,
          ),
        ),
      ),
    );
  }
}
