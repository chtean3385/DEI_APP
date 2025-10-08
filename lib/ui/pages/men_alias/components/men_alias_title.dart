
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/rounded_network_image.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';

class MenAliasTitle extends ConsumerWidget {
  const MenAliasTitle({super.key});

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
              color: Colors.black.withValues(alpha: 0.1), // Adjust opacity as needed
            ),
          ),
          // appBarCommon(title: "Men as Allies",arrowLeft: true, bgColor: Colors.transparent, titleIconColor: Colors.white),
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
                  item.subtitle ?? '',
                  style: context.textTheme.displaySmall?.copyWith(
                    color: Colors.white,fontSize: 10
                  ),
                  textAlign: TextAlign.left,
                ),
                // gapH8(),
                // ViewAllButton(
                //   text: "Explore Women Focused Jobs",
                //   fillColor: true,
                //   isSmall: true,
                //   radius: 4,
                //   showArrow: true,
                // )
                // CustomThemeButton(
                //   child: Row(
                //     mainAxisSize: MainAxisSize.min,
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Text(
                //         "Explore Women Focused Jobs",
                //         style: context.textTheme.displaySmall?.copyWith(color: Colors.white),
                //       ),
                //       gapW16(),
                //       Icon(Icons.arrow_forward_ios,color: Colors.white,size: 10,)
                //     ],
                //   ),
                //   color: AppColors.primaryColor,
                //   radius: 8,
                //   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                //   onTap: () {},
                // ),
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
        padding: const EdgeInsets.only( bottom: 16,left: 16,right: 16,top: 16),
        child:  ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16),
          child: ColoredBox(
            color: Colors.white,
            child: SizedBox(
              width: double.infinity,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}
