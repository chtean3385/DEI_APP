import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../models/corporate_championing/corporates_partner_model.dart';
import '../../../../models/state_models/men_alias/organizational_benefit_state.dart';
import 'dei_corporate_partner_card.dart';

class DeiCorporatesPartner extends ConsumerStatefulWidget {
  const DeiCorporatesPartner({Key? key}) : super(key: key);

  @override
  ConsumerState<DeiCorporatesPartner> createState() =>
      _JobsServiceSectionState();
}

class _JobsServiceSectionState extends ConsumerState<DeiCorporatesPartner> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;
  double _itemWidth = 200; // estimated width of each JobServiceCard + spacing

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final index = (_scrollController.offset / (_itemWidth)).round();
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
    final state = ref.watch(organizationalBenefitProvider);
    final hasData = (state.data ?? []).isNotEmpty;

    if (!hasData && state.pageState != PageState.loading) {
      return const SizedBox.shrink();
    }

    return ColoredBox(
      color: AppColors.bg,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ShimmerDeiCorporatePartnerCard(),
                ),
              ),
            ),
          ),

          const SizedBox(height: 14),
        ],
      ),
    );
  }

  Widget _dataItems(OrganizationalBenefitState state) {
    // final data = state.data?.first.benefits ?? [];
    // if (data.isEmpty) return const SizedBox.shrink();
    var jsonData = {
      "_id": "68d678a9dbef9c0b3906140a",
      "sectionTitle": "Why Partner With Us?",
      "cards": [
        {
          "icon": "FaUsers",
          "title": "Access to Diverse Talent",
          "subtitle":
              "Connect with verified, diverse candidates ready to make an impact.",
          "_id": "68d678a9dbef9c0b3906140b",
        },
        {
          "icon": "FaBullhorn",
          "title": "Enhanced Employer Branding",
          "subtitle":
              "Boost your DEI reputation and showcase your commitment to inclusion.",
          "_id": "68d679f5dbef9c0b39061414",
        },
        {
          "icon": "FaUserMinus",
          "title": "Expert Advisory Support",
          "subtitle":
              "Guidance from DEI specialists for impactful strategies & execution.",
          "_id": "68d679f5dbef9c0b39061415",
        },
        {
          "icon": "FaChartLine",
          "title": "Data-Driven Insights",
          "subtitle":
              "Measure inclusion with advanced analytics & actionable metrics.",
          "_id": "68d679f5dbef9c0b39061416",
        },
        {
          "icon": "FaHandHoldingHeart",
          "title": "Community Engagement",
          "subtitle":
              "Drive social impact and strengthen bonds with local communities.",
          "_id": "68d67a31dbef9c0b39061425",
        },
        {
          "icon": "FaMedal",
          "title": "Recognized Impact",
          "subtitle":
              "Gain recognition as a DEI Champion in your industry sector.",
          "_id": "68d67a31dbef9c0b39061426",
        },
      ],
      "status": "Active",
      "createdAt": "2025-09-26T11:27:37.858Z",
      "updatedAt": "2025-09-26T11:34:09.551Z",
      "__v": 0,
    };
    final CorporatePartnerDataModel item = CorporatePartnerDataModel.fromJson(jsonData);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            item.sectionTitle ?? "",
            style: navigatorKey.currentContext!.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: item.cards!
                .map(
                  (item) =>
                      DeiCorporatePartnerCard(item: item, width: _itemWidth),
                )
                .toList(),
          ),
        ),

        const SizedBox(height: 12),
        // 🔹 Indicator Row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(item.cards!.length, (index) {
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
}
