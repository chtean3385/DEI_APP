import 'package:flutter/material.dart';

import 'components/slider/home_top_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          HomeTopSlider(),
        ],
      ),
    );
  }
}
