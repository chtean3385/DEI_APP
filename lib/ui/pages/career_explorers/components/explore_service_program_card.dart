import 'package:dei_champions/constants/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_navigator.dart';
import '../../../../models/explore_career/explore_service_program_model.dart';
import '../../../../utils/fa_icon.dart';
import '../../../../widgets/others/custom_theme_button.dart';


class ExploreServiceProgramCard extends StatelessWidget {
  final ExploreServiceProgramModel item;
  final double width;

  const ExploreServiceProgramCard({required this.item, required this.width});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Center content in the available space
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: item.backgroundColor != null
                        ? HexColor(item.backgroundColor!)
                        : null,
                    child: Icon(
                      getFontAwesomeIcon(item.icon),
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  gapH8(),
                  Text(
                    item.title ?? "",
                    style: theme.labelSmall?.copyWith(fontSize: 13),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  gapH8(),
                  Text(
                    item.subtitle ?? "",
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: theme.displaySmall?.copyWith(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom button
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            child: CustomThemeButton(
              radius: 10,
              isExpanded: true,
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              color: AppColors.primaryColor,
              borderColor: AppColors.primaryColor,
              onTap: () => AppNavigator.loadLetsConnect(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enquire",
                    style: theme.labelSmall?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShimmerExploreServiceProgramCard extends StatelessWidget {


  const ShimmerExploreServiceProgramCard();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        border: Border.all(color: Colors.black12, width: 1),
      ),
      child: SizedBox(
        width: 300,height: 100,
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    String formatted = hexColor.toUpperCase().replaceAll("#", "");
    if (formatted.length == 6) {
      formatted = "FF$formatted"; // add alpha if missing
    }
    return int.parse(formatted, radix: 16);
  }
}
