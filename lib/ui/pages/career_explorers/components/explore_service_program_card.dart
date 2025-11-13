import 'package:dei_champions/constants/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../models/explore_career/explore_service_program_model.dart';
import '../../../../utils/fa_icon.dart';
import '../../../../widgets/others/custom_theme_button.dart';


class ExploreServiceProgramCard extends StatelessWidget {
  final ExploreServiceProgramModel item;
  final double width;


  const ExploreServiceProgramCard({required this.item, required this.width,});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: DecoratedBox(
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
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          border: Border.all(color: Colors.black12, width: 1),
        ),
        child: SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: item.backgroundColor != null
                      ? HexColor(item.backgroundColor!) // Convert hex to Color
                      : null, // fallback color
                  child: Icon(
                    getFontAwesomeIcon(item.icon),
                    color:Colors.white,
                    size: 18,
                  ),
                ),
                gapH8(),
                Flexible(
                  child: Text(
                    item.title ?? "",
                    style: theme.labelSmall,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ),
                gapH8(),
                Flexible(
                  child: Text(
                    item.subtitle ?? "",
                    softWrap: true,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: theme.displaySmall?.copyWith(
                      color: Colors.black54,fontSize: 12
                    ),
                  ),
                ),
                gapH8(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 2),
                  child: CustomThemeButton(
                    radius: 10,
                    isExpanded: true,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    color: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
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
          ),
        ),
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
