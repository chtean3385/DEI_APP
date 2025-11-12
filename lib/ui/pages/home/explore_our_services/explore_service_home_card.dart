import 'package:dei_champions/constants/app_drawables.dart';
import 'package:dei_champions/models/home/explore_our_services/explore_service_model.dart';
import 'package:dei_champions/widgets/others/custom_theme_button.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class HomeExploreServiceCard extends StatelessWidget {
  final ExploreServiceModel item;
  final double width;
  final GestureTapCallback? onTap;

  const HomeExploreServiceCard({
    required this.item,
    required this.width,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            BootstrapColors.colors["primary"] ?? Colors.blue.shade900,
            BootstrapColors.colors["navy"] ?? Colors.blue.shade700,
            BootstrapColors.colors["indigo"] ?? Colors.purpleAccent,
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          Image.asset(
            AppDrawables.celebration,
            height: 150,
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: BootstrapColors.colors["warning"] ?? Colors.white,
                  size: 50,
                ),
                const SizedBox(height: 6),
                Text(
                  item.title ?? "",
                  style: theme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                const SizedBox(height: 10),

                CustomThemeButton(
                  child: Text(
                    'SEE HOW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: onTap,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  radius: 8,
                  borderColor:
                      (BootstrapColors.colors["orange"] ?? Colors.orange),
                  color: (BootstrapColors.colors["orange"] ?? Colors.orange),
                ),
              ],
            ),
          ),
          // 👇 Move this image 5 points down from top
          // Positioned(
          //   top: 17,
          //   right: -15, // push it outside a bit so diagonal looks good
          //   child: Transform.rotate(
          //   angle: 7,
          //     child: Image.asset(
          //       AppDrawables.Gift2,
          //       height: 25,
          //     ),
          //   ),
          // ),


        ],
      ),
    );
  }
}
