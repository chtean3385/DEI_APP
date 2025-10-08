import 'package:dei_champions/constants/app_styles.dart';
import 'package:flutter/material.dart';
class WomenQuoteCard extends StatelessWidget {
  final String text;
  final Color startColor;
  final Color endColor;

  const WomenQuoteCard({
    super.key,
    required this.text,
    required this.startColor,
    required this.endColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(right: 16,top: 16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          border: Border.all(color: Colors.black12, width: 1),
        ),
        child: SizedBox(
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GradientVerticalDivider(
                    height: double.infinity,
                    colors: [startColor, endColor,Colors.white],
                  ),
                  gapW8(),
                  Expanded(
                    child: Text(
                      text,
                      style: theme.displaySmall?.copyWith(color: Colors.black54,height: 1.2),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class GradientVerticalDivider extends StatelessWidget {
  final double height;
  final double width;
  final List<Color> colors;

  const GradientVerticalDivider({
    super.key,
    this.height = 80,
    this.width = 10,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width / 2),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors,
        ),
      ),
    );
  }
}


