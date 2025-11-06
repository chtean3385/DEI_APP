import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/app_styles.dart';
import '../../../../../constants/enums.dart';

class CsrObjectiveSection extends ConsumerWidget {
  const CsrObjectiveSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(csrObjectivesController);
    // return _loading();
    if ((state.pageState == PageState.loading)) {
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

    final item = data?.first;
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 16,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH8(),
            Text(
              item?.title ?? '',
              style: context.textTheme.bodyLarge?.copyWith(),
              textAlign: TextAlign.left,
            ),
            gapH8(),
            Text(
              item?.subTitle ?? '',
              style: context.textTheme.displaySmall?.copyWith(
                fontSize: 11,
                color: Colors.black54,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }

  Widget _loading() {
    return ShimmerLoader(
      child: ColoredBox(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          child: SizedBox(width: double.infinity, height: 100),
        ),
      ),
    );
  }
}
