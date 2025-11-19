import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/ui/pages/home/promo_banner/promo_banner_card.dart';
import 'package:dei_champions/ui/pages/search/components/search_job_card.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PromoBannerSection extends ConsumerWidget {
  const PromoBannerSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(promoBannerProvider);
    final hasData = (state.data != null);

    if (!hasData && state.pageState != PageState.loading) {
      return const SizedBox.shrink();
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 12,
            top: 12,
            left: 16,
            right: 16,
          ),
          child: state.pageState == PageState.loading
              ? _loadingUi()
              // :_loadingUi()
              : PromoBannerWidget(banner: state.data!),
        ),
        coloredGap(),
      ],
    );
  }

  Widget _loadingUi() {
    return ShimmerLoader(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12, top: 12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header row
              ColoredBox(
                color: Colors.white,
                child: SizedBox(height: 14, width: 100),
              ),
              const SizedBox(height: 8),

              // horizontal list
              _shimmerItems(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _shimmerItems() {
    return ShimmerLoader(
      child: ShimmerBox(height: 160, width: double.infinity),
    );
  }
}
