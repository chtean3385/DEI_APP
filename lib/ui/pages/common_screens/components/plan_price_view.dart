import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/models/state_models/common/price_plan_state.dart';
import 'package:dei_champions/ui/pages/common_screens/components/plan_price_card.dart';
import 'package:dei_champions/ui/pages/search/components/search_job_card.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../../../../constants/enums.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/custom_loader.dart';


class PlanPriceView extends ConsumerStatefulWidget {
  const PlanPriceView({super.key});

  @override
  ConsumerState<PlanPriceView> createState() => _PlanPriceViewState();
}

class _PlanPriceViewState extends ConsumerState<PlanPriceView> {
  final PageController _pageController = PageController(viewportFraction: 1);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageScroll);
  }

  void _onPageScroll() {
    final page = _pageController.page?.round() ?? 0;
    if (page != _currentPage) {
      setState(() => _currentPage = page);
    }
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageScroll);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(planPriceProvider);

    if (state.pageState == PageState.loading) {
      return _shimmerLoader();
    } else if (state.pageState == PageState.error) {
      return SomethingWentWrong();
    } else if (state.data?.isEmpty == true) {
      return EmptyWidget();
    } else {
      return _data(state);
    }
  }

  Widget _data(PricePlanState state) {
    final screenHeight = MediaQuery.of(context).size.height;
    final cardHeight = screenHeight * 0.65; // ~65% of screen height, adjustable
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: cardHeight,
            child: PageView.builder(
              controller: _pageController,
              itemCount: state.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                  child: PlanPriceCard(item: state.data![index]),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          _buildIndicator(state.data!.length),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildIndicator(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == _currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.primaryColor
                : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }),
    );
  }

  Widget _shimmerLoader() {
    return ListView.separated(
      itemCount: 3,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      itemBuilder: (context, index) {
        return ShimmerLoader(
          child: ShimmerBox(height: 250, width: double.infinity, radius: 16),
        );
      },
      separatorBuilder: (c, s) => const Divider(color: Colors.white70, height: 12),
    );
  }
}


