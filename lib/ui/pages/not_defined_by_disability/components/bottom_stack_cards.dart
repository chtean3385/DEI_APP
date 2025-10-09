import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/enums.dart';
import '../../../../models/disability/disability_bottom_details_model.dart';
import '../../../../models/state_models/disability/disability_bottom_state.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/shimmer_loader.dart';
import '../../about_us/components/core_value_card.dart';

class DisabilityBottomCards extends ConsumerStatefulWidget {
  const DisabilityBottomCards( {Key? key}) : super(key: key);

  @override
  ConsumerState<DisabilityBottomCards> createState() => _JobsServiceSectionState();
}

class _JobsServiceSectionState extends ConsumerState<DisabilityBottomCards> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;
  double _itemWidth = 300; // estimated width of each JobServiceCard + spacing

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final index = (_scrollController.offset / (_itemWidth-20)).round();
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
    final state = ref.watch(disabilityBottomSectionProvider);
    final hasData = (state.data ?? []).isNotEmpty;

    if (!hasData && state.pageState != PageState.loading) {
      return const SizedBox.shrink();
    }


    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ColoredBox(
        color: AppColors.bg,
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: state.pageState == PageState.loading
              ? _loadingItems()
              : _dataItems(state),
        ),
      ),
    );
  }


  Widget _dataItems(DisabilityBottomState state) {
    final data = state.data?.first.sectionCards ?? [];
    if (data.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: data.map((item) => _buildCard( item)).toList(),
          ),
        ),

        const SizedBox(height: 12),
        // 🔹 Indicator Row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(data.length , (index) {
            final isActive = _currentIndex == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: CircleAvatar(
                radius: isActive ? 5 : 3,
                backgroundColor: isActive
                    ? AppColors.primaryColor
                    : Colors.grey,
              ),
            );
          }),
        ),

        const SizedBox(height: 12),
      ],
    );
  }
  Widget _buildCard(SectionCardModel item){
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: SizedBox(
          width: _itemWidth,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [

                Text(
                  item.title ?? "",
                  style: context.textTheme.labelSmall,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                gapH8(),
                Text(
                  item.description ?? "",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  maxLines: 4,
                  style: context.textTheme.displaySmall?.copyWith(
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: List.generate(
                3,
                    (index) => Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ShimmerCoreValueCard(),
                ),
              ),
            ),
          ),

          const SizedBox(height: 14),
        ],
      ),
    );
  }
}

