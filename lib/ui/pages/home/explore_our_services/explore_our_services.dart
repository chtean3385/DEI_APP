import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/models/home/explore_our_services/explore_service_model.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_drawables.dart';
import '../../../../constants/app_navigator.dart';
import '../../../../widgets/others/view_all_button.dart';
import 'explore_service_home_card.dart';

import 'dart:async';
import 'package:flutter_flip_card/flutter_flip_card.dart';

class ExploreOurServices extends StatefulWidget {
  const ExploreOurServices({Key? key}) : super(key: key);

  @override
  State<ExploreOurServices> createState() => _ExploreOurServicesState();
}

class _ExploreOurServicesState extends State<ExploreOurServices> {
  final flipController = FlipCardController();
  int _currentIndex = 0;
  late Timer _timer;

  final List<ExploreServiceModel> sliderItems = [
    ExploreServiceModel(id: "1", icon: Icons.woman_outlined, title: "Empower Women"),
    ExploreServiceModel(id: "2", icon: Icons.man, title: "Men as Allies"),
    ExploreServiceModel(id: "3", icon: Icons.accessible_forward, title: "Not Defined by Disability"),
    ExploreServiceModel(id: "4", icon: Icons.auto_awesome, title: "Gen Z"),
    ExploreServiceModel(id: "5", icon: Icons.military_tech, title: "Defense Veteran"),
    ExploreServiceModel(id: "6", icon: Icons.diversity_3, title: "Shine with Pride"),
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
    _startAutoFlip();

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 🔹 Safe place for precaching images
    precacheImage(AssetImage(AppDrawables.Gift), context);
    precacheImage(AssetImage(AppDrawables.Gift2), context);
    precacheImage(AssetImage(AppDrawables.celebration), context);
  }
  void _startAutoFlip() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      // Flip animation
      await flipController.flipcard();

      // Change card after flip
      Future.delayed(const Duration(milliseconds: 400), () {
        if (mounted) {
          setState(() {
            _currentIndex = (_currentIndex + 1) % sliderItems.length;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nextIndex = (_currentIndex + 1) % sliderItems.length;

    return Padding(
      padding: const EdgeInsets.only(bottom: 24, top: 24),
      child: ColoredBox(
        color: AppColors.bg,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [

                            Text(
                              "Explore Our Services",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),

                            gapW8(),
                            Image.asset(
                              AppDrawables.Gift,
                              height: 40,
                              width: 40,
                            ),
                          ],
                        ),
                        ViewAllButton(
                          isSmall: true,
                          onPressed: AppNavigator.loadRecommendedJobsScreen,
                        ),
                      ],
                    ),
                    gapH4(),
                    Text(
                      "All free — crafted to help you get your dream job",
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall?.copyWith(color: Colors.black45),
                    ),
                  ],
                ),
              ),
              // 🔹 FlipCard Widget
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,bottom: 24,top: 16),
                child: FlipCard(
                  key: ValueKey(_currentIndex),
                  rotateSide: RotateSide.right, // ✅ Required field added
                  animationDuration: const Duration(milliseconds: 600),
                  frontWidget: HomeExploreServiceCard(
                    item: sliderItems[_currentIndex],
                    width: double.infinity,
                    onTap: _drawerCallbacks[_currentIndex],
                  ),
                  backWidget: HomeExploreServiceCard(
                    item: sliderItems[nextIndex],
                    width: double.infinity,
                    onTap: _drawerCallbacks[nextIndex],
                  ),
                  controller: flipController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
