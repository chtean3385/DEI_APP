import 'package:dei_champions/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  final Widget child;


  const ShimmerLoader({
    Key? key,
    required this.child,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colors;

    return Shimmer.fromColors(
      baseColor: colorTheme.shimmerBaseColor,
      highlightColor: colorTheme.shimmerBaseColor,
      child: child,
    );
  }
}



class ShimmerLoaderDynamic extends StatelessWidget {
  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;
  final Duration duration; // New: control shimmer speed

  const ShimmerLoaderDynamic({
    Key? key,
    required this.child,
    this.baseColor,
    this.highlightColor,
    this.duration = const Duration(milliseconds: 1500), // default shimmer speed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final base = baseColor ?? const Color(0xFFE0E0E0);
    final highlight = highlightColor ?? const Color(0xFFF5F5F5);

    return Shimmer.fromColors(
      baseColor: base,
      highlightColor: highlight,
      period: duration, // shimmer speed
      child: child,
    );
  }
}
