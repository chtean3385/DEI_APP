import 'package:flutter/cupertino.dart';

import '../../constants/app_colors.dart';

class CustomThemedCard extends StatelessWidget {
  final Widget child;
  final double radius;

  const CustomThemedCard({
    super.key,
    required this.child,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.primarySemiDarkColor,
            AppColors.primaryDarkColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: (AppColors.primaryColor).withAlpha((0.3 * 255).round()),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(width: 1, color: AppColors.primaryColor),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: child,
    );
  }
}
