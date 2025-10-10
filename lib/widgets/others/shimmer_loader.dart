import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  final Widget child;
  final Color baseColor;
  final Color highlightColor;

  const ShimmerLoader({
    Key? key,
    required this.child,
    this.baseColor = const Color(0xFFE0E0E0), // Grey 300
    this.highlightColor = const Color(0xFFF5F5F5), // Grey 100
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
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
