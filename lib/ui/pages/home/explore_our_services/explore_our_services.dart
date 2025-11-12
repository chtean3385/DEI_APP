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
                          onPressed: () {
                            showExploreServicesBottomSheet(
                              context,
                              services: sliderItems,
                              callbacks: _drawerCallbacks,
                            );
                          },
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
void showExploreServicesBottomSheet(
    BuildContext context, {
      required List<ExploreServiceModel> services,
      required List<VoidCallback> callbacks,
    }) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      final theme = Theme.of(context).textTheme;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
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
            gapH4(),
            Text(
              "Think of these services as our little gift to you! 🎁 Each one is completely free, built to make your job search smoother, smarter, and more successful. Explore, learn, and take the next step toward your dream career.",
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall?.copyWith(color: Colors.black45),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: services.length,
                separatorBuilder: (_, __) => gapH8(),
                itemBuilder: (context, index) {
                  final item = services[index];
                  return  GestureDetector(  onTap: () {
                    Navigator.pop(context); // close bottom sheet
                    callbacks[index](); // call the corresponding navigation
                  },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            BootstrapColors.colors["primary"] ?? Colors.blue.shade900,
                            BootstrapColors.colors["navy"] ?? Colors.blue.shade700,
                            BootstrapColors.colors["indigo"] ?? Colors.purpleAccent,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            item.icon,
                            color: BootstrapColors.colors["warning"] ?? Colors.white,
                            size: 25,
                          ),
                         gapW16(),
                          Expanded(
                            child: Text(
                              item.title ?? "",
                              style: theme.bodyMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              maxLines: 1,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Icon(Icons.arrow_forward_ios_rounded, size: 20,color: Colors.white,),
                        ],
                      ),
                    ),
                    ),
                  );

                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      );
    },
  );
}
