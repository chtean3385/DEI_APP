
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/rounded_network_image.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/enums.dart';

class DisabilityBottomSection extends ConsumerWidget {
  const DisabilityBottomSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(disabilityBottomSectionProvider);
    // return _loading();
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

    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child:  Stack(
          alignment: AlignmentGeometry.bottomCenter,
          children: [
            Positioned.fill(
              child: RoundedNetworkImage(
                imageUrl: item.backgroundImage ?? "",
                width: double.infinity,
                borderRadius: 16,
              ),
            ),

            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color:
                (BootstrapColors.colors["indigo"] ?? AppColors.primaryColor)
                    .withValues(alpha: 0.3), // Adjust opacity as needed
              ),
              alignment: AlignmentGeometry.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    item.quote  ?? '',
                    style: context.textTheme.displaySmall?.copyWith(
                        color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600
                    ),
                    textAlign: TextAlign.center,
                  ),
                  gapH8(),
                  ElevatedButton.icon(
                    onPressed: () {
                      print("${item.ctaText}");
                    },
                    icon: Icon(
                      Icons.group_add,
                      color: Color(0xFF1a237e),
                      size: 18,
                    ),
                    label: Text(
                      item.ctaText ?? '',
                      style: TextStyle(
                        color: Color(0xFF1a237e),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
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
    return ColoredBox(
      color: Colors.white,
      child: ShimmerLoader(
        child: Padding(
          padding: const EdgeInsets.all(16),
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
      ),
    );
  }
}
