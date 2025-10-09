
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../models/gen-z/genz_bottom_buttons_model.dart';
import '../../../../utils/fa_icon.dart';

class GenZButtonSection extends ConsumerWidget {
  const GenZButtonSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(genZBottomButtonSectionProvider);
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
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item.text  ?? '',
              style: context.textTheme.displaySmall?.copyWith(
                  color: Colors.black54,fontSize: 12,fontWeight: FontWeight.w600
              ),
              textAlign: TextAlign.center,
            ),
            gapH8(),
            buildGenZCtas(item.ctas)
          ],
        ),
      ),
    );
  }
  Widget buildGenZCtas(List<CtaGenzButtonModel?>? ctas) {
    if (ctas == null || ctas.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(ctas.length, (index) {
        final item = ctas[index];
        if (item == null) return const SizedBox();

        // Determine button color
        final isPrimary = item.primary ?? false;
        final bgColor = isPrimary ? const Color(0xFF1a237e) : Colors.white;
        final textColor = isPrimary ? Colors.white : const Color(0xFF1a237e);

        // Optional icon mapping
        IconData? iconData;

        if (item.icon != null && item.icon!.isNotEmpty) {
          iconData =   getFontAwesomeIcon(item.icon); // using your fontAwesomeMap
        }
        print("item.icon ${item.icon}");
        print("iconData.iconData ${iconData.toString()}");

        return ElevatedButton.icon(
          onPressed: () {
            print("CTA clicked: ${item.label}, href: ${item.href}");
            // TODO: Handle navigation or action
          },
          icon: iconData != null
              ? Icon(iconData, color: textColor, size: 18)
              : const SizedBox.shrink(),
          label: Text(
            item.label ?? '',
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            visualDensity: VisualDensity.compact,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              side: isPrimary
                  ? BorderSide.none
                  : const BorderSide(color: Color(0xFF1a237e)),
            ),
          ),
        );
      }),
    );
  }



  Widget _loading() {
    return ColoredBox(
      color: Colors.white,
      child: ShimmerLoader(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child:  Column(
            children: [
              ColoredBox(
                color: Colors.white,
                child: SizedBox(
                  width: double.infinity,
                  height: 100,
                ),
              ),
              gapH8(),
              ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadiusGeometry.circular(30),
                child: ColoredBox(
                  color: Colors.white,
                  child: SizedBox(
                    width: 200,
                    height: 30,
                  ),
                ),
              ),
              gapH4(),
              ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadiusGeometry.circular(30),
                child: ColoredBox(
                  color: Colors.white,
                  child: SizedBox(
                    width: 200,
                    height: 30,
                  ),
                ),
              ),
              gapH4(),
              ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadiusGeometry.circular(30),
                child: ColoredBox(
                  color: Colors.white,
                  child: SizedBox(
                    width: 200,
                    height: 30,
                  ),
                ),
              ),
              gapH4(),

            ],
          ),
        ),
      ),
    );
  }
}
