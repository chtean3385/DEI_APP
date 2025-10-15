import 'package:dei_champions/constants/app_drawables.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/enums.dart';
import '../../../../models/state_models/home/we_are_hiring_state.dart';
import '../../../../widgets/others/custom_theme_button.dart';
import '../../../../widgets/others/view_all_button.dart';

class WeAreHiringBanner extends ConsumerWidget {
  const WeAreHiringBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hiringState = ref.watch(hiringBannerProvider);
    final hasData = (hiringState.data ?? []).isNotEmpty;

    if (!hasData && hiringState.pageState != PageState.loading) {
      return const SizedBox.shrink();
    }
    return hiringState.pageState == PageState.loading
        ? _shimmerView()
        : _data(hiringState);
  }

  Widget _data(WeAreHiringState state) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          border: Border.all(color: Colors.black12, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppDrawables.hiring1, width: 50, height: 50),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      state.data?.first.text1 ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: navigatorKey.currentContext!.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    gapH8(),
                    CustomThemeButton(
                      child: Text(
                        'Apply Now',
                        style: navigatorKey.currentContext!.textTheme.displaySmall
                            ?.copyWith(color: Colors.white),
                      ),
                      color: AppColors.primaryColor,
                      radius: 30,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(AppDrawables.hiring2, width: 50, height: 50),
              // Text(
              //   state.data?.first.text1 ?? "",
              //   maxLines: 1,
              //   overflow: TextOverflow.ellipsis,
              //   softWrap: true,
              //   textAlign: TextAlign.center,
              //   style: navigatorKey.currentContext!.textTheme.titleMedium,
              // ),
              // const SizedBox(height: 8),
              // Text(
              //   state.data?.first.text2 ?? "",
              //   maxLines: 3,
              //   overflow: TextOverflow.ellipsis,
              //   softWrap: true,
              //   textAlign: TextAlign.center,
              //   style: navigatorKey.currentContext!.textTheme.bodyMedium
              //       ?.copyWith(color: Colors.black45),
              // ),
              // const SizedBox(height: 8),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Expanded(child: SvgPicture.asset(AppDrawables.hiring1, width: 50, height: 50)),
              //     CustomThemeButton(
              //       child: Text(
              //         'Apply Now',
              //         style: navigatorKey.currentContext!.textTheme.displaySmall
              //             ?.copyWith(color: Colors.white),
              //       ),
              //       color: AppColors.primaryColor,
              //       radius: 30,
              //       padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              //       onTap: () {},
              //     ),
              //     Expanded(child: SvgPicture.asset(AppDrawables.hiring2, width: 50, height: 50)),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _shimmerView() {
    return ShimmerLoader(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            border: Border.all(color: Colors.white, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: SvgPicture.asset(AppDrawables.hiring1, width: 50, height: 50)),
                Column(
                  children: [
                    ColoredBox(
                      color: Colors.white,
                      child: SizedBox(height: 22, width: 150),
                    ),
                    gapH8(),
                    CustomThemeButton(
                      child: Text(
                        'Apply Now',
                        style: navigatorKey.currentContext!.textTheme.displaySmall
                            ?.copyWith(color: Colors.white),
                      ),
                      color: AppColors.primaryColor,
                      radius: 30,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      onTap: () {},
                    ),
                  ],
                ),
                Expanded(child: SvgPicture.asset(AppDrawables.hiring2, width: 50, height: 50)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
