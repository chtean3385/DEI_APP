import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/models/common/csr/csr_impact_model.dart';
import 'package:dei_champions/models/state_models/common/csr/csr_impact_state.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/enums.dart';
import '../../../../../main.dart';
import '../../../../../utils/fa_icon.dart';
import '../../../../../widgets/others/shimmer_loader.dart';
import '../../../about_us/components/core_value_card.dart';

class CsrImpactPoints extends ConsumerStatefulWidget {
  const CsrImpactPoints({Key? key}) : super(key: key);

  @override
  ConsumerState<CsrImpactPoints> createState() => _JobsServiceSectionState();
}

class _JobsServiceSectionState extends ConsumerState<CsrImpactPoints> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;
  double _itemWidth = 250; // estimated width of each JobServiceCard + spacing

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final index = (_scrollController.offset / (_itemWidth + 30)).round();
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
    final state = ref.watch(csrImpactSectionProvider);
    final hasData = (state.data ?? []).isNotEmpty;

    if (!hasData && state.pageState != PageState.loading) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 8),
      child: ColoredBox(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: state.pageState == PageState.loading
              ? _loadingItems()
              : _dataItems(state),
        ),
      ),
    );
  }

  Widget _dataItems(CsrImpactState state) {
    final data = state.data?.first;
    if (data == null) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                data.sectionTitle ?? "",
                style: navigatorKey.currentContext!.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              gapH8(),
              // Text(
              //   data.subTitle ?? "",
              //   style: context.textTheme.displaySmall?.copyWith(
              //     fontSize: 11,
              //     color: Colors.black54,
              //   ),
              // ),
              // gapH8(),

            ],
          ),
        ),
        const SizedBox(height: 8),
        if (data.cards?.isNotEmpty == true)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: data.cards!.map((item) => _buildCard(item)).toList(),
            ),
          ),

        const SizedBox(height: 12),
        // 🔹 Indicator Row
        if (data.cards?.isNotEmpty == true)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(data.cards!.length, (index) {
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

  Widget _buildCard(CsrImpactCardModel card) {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Card(
        elevation: 3,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),side: BorderSide(width: .5,color: Colors.black12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 100, maxWidth: _itemWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      card.count?.toString() ?? "",
                      style: theme.titleLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                gapH8(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconCircleCard(card.icon, ""),
                    const SizedBox(width: 16),
                    Flexible(
                      child: Text(
                        card.title ?? "",
                        style: theme.labelMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  card.subtitle ?? '',
                  textAlign: TextAlign.center,
                  style: theme.displaySmall?.copyWith(color: Colors.black54,fontSize: 11),
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
                  BootstrapColors.colors["lightNavy"] ?? AppColors.primaryColor,
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
