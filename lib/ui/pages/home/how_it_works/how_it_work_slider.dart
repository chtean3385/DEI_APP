import 'package:flutter/material.dart';

import '../../../../models/home/how_it_works/how_it_work_model.dart';
import 'how_it_works_card.dart';

/// 🔄 PageView slider for ResumeBoostCards
class HowItWorkSlider extends StatefulWidget {
  final List<HowItsWorkModel> howItWork;

  const HowItWorkSlider({super.key, required this.howItWork});

  @override
  State<HowItWorkSlider> createState() => _HowItWorkSliderState();
}

class _HowItWorkSliderState extends State<HowItWorkSlider> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 130,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.howItWork.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              final item = widget.howItWork[index];

              return HowItWorkCard(
                item: item,
                length: widget.howItWork.length,
                currentPage: _currentPage,
              );
            },
          ),
        ),
      ],
    );
  }
}
