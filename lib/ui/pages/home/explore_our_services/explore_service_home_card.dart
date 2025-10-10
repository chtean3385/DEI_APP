import 'package:dei_champions/models/home/explore_our_services/explore_service_model.dart';
import 'package:dei_champions/widgets/others/custom_theme_button.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class HomeExploreServiceCard extends StatelessWidget {
  final ExploreServiceModel item;
  final double width;
  final GestureTapCallback? onTap;

  const HomeExploreServiceCard({required this.item,required this.width, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: BootstrapColors.colors["navy"] ?? Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(item.icon, color:  BootstrapColors.colors["warning"] ?? Colors.white, size: 30),
              const SizedBox(height: 6),
              Text(
                item.title ?? "",
                style: theme.bodyMedium?.copyWith(
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
                borderColor: (BootstrapColors.colors["orange"] ?? Colors.orange),
                color: (BootstrapColors.colors["orange"] ?? Colors.orange),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

