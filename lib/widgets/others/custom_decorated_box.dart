import 'package:dei_champions/constants/app_theme.dart';
import 'package:flutter/material.dart';

class CustomDecoratedBox extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color? color;
  final BorderRadius borderRadius;
  final BorderSide? borderSide;
  final EdgeInsetsGeometry padding;
  final List<BoxShadow>? boxShadow;

  const CustomDecoratedBox({
    super.key,
    required this.child,
    this.onTap,
    this.color,
    // = Colors.white,
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(16),
      topRight: Radius.circular(6),
      bottomLeft: Radius.circular(6),
      bottomRight: Radius.circular(16),
    ),
    this.borderSide ,
    // = const BorderSide(color: Colors.black12, width: 1),
    this.padding = const EdgeInsets.all(16),
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colors;
    final content = DecoratedBox(
      decoration: BoxDecoration(
        color: color ?? colorTheme.jobCardBgColor,
        borderRadius: borderRadius,
        border: Border.fromBorderSide(borderSide ?? BorderSide(color: colorTheme.black12, width: 1) ),
        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: colorTheme.themBasedBlack.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );

    return onTap != null
        ? GestureDetector(onTap: onTap, child: content)
        : content;
  }
}
