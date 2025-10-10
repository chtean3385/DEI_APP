// import 'dart:async';
//
// import 'package:dei_champions/models/home/explore_our_services/explore_service_model.dart';
// import 'package:dei_champions/ui/pages/home/explore_our_services/explore_service_home_card.dart';
// import 'package:flutter/material.dart';
//
// class ExploreServiceSlider extends StatefulWidget {
//   final List<ExploreServiceModel> itemList;
//   final Duration slideInterval;
//   final Duration animationDuration;
//
//   const ExploreServiceSlider({
//     super.key,
//     required this.itemList,
//     this.slideInterval = const Duration(seconds: 3),
//     this.animationDuration = const Duration(milliseconds: 500),
//   });
//
//   @override
//   State<ExploreServiceSlider> createState() => _ExploreServiceSliderState();
// }
//
// class _ExploreServiceSliderState extends State<ExploreServiceSlider> {
//   late final PageController _controller;
//   Timer? _autoSlideTimer;
//   static const int _initialPageOffset =
//       1000; // large offset for infinite effect
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = PageController(initialPage: _initialPageOffset);
//     _startAutoSlide();
//   }
//
//   void _startAutoSlide() {
//     _autoSlideTimer = Timer.periodic(widget.slideInterval, (_) {
//       if (widget.itemList.isEmpty) return;
//
//       _controller.nextPage(
//         duration: widget.animationDuration,
//         curve: Curves.easeInOut,
//       );
//     });
//   }
//
//   @override
//   void dispose() {
//     _autoSlideTimer?.cancel();
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 130,
//       child: PageView.builder(
//         controller: _controller,
//         itemBuilder: (context, index) {
//           final actualIndex = index % widget.itemList.length;
//           final item = widget.itemList[actualIndex];
//           return HomeExploreServiceCard(
//             item: item,
//             length: widget.itemList.length,
//             currentPage: actualIndex,
//           );
//         },
//       ),
//     );
//   }
// }
