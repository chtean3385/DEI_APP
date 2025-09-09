import 'package:flutter/material.dart';

import 'home_top_slider_tile.dart';

/// 👤 Profile section card with horizontal scroll
class HomeTopSlider extends StatelessWidget {
  const HomeTopSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // Adjust based on your card height
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            HomeTopSliderTile(
              title: "John Deo's profile",
              subtitle: "Updated today",
              progress: 0.55,
              missingDetails: "7 Missing details",
            ),
            const SizedBox(width: 12),
            HomeTopSliderTile(
              title: "Search appearance",
              subtitle: "Last 90 days",
              counter: "45",
              action: "View all",
            ),
            const SizedBox(width: 12),
            // Add more cards if needed
            HomeTopSliderTile(
              title: "Recruiter action",
              subtitle: "Last 90 days",
              counter: "45",
              action: "View all",
            ),
          ],
        ),
      ),
    );
  }
}
