
import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../models/explore_career/career_explorer_bottom_model.dart';
import '../../../../utils/fa_icon.dart';

class ReadyToJoinChampion extends ConsumerWidget {
  const ReadyToJoinChampion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(menAllyShipProvider);
    // Handle loading, error, and data states
    // return _loading();
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

    // final item = data.first;
    final item = CareerExplorerBottomModel(
      title:"Ready to Champion DEI?",
        subtitle:"Join us and unlock opportunities tailored for you.",
      buttonIcon:"FaStar",
     buttonText:"Get Started",
    );

    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16,left: 16,right: 16, top: 16),
        child: Stack(
          alignment: AlignmentGeometry.bottomCenter,
          children: [
            Positioned.fill(
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(16),
                child: ColoredBox(
                  color:   BootstrapColors.colors["indigo"] ??
                      AppColors.primaryColor,
                  child: SizedBox(
                    width: double.infinity,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  gapH8(),
                  Text(
                    item.title ?? "",
                    style: context.textTheme.labelMedium?.copyWith(
                        color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  gapH8(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      item.subtitle ?? "",
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  gapH8(),
                  ElevatedButton.icon(
                    onPressed: () {
                      print('Become an Ally button pressed');
                    },
                    icon: Icon(
                      getFontAwesomeIcon(item.buttonIcon),
                      color: Colors.white,
                      size: 18,
                    ),
                    label: Text(
                      item.buttonText ?? "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget _loading() {
    return ShimmerLoader(
      child: Padding(
        padding: const EdgeInsets.only( bottom: 16,left: 16,right: 16),
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
