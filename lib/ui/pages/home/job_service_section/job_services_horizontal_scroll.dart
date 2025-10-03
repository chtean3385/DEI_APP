import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/providers/providers.dart';
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
    return state.pageState == PageState.loading
        ? _loadingItems()
        : _dataItems(state);
  }

  Widget _loadingItems() {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 3,
        itemBuilder: (context, index) {
          return ShimmerJobServiceCard();
        },
        separatorBuilder: (c, v) => gapW16(),
      ),
    );
  }

  Widget _dataItems(JobServiceState state) {
    return (state.data?.length ?? 0) > 0
        ? SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: (state.data?.length ?? 0),
              itemBuilder: (context, index) {
                return JobServiceCard(
                  jobServiceModel: state.data![index],
                  color: index % 2 == 0
                      ? getBootStrapColor("warning").withValues(alpha: .1)
                      : getBootStrapColor("info").withValues(alpha: .1),
                );
              },
              separatorBuilder: (c, v) => gapW16(),
            ),
          )
        : SizedBox.shrink();
  }
}
