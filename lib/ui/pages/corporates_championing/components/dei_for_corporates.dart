import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../models/corporate_championing/dei_corporates_model.dart';
import '../../../../models/state_models/men_alias/organizational_benefit_state.dart';
import 'dei_corporate_solution_card.dart';

class DeiForCorporates extends ConsumerStatefulWidget {
  const DeiForCorporates({Key? key}) : super(key: key);

  @override
  ConsumerState<DeiForCorporates> createState() => _JobsServiceSectionState();
}

class _JobsServiceSectionState extends ConsumerState<DeiForCorporates> {
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
                  child: ShimmerExploreServiceProgramCard(),
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
      "_id": "68d668ea671e6477099a3ece",
      "sectionTitle": "Our DEI Solutions for Corporates",
      "cards": [
        {
          "icon": "FaClipboardList",
          "title": "Free Job Listings",
          "subtitle":
              "Post open positions at no cost and access diverse, verified talent pools.",
          "buttonLink": "#",
          "_id": "68d668ea671e6477099a3ecf",
        },
        {
          "icon": "FaChessQueen",
          "title": "Membership Premium",
          "subtitle":
              "Exclusive analytics, employer branding, and premium DEI hiring support.",
          "buttonLink": "#",
          "_id": "68d66a46671e6477099a3ed8",
        },
        {
          "icon": "FaBullhorn",
          "title": "DEI Branding",
          "subtitle":
              "Position your company as an inclusive leader with authentic branding campaigns.",
          "buttonLink": "#",
          "_id": "68d66a46671e6477099a3ed9",
        },
        {
          "icon": "FaUserTie",
          "title": "Recruitment Assistance",
          "subtitle":
              "End-to-end support for attracting, assessing, and onboarding diverse talent.",
          "buttonLink": "#",
          "_id": "68d66a46671e6477099a3eda",
        },
        {
          "icon": "FaGraduationCap",
          "title": "Campus Hiring",
          "subtitle":
              "Build early-career pipelines through inclusive campus engagement programs.",
          "buttonLink": "#",
          "_id": "68d66ab6671e6477099a3ee9",
        },
        {
          "icon": "FaHandshake",
          "title": "DEI Advisory",
          "subtitle":
              "Partner with experts to design and implement impactful DEI strategies.",
          "buttonLink": "#",
          "_id": "68d66ab6671e6477099a3eea",
        },
        {
          "icon": "FaChartPie",
          "title": "Inclusive Index Survey",
          "subtitle":
              "Measure and benchmark inclusion with actionable data insights.",
          "buttonLink": "#",
          "_id": "68d66ab6671e6477099a3eeb",
        },
        {
          "icon": "FaUsers",
          "title": "Community Engagement",
          "subtitle":
              "Amplify impact through DEI events, volunteering, and networking initiatives.",
          "buttonLink": "#",
          "_id": "68d66ab6671e6477099a3eec",
        },
      ],
      "status": "Active",
      "createdAt": "2025-09-26T10:20:26.163Z",
      "updatedAt": "2025-09-26T10:28:06.198Z",
      "__v": 0,
    };
    final DeiCorporatesModel item = DeiCorporatesModel.fromJson(jsonData);

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
                      DeiCorporateSolutionCard(item: item, width: _itemWidth),
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
