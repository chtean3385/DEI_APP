// import 'package:dei_champions/widgets/others/rounded_network_image.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../constants/app_colors.dart';
//
// import 'dart:async';
//
//
// class CompanyGallerySlider extends StatefulWidget {
//   final List<String> items;
//   final Duration slideInterval;
//   final Duration animationDuration;
//
//   const CompanyGallerySlider({
//     super.key,
//     required this.items,
//     this.slideInterval = const Duration(seconds: 3),
//     this.animationDuration = const Duration(milliseconds: 500),
//   });
//
//   @override
//   State<CompanyGallerySlider> createState() => _CompanyGallerySliderState();
// }
//
// class _CompanyGallerySliderState extends State<CompanyGallerySlider> {
//   late final PageController _controller;
//   Timer? _autoSlideTimer;
//   static const int _initialPageOffset = 1000; // large offset for infinite effect
//   double _currentPage = 0;
//   @override
//   void initState() {
//     super.initState();
//     _controller = PageController(initialPage: _initialPageOffset);
//     _controller.addListener(() {
//       setState(() {
//         _currentPage = _controller.page ?? 0;
//       });
//     });
//     _startAutoSlide();
//   }
//
//   void _startAutoSlide() {
//     _autoSlideTimer = Timer.periodic(widget.slideInterval, (_) {
//       if (widget.items.isEmpty) return;
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
//     return Column(
//       children: [
//         SizedBox(
//           height: 130,
//           child: PageView.builder(
//             controller: _controller,
//             itemBuilder: (context, index) {
//               final actualIndex = index % widget.items.length;
//               final item = widget.items[actualIndex];
//               return RoundedNetworkImage(
//                 imageUrl: item,
//                 width: double.infinity,
//                 height: 100,
//                 borderRadius: 4,
//               );
//             },
//           ),
//         ),
//         const SizedBox(height: 8),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: List.generate(widget.items.length, (index) {
//             final isActive = (_currentPage % widget.items.length).round() == index;
//
//             return Container(
//               margin: const EdgeInsets.symmetric(horizontal: 4),
//               child: CircleAvatar(
//                 radius:  isActive ? 6 :3,
//                 backgroundColor: isActive
//                     ? (BootstrapColors.colors["orange"] ?? Colors.orange)
//                     : Colors.grey.shade300,
//               ),
//             );
//           }),
//         )
//       ],
//     );
//   }
// }
//
//
