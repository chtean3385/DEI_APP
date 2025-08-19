import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color fillColor;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final GestureTapCallback? onTap;

  const CustomButton({
    super.key,
    required this.text,
    this.textColor = Colors.black,
    this.padding,  this.fillColor = Colors.white,  this.radius = 8, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
              offset: Offset(3.0, 3.0),
            ),
          ],
        ),
        child: Padding(
          padding:
              padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            text,
            style: context.textTheme.labelMedium?.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
