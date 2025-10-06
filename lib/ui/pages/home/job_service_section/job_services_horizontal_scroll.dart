import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_styles.dart';
import '../../../../models/state_models/home/job_service_state.dart';
import '../top_dei_friendly_industries/dei_friendly_industry_card.dart';
import 'job_service_card.dart';

class JobsServiceSection extends ConsumerWidget {
  const JobsServiceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(jobServiceProvider);
    final hasData = (state.data ?? []).isNotEmpty;

    if (!hasData && state.pageState != PageState.loading) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: EdgeInsets.only(top: 12),
      child: state.pageState == PageState.loading
          ? _loadingItems()
          :
      _dataItems(state),
    );
  }

  Widget _loadingItems() {
    return ShimmerLoader(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: ColoredBox(
              color: Colors.white,
              child: SizedBox(height: 14, width: 160),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 110,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 3,
              itemBuilder: (context, index) {
                return ShimmerJobServiceCard();
              },
              separatorBuilder: (c, v) => gapW16(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dataItems(JobServiceState state) {
    return (state.data?.length ?? 0) > 0
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Explore Our Services",
                style: navigatorKey.currentContext!.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
                height: 110,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: (state.data?.length ?? 0),
                  itemBuilder: (context, index) {
                    return JobServiceCard(
                      jobServiceModel: state.data![index],
                      color: index % 2 == 0
                          ? AppColors.bg
                          :  AppColors.bg,
                    );
                  },
                  separatorBuilder: (c, v) => gapW16(),
                ),
              ),
          ],
        )
        : SizedBox.shrink();
  }
}
