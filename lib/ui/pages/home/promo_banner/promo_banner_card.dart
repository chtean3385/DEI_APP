import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/widgets/others/rounded_network_image.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../models/home/promo_banner/promo_banner_model.dart';

class PromoBannerWidget extends StatelessWidget {
  final PromoBannerModel banner;

  const PromoBannerWidget({required this.banner});

  @override
  Widget build(BuildContext context) {
    return banner.isBannerImage ? _imageBanner() : _normalBanner();
  }

  // ---------------- IMAGE BANNER -----------------
  Widget _imageBanner() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        RoundedNetworkImage(
          imageUrl: banner.imageUrl ?? "",
          height: 150,
          width: double.infinity,
          borderRadius: 16,
        ),

        Padding(
          padding: const EdgeInsets.all(12),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: navigatorKey.currentContext!.colors.buttonPrimaryColor,
              // 🔵 primary BG
              foregroundColor: Colors.white,
              // ⚪ white text & icon
              visualDensity: VisualDensity.compact,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: Text(
              banner.buttonLabel ?? "Explore",
              style: navigatorKey.currentContext!.textTheme.bodyMedium
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  // ---------------- NORMAL TEXT BANNER -----------------
  Widget _normalBanner() {
    final theme = navigatorKey.currentContext!.textTheme;
    final List<Color> colors =
        Theme.of(navigatorKey.currentContext!).brightness == Brightness.dark
        ? [Color(0xFF1A1A1A), Color(0xFF2A1E12), Color(0xFF3A2614)]
        : [Colors.white, Colors.orange.shade50, Colors.orange.shade50];
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          begin: Alignment.topCenter, // 🔼 start at top
          end: Alignment.bottomCenter, // 🔽 end at bottom
          colors: colors,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.workspace_premium, color: Colors.orange, size: 48),
          const SizedBox(height: 6),
          Text(
            banner.title ?? "",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: theme.titleMedium,
          ),
          const SizedBox(height: 6),
          Text(
            banner.subTitle ?? "",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: theme.bodyMedium?.copyWith(
              color: navigatorKey.currentContext!.colors.black54,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 6),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: navigatorKey.currentContext!.colors.buttonPrimaryColor,
              // 🔵 primary BG
              foregroundColor: Colors.white,
              // ⚪ white text & icon
              visualDensity: VisualDensity.compact,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: Text(
              banner.buttonLabel ?? "Explore",
              style: navigatorKey.currentContext!.textTheme.bodyMedium
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
