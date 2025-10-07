import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_styles.dart';
import '../../../../constants/enums.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/shimmer_loader.dart';
import 'about_dei_content.dart';
import 'impact_card.dart';
class AboutUsHeader extends ConsumerWidget {
  const AboutUsHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(aboutUsProvider);

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

    return Column(
      children: [
        AboutDeiContent(description: item.description ?? ""),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ImpactCard(
                  title: "Jobs Promoted",
                  value:item.jobsPromoted ?? "",
                ),
              ),
              gapW16(),
              Expanded(
                flex: 1,
                child: ImpactCard(
                  title: "Inclusive Employers",
                  value:item.employers ?? "",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _loading() {
    return ShimmerLoader(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          children: [
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ImpactCard(
                      title: "Jobs Promoted",
                      value: "+1,20,0000",
                    ),
                  ),
                  gapW16(),
                  Expanded(
                    flex: 1,
                    child: ImpactCard(
                      title: "Inclusive Employers",
                      value: "5000+",
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
