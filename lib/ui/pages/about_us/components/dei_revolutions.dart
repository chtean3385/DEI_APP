import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/rounded_network_image.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:dei_champions/widgets/others/view_all_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';

class DeiRevolutions extends ConsumerWidget {
  const DeiRevolutions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(aboutUsRevolutionProvider);

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
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          RoundedNetworkImage(
            imageUrl: item.backgroundImage ?? "",
            width: double.infinity,
            height: 100,
            borderRadius: 16,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item.heading ?? '',
                style: context.textTheme.labelMedium?.copyWith(color: Colors.white),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
              gapH8(),
              Text(
                item.description ?? '',
                style: context.textTheme.displaySmall?.copyWith(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              gapH8(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ViewAllButton(text: "Register",isSmall: true,fillColor:true,),
                  gapW16(),
                  ViewAllButton(text: "Contact Us",isSmall: true,fillColor:true,),
                ],
              )
            ],
          )

        ],
      ),
    );
  }

  Widget _loading() {
    return ShimmerLoader(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ColoredBox(
              color: Colors.white,
              child: SizedBox(width: 100, height: 14),
            ),
            gapH8(),
            ColoredBox(
              color: Colors.white,
              child: SizedBox(width: double.infinity, height: 8),
            ),
            SizedBox(height: 2),
            ColoredBox(
              color: Colors.white,
              child: SizedBox(width: double.infinity, height: 8),
            ),
            SizedBox(height: 2),
            ColoredBox(
              color: Colors.white,
              child: SizedBox(width: double.infinity, height: 8),
            ),
            SizedBox(height: 2),
            ColoredBox(
              color: Colors.white,
              child: SizedBox(width: double.infinity, height: 8),
            ),
            SizedBox(height: 2),
            ColoredBox(
              color: Colors.white,
              child: SizedBox(width: double.infinity, height: 8),
            ),
            SizedBox(height: 2),
            ColoredBox(
              color: Colors.white,
              child: SizedBox(width: double.infinity, height: 8),
            ),
            SizedBox(height: 2),
            ColoredBox(
              color: Colors.white,
              child: SizedBox(width: double.infinity, height: 8),
            ),
            SizedBox(height: 2),
            ColoredBox(
              color: Colors.white,
              child: SizedBox(width: double.infinity, height: 8),
            ),
            SizedBox(height: 2),
            ColoredBox(
              color: Colors.white,
              child: SizedBox(width: double.infinity, height: 8),
            ),
            SizedBox(height: 2),
          ],
        ),
      ),
    );
  }
}
