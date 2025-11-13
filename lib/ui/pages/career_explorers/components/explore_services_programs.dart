import 'package:carousel_slider/carousel_slider.dart';
import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/state_models/services/services_state.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/app_drawables.dart';
import '../../../../constants/app_styles.dart';
import 'explore_service_program_card.dart';

class ExploreServicesPrograms extends ConsumerStatefulWidget {
  const ExploreServicesPrograms({Key? key}) : super(key: key);

  @override
  ConsumerState<ExploreServicesPrograms> createState() =>
      _ExploreServicesProgramsState();
}

class _ExploreServicesProgramsState
    extends ConsumerState<ExploreServicesPrograms> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // return _loadingItems();
    final state = ref.watch(careerExploreServicesProvider);
    final hasData = (state.data ?? []).isNotEmpty;

    if (!hasData && state.pageState != PageState.loading) {
      return const SizedBox.shrink();
    }

    return state.pageState == PageState.loading
        ? _loadingItems()
        : _dataItems(state);
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
          CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (context, index, realIdx) {
              return ShimmerExploreServiceProgramCard();
            },
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              viewportFraction: 0.55,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                setState(() => _currentIndex = index);
              },
            ),
          ),
          const SizedBox(height: 14),
        ],
      ),
    );
  }

  Widget _dataItems(CareerExploreServicesState state) {
    final exploreServiceProgramModels = state.data ?? [];
    if (exploreServiceProgramModels.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Explore Our Services",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  gapW8(),
                  Image.asset(AppDrawables.Gift, height: 40, width: 40),
                ],
              ),
              gapH4(),
              Text(
                "All free — crafted to help you get your dream job",
                textAlign: TextAlign.left,
                style: Theme.of(
                  context,
                ).textTheme.displaySmall?.copyWith(color: Colors.black45),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        CarouselSlider.builder(
          itemCount: exploreServiceProgramModels.length,
          itemBuilder: (context, index, realIdx) {
            final item = exploreServiceProgramModels[index];
            return ExploreServiceProgramCard(item: item, width: 240);
          },
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: true,
            viewportFraction: 0.55,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
            },
          ),
        ),
        const SizedBox(height: 12),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Row(
            key: ValueKey<int>(_currentIndex),
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(exploreServiceProgramModels.length, (
              index,
            ) {
              final isActive = _currentIndex == index;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 6,
                width: isActive ? 22 : 6,
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColors.primaryColor
                      : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(8),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:dei_champions/constants/app_colors.dart';
// import 'package:dei_champions/constants/enums.dart';
// import 'package:dei_champions/main.dart';
// import 'package:dei_champions/models/state_models/services/services_state.dart';
// import 'package:dei_champions/providers/providers.dart';
// import 'package:dei_champions/widgets/others/shimmer_loader.dart';
// import 'package:dei_champions/widgets/others/theme_extension.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'explore_service_program_card.dart';
//
// class ExploreServicesPrograms extends ConsumerStatefulWidget {
//   const ExploreServicesPrograms({Key? key}) : super(key: key);
//
//   @override
//   ConsumerState<ExploreServicesPrograms> createState() =>
//       _ExploreServicesProgramsState();
// }
//
// class _ExploreServicesProgramsState
//     extends ConsumerState<ExploreServicesPrograms> {
//   int _currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch(careerExploreServicesProvider);
//     final hasData = (state.data ?? []).isNotEmpty;
//
//     if (!hasData && state.pageState != PageState.loading) {
//       return const SizedBox.shrink();
//     }
//
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xfff8f9fa), Color(0xffeef1f5)],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//       padding: const EdgeInsets.symmetric(vertical: 24),
//       child: state.pageState == PageState.loading
//           ? _loadingItems()
//           : _dataItems(state),
//     );
//   }
//
//   Widget _loadingItems() {
//     return ShimmerLoader(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(left: 16),
//             child: ColoredBox(
//               color: Colors.white,
//               child: SizedBox(height: 14, width: 160),
//             ),
//           ),
//           const SizedBox(height: 8),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//               3,
//                   (index) => Padding(
//                 padding: const EdgeInsets.only(right: 16),
//                 child: ShimmerExploreServiceProgramCard(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _dataItems(CareerExploreServicesState state) {
//     final exploreServiceProgramModels = state.data ?? [];
//     if (exploreServiceProgramModels.isEmpty) return const SizedBox.shrink();
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Text(
//             "Our Services & Programs",
//             style: navigatorKey.currentContext!.textTheme.bodyMedium?.copyWith(
//               fontWeight: FontWeight.w700,
//               fontSize: 18,
//               color: AppColors.primaryColor.withOpacity(0.9),
//             ),
//           ),
//         ),
//         const SizedBox(height: 16),
//         CarouselSlider.builder(
//           itemCount: exploreServiceProgramModels.length,
//           itemBuilder: (context, index, realIdx) {
//             final item = exploreServiceProgramModels[index];
//             final bool isActive = index == _currentIndex;
//
//             return AnimatedContainer(
//               duration: const Duration(milliseconds: 400),
//               curve: Curves.easeOutCubic,
//               transform: Matrix4.identity()
//                 ..scale(isActive ? 1.05 : 0.9)
//                 ..rotateZ(isActive ? 0 : 0.02),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(18),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.08),
//                       blurRadius: 10,
//                       spreadRadius: 1,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(18),
//                   child: ExploreServiceProgramCard(item: item, width: 240),
//                 ),
//               ),
//             );
//           },
//           options: CarouselOptions(
//             height: 230,
//             autoPlay: true,
//             autoPlayInterval: const Duration(seconds: 4),
//             enlargeCenterPage: true,
//             viewportFraction: 0.65,
//             enableInfiniteScroll: true,
//             onPageChanged: (index, reason) {
//               setState(() => _currentIndex = index);
//             },
//           ),
//         ),
//         const SizedBox(height: 16),
//         // 🔹 Smooth indicator
//         AnimatedSwitcher(
//           duration: const Duration(milliseconds: 300),
//           child: Row(
//             key: ValueKey<int>(_currentIndex),
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(exploreServiceProgramModels.length, (index) {
//               final isActive = _currentIndex == index;
//               return AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 margin: const EdgeInsets.symmetric(horizontal: 4),
//                 height: 8,
//                 width: isActive ? 22 : 8,
//                 decoration: BoxDecoration(
//                   color:
//                   isActive ? AppColors.primaryColor : Colors.grey.shade400,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               );
//             }),
//           ),
//         ),
//       ],
//     );
//   }
// }
