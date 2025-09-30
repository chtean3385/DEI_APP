import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class CustomThemeButton extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? borderColor;
  final double radius;
  final double? height;
  final bool isExpanded;
  final bool isLoading;
  final bool alignRight;
  final GestureTapCallback? onTap;
  final EdgeInsetsGeometry? padding;

  const CustomThemeButton({
    super.key,
    required this.child,
    this.color,
    this.borderColor,
    this.radius = 12,
    this.height ,
    this.isExpanded = false,
    this.isLoading = false,
    this.alignRight = false,
    this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignRight ?  AlignmentGeometry.centerRight : AlignmentGeometry.center,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            border: Border.all(width: 1, color: borderColor ??  AppColors.primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          child: SizedBox(
            height: height,
            child: Padding(
              padding:
                  padding ??
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child:AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                child: isExpanded
                    ? SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: isLoading
                        ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator.adaptive(
                        strokeWidth: 2,
                        backgroundColor: Colors.transparent,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                        : child,
                  ),
                )
                    : isLoading
                    ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator.adaptive(
                    strokeWidth: 2,
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
                    : child,
              )
            ),
          ),
        ),
      ),
    );
  }
}
