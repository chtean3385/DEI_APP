import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../models/explore_career/explore_service_program_model.dart';
import '../../../../models/state_models/men_alias/organizational_benefit_state.dart';
import 'explore_service_program_card.dart';

class ExploreServicesPrograms extends ConsumerStatefulWidget {
  const ExploreServicesPrograms({Key? key}) : super(key: key);

  @override
  ConsumerState<ExploreServicesPrograms> createState() =>
      _JobsServiceSectionState();
}

class _JobsServiceSectionState extends ConsumerState<ExploreServicesPrograms> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;
  double _itemWidth = 200; // estimated width of each JobServiceCard + spacing

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final index = (_scrollController.offset / (_itemWidth )).round();
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
    final data = state.data?.first.benefits ?? [];
    if (data.isEmpty) return const SizedBox.shrink();
    final List<ExploreServiceProgramModel> ExploreServiceProgramModels = [
      ExploreServiceProgramModel(
        icon: "FaUserPlus",
        backgroundColor: "#3b82f6",
        paidTextBadgeTitle: "",
        title: "Free Registration",
        subtitle: "Create your profile and start applying instantly.",
        buttonLink: "#",
        id: "68d53488cac08da82d490c62",
      ),
      ExploreServiceProgramModel(
        icon: "FaBriefcase",
        backgroundColor: "#3aab67",
        paidTextBadgeTitle: "",
        title: "Multiple Free Job Applications",
        subtitle: "Apply to unlimited jobs with one profile.",
        buttonLink: "#",
        id: "68d5354ecac08da82d490c67",
      ),
      ExploreServiceProgramModel(
        icon: "FaFunnelDollar",
        backgroundColor: "#8b5cf6",
        paidTextBadgeTitle: "",
        title: "Diversity Self-ID & Filters",
        subtitle: "Showcase preferences & match inclusive roles.",
        buttonLink: "#",
        id: "68d535d6cac08da82d490c70",
      ),
      ExploreServiceProgramModel(
        icon: "FaAccessibleIcon",
        backgroundColor: "#f58a3c",
        paidTextBadgeTitle: "",
        title: "PwD Friendly Features",
        subtitle: "Accessible jobs, screen reader support & more.",
        buttonLink: "#",
        id: "68d535d6cac08da82d490c71",
      ),
      ExploreServiceProgramModel(
        icon: "FaStar",
        backgroundColor: "#d159e4",
        paidTextBadgeTitle: "Paid",
        title: "Resume Highlight ",
        subtitle: "Boost visibility with recruiter highlight options.",
        buttonLink: "#",
        id: "68d53661cac08da82d490c80",
      ),
      ExploreServiceProgramModel(
        icon: "FaBell",
        backgroundColor: "#14b8a6",
        paidTextBadgeTitle: "",
        title: "Free Job Alerts",
        subtitle: "Get personalized alerts via email & notifications.",
        buttonLink: "#",
        id: "68d536f8cac08da82d490c92",
      ),
      ExploreServiceProgramModel(
        icon: "FaRocketchat",
        backgroundColor: "#facc15",
        paidTextBadgeTitle: "Paid",
        title: "Career Counselling",
        subtitle: "1:1 sessions with career experts for growth.",
        buttonLink: "#",
        id: "68d536f8cac08da82d490c93",
      ),
      ExploreServiceProgramModel(
        icon: "FaFileAlt",
        backgroundColor: "#6366f1",
        paidTextBadgeTitle: "Paid",
        title: "ATS Resume + Cover Letter",
        subtitle: "Expert-written ATS-friendly documents.",
        buttonLink: "#",
        id: "68d53751cac08da82d490cab",
      ),
      ExploreServiceProgramModel(
        icon: "FaNewspaper",
        backgroundColor: "#ef4444",
        paidTextBadgeTitle: "",
        title: "DEI Newsletter",
        subtitle: "Weekly updates, insights & inclusion events.",
        buttonLink: "#",
        id: "68d537a4cac08da82d490cc6",
      ),
      ExploreServiceProgramModel(
        icon: "FaGraduationCap",
        backgroundColor: "#007bff",
        paidTextBadgeTitle: "",
        title: "Internship Program",
        subtitle: "Skill-building internships with mentorship.",
        buttonLink: "#",
        id: "68d537cccac08da82d490ce4",
      ),
      ExploreServiceProgramModel(
        icon: "FaHandsHelping",
        backgroundColor: "#212529",
        paidTextBadgeTitle: "",
        title: "Apprenticeship Program",
        subtitle: "Hands-on learning with real-world projects.",
        buttonLink: "#",
        id: "68d53825cac08da82d490d05",
      ),
    ];


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
           "Our Services & Programs",
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
            children: ExploreServiceProgramModels
                .map(
                  (item) =>
                      ExploreServiceProgramCard(item: item, width: _itemWidth),
                )
                .toList(),
          ),
        ),

        const SizedBox(height: 12),
        // 🔹 Indicator Row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(ExploreServiceProgramModels.length, (index) {
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
