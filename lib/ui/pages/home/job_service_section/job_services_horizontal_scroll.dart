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
import 'job_service_card.dart';

class JobsServiceSection extends ConsumerStatefulWidget {
  const JobsServiceSection({Key? key}) : super(key: key);

  @override
  ConsumerState<JobsServiceSection> createState() => _JobsServiceSectionState();
}

class _JobsServiceSectionState extends ConsumerState<JobsServiceSection> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;
  double _itemWidth = 170; // estimated width of each JobServiceCard + spacing

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final index = (_scrollController.offset / (_itemWidth-30)).round();
    if (index != _currentIndex) {
      setState(() => _currentIndex = index);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(jobServiceProvider);
    final hasData = (state.data ?? []).isNotEmpty;

    if (!hasData && state.pageState != PageState.loading) {
      return const SizedBox.shrink();
    }

    return ColoredBox(
      color: AppColors.primaryColor.withValues(alpha: .5),
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: state.pageState == PageState.loading
            ? _loadingItems()
            : _dataItems(state),
      ),
    );
  }

  Widget _loadingItems() {
    return ShimmerLoader(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16),
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
              itemBuilder: (_, __) => const ShimmerJobServiceCard(),
              separatorBuilder: (_, __) => gapW16(),
            ),
          ),
          const SizedBox(height: 14),
        ],
      ),
    );
  }

  Widget _dataItems(JobServiceState state) {
    final data = state.data ?? [];
    if (data.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Explore Our Services",
            style: navigatorKey.currentContext!.textTheme.bodySmall
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 110,
          child: ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: state.data?.length ?? 0,
            itemBuilder: (context, index) {
              return JobServiceCard(
                jobServiceModel: data[index],
                color: AppColors.bg,
                width: _itemWidth,
              );
            },
            separatorBuilder: (_, __) => gapW16(),
          ),
        ),
        const SizedBox(height: 12),
        // 🔹 Indicator Row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(state.data?.length ?? 0, (index) {
            final isActive = _currentIndex == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: CircleAvatar(
                radius: isActive ? 5 : 3,
                backgroundColor: isActive
                    ? AppColors.primaryColor
                    : Colors.grey.shade300,
              ),
            );
          }),
        ),

        const SizedBox(height: 12),
      ],
    );
  }
}

