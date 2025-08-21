import 'package:flutter/material.dart';

class BackgroundImageOverlay extends StatelessWidget {
  final String imagePath;
  final double darkenOpacity;

  const BackgroundImageOverlay({
    super.key,
    required this.imagePath,
    this.darkenOpacity = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: darkenOpacity),
            BlendMode.darken,
          ),
        ),
      ),
    );
  }
}
