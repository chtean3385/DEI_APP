import 'package:dei_champions/models/home/explore_our_services/explore_service_model.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_navigator.dart';
import 'explore_service_home_card.dart';

class ExploreOurServices extends StatefulWidget {
  const ExploreOurServices({Key? key}) : super(key: key);

  @override
  State<ExploreOurServices> createState() => _ExploreOurServicesState();
}

class _ExploreOurServicesState extends State<ExploreOurServices> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;
  double _itemWidth =
      150; // estimated width of each HomeExploreServiceCard + spacing

  final List<ExploreServiceModel> sliderItems = [
    ExploreServiceModel(
      id: "1",
      icon: Icons.woman_outlined,
      title: "Empower Women",
    ),
    ExploreServiceModel(id: "2", icon: Icons.man, title: "Men as Allies"),
    ExploreServiceModel(
      id: "3",
      icon: Icons.accessible_forward,
      title: "Not Defined by Disability",
    ),
    ExploreServiceModel(id: "4", icon: Icons.auto_awesome, title: "Gen Z"),
    ExploreServiceModel(
      id: "5",
      icon: Icons.military_tech,
      title: "Defense Veteran",
    ),
    ExploreServiceModel(
      id: "6",
      icon: Icons.diversity_3,
      title: "Shine with Pride",
    ),
  ];
  final List<VoidCallback> _drawerCallbacks = [
        () => AppNavigator.loadEmpowerWomenScreen(),
        () => AppNavigator.loadMenAsAliasScreen(),
        () => AppNavigator.loadNotDefinedByDisabilityScreen(),
        () => AppNavigator.loadGenZScreen(),
        () => AppNavigator.loadVeteranScreen(),
        () => AppNavigator.loadLgbtqScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final index = (_scrollController.offset / (_itemWidth + 15)).round();
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
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 24, top: 24),
      child: ColoredBox(
        color: AppColors.bg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                "Explore Our Services",
                style: theme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Horizontal List
            SizedBox(
              height: 120,
              child: ListView.separated(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: sliderItems.length,
                itemBuilder: (context, index) {
                  return HomeExploreServiceCard(
                    item: sliderItems[index],
                    width: _itemWidth,
                    onTap: _drawerCallbacks[index],
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(width: 16),
              ),
            ),

            const SizedBox(height: 12),

            // Indicator Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(sliderItems.length, (index) {
                final isActive = _currentIndex == index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: CircleAvatar(
                    radius: isActive ? 5 : 3,
                    backgroundColor: isActive
                        ? AppColors.primaryColor
                        : Colors.grey.shade600,
                  ),
                );
              }),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
