import 'package:flutter/material.dart';

import '../../../../models/home/how_it_works/how_it_work_model.dart';
import 'how_it_works_card.dart';

/// 🔄 PageView slider for ResumeBoostCards
import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../models/home/how_it_works/how_it_work_model.dart';
import 'how_it_works_card.dart';

import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../models/home/how_it_works/how_it_work_model.dart';
import 'how_it_works_card.dart';

class HowItWorkSlider extends StatefulWidget {
  final List<HowItsWorkModel> howItWork;
  final Duration slideInterval;
  final Duration animationDuration;

  const HowItWorkSlider({
    super.key,
    required this.howItWork,
    this.slideInterval = const Duration(seconds: 3),
    this.animationDuration = const Duration(milliseconds: 500),
  });

  @override
  State<HowItWorkSlider> createState() => _HowItWorkSliderState();
}

class _HowItWorkSliderState extends State<HowItWorkSlider> {
  late final PageController _controller;
  Timer? _autoSlideTimer;
  static const int _initialPageOffset = 1000; // large offset for infinite effect

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _initialPageOffset);
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _autoSlideTimer = Timer.periodic(widget.slideInterval, (_) {
      if (widget.howItWork.isEmpty) return;

      _controller.nextPage(
        duration: widget.animationDuration,
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: PageView.builder(
        controller: _controller,
        itemBuilder: (context, index) {
          final actualIndex = index % widget.howItWork.length;
          final item = widget.howItWork[actualIndex];
          return HowItWorkCard(
            item: item,
            length: widget.howItWork.length,
            currentPage: actualIndex,
          );
        },
      ),
    );
  }
}


