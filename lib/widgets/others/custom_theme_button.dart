import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class CustomThemeButton extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double radius;
  final double? height;
  final bool isExpanded;
  final bool isLoading;
  final GestureTapCallback? onTap;
  final EdgeInsetsGeometry? padding;

  const CustomThemeButton({
    super.key,
    required this.child,
    this.color,
    this.radius = 12,
    this.height ,
    this.isExpanded = false,
    this.isLoading = false,
    this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          gradient: color != null
              ? LinearGradient(
                  colors: [
                    AppColors.primaryColor,
                    AppColors.primarySemiDarkColor,
                    AppColors.primaryDarkColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : null,
          boxShadow: color != null
              ? [
                  BoxShadow(
                    color: (color ?? AppColors.primaryColor).withAlpha((0.3 * 255).round()),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
          border: Border.all(width: 1, color: AppColors.primaryColor),
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
    );
  }
}
