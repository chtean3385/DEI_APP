import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/enums.dart';
import '../../../../main.dart';
import '../../../../models/gen-z/genz_growth_model.dart';
import '../../../../models/state_models/genz/genz_growth_state.dart';
import '../../../../providers/providers.dart';
import '../../../../utils/fa_icon.dart';
import '../../../../widgets/others/shimmer_loader.dart';
import '../../about_us/components/core_value_card.dart';

class GenZGrowthPoints extends ConsumerStatefulWidget {
  const GenZGrowthPoints( {Key? key}) : super(key: key);

  @override
  ConsumerState<GenZGrowthPoints> createState() => _JobsServiceSectionState();
}

class _JobsServiceSectionState extends ConsumerState<GenZGrowthPoints> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;
  double _itemWidth = 300; // estimated width of each JobServiceCard + spacing

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final index = (_scrollController.offset / (_itemWidth+20)).round();
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
    final state = ref.watch(genZGrowthSectionProvider);
    final hasData = (state.data ?? []).isNotEmpty;

    if (!hasData && state.pageState != PageState.loading) {
      return const SizedBox.shrink();
    }


    return Padding(
      padding: const EdgeInsets.only(bottom: 16,top: 16),
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


  Widget _dataItems(GenZGrowthState state) {
    final data = state.data?.first.items ?? [];
    if (data.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            state.data?.first.heading ?? "",
            style: navigatorKey.currentContext!.textTheme.bodySmall
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 8),
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
  Widget _buildCard(GenZGrowthItemModel card) {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Card(
        elevation: 3,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ConstrainedBox(
            constraints:  BoxConstraints(
              minHeight: 100,
           maxWidth: _itemWidth
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    iconCircleCard(card.icon,""),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            card.title ?? "",
                            style: theme.labelMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  card.description ?? '',
                  style: theme.displaySmall?.copyWith(
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

Widget iconCircleCard(String? iconName, String? step) {
  return Container(
    width: 30, // adjust size as needed
    height: 30,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white, // background color
      boxShadow: [
        BoxShadow(
          color: Colors.blue.withValues(alpha: 0.2), // subtle glow
          blurRadius: 10,
          spreadRadius: 1,
          offset: Offset(0, 0),
        ),
      ],
    ),
    child: Center(
      child: iconName != null
          ? Icon(
        getFontAwesomeIcon(iconName),
        color:
        BootstrapColors.colors["lightNavy"] ??
            AppColors.primaryColor,
        size: 15,
      )
          : Text(
        step ?? "",
        style: navigatorKey.currentContext!.textTheme.labelMedium
            ?.copyWith(
          color:
          BootstrapColors.colors["lightNavy"] ??
              AppColors.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}