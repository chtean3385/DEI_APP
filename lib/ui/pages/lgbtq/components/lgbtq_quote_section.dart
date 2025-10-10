
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/enums.dart';
import '../../../../models/ShineWithPride/lgbtq_quote_model.dart';

class LgbtqQuoteSection extends ConsumerWidget {
  const LgbtqQuoteSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(lgbtqQuoteSection1Provider);
    final state2 = ref.watch(lgbtqQuoteSection2Provider);
    // Handle loading, error, and data states
    // return _loading();
    if ((state.pageState == PageState.loading )|| (state2.pageState == PageState.loading )) {
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
    final data2 = state2.data;

    final item = data?.first;
    final item2 = data2?.first;
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16,left: 16,right: 16, top: 16),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned.fill(
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(16),
                child: ColoredBox(
                  color:   BootstrapColors.colors["lightNavy"] ??
                      AppColors.primaryColor,
                  child: SizedBox(
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              if (item?.quote != null || item?.quote?.isNotEmpty == true)    Text(
                    item!.quote ?? "",
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  gapH4(),
                  if (item2?.quote != null || item2?.quote?.isNotEmpty == true)    Text(
                    item2!.quote ?? "",
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // Text(
                  //   item.lead ?? "",
                  //   style: context.textTheme.bodyMedium?.copyWith(
                  //     color: Colors.white,fontSize: 12,
                  //   ),
                  //   maxLines: 2,
                  //   softWrap: true,
                  //   overflow: TextOverflow.ellipsis,
                  //   textAlign: TextAlign.center,
                  // ),
                  gapH8(),
                  ElevatedButton(
                    onPressed: () => openLgbtqQuotes(context, item, item2),
                    child: Text(
                      'Read More',
                      style: TextStyle(
                        color: Color(0xFF1a237e),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  )
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
Future<void> openLgbtqQuotes(BuildContext context,LgbtqQuoteModel? item,LgbtqQuoteModel? item2) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(16),
              child: ColoredBox(
                color:   BootstrapColors.colors["lightNavy"] ??
                    AppColors.primaryColor,
                child: SizedBox(
                  width: double.infinity,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item?.quote ?? "",
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  gapH4(),
                  Text(
                    item?.subText ?? "",
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  gapH8(),
                  Text(
                    item2?.quote ?? "",
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  gapH4(),
                  Text(
                    item2?.subText ?? "",
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),


                ],
              ),
            ),
          )

        ],
      );
    },
  );
}