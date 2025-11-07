import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../models/men_alias/champion_diversity_model.dart';
import '../../../../utils/fa_icon.dart';


class ChampionDiversityCard extends StatelessWidget {
  final PointModel item;
  final double width;


  const ChampionDiversityCard({required this.item, required this.width,});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: DecoratedBox(
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
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 100,
            maxWidth: width,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      getFontAwesomeIcon(item.icon),
                      color:
                      BootstrapColors.colors["lightNavy"] ??
                          AppColors.primaryColor,
                      size: 15,
                    ),
                    gapW8(),
                    Flexible(
                      child: Text(
                        item.heading ?? "",
                        style: theme.labelSmall,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                    ),

                  ],
                ),
                gapH8(),
                Text(
                  item.description ?? "",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: context.textTheme.displaySmall?.copyWith(
                    color: Colors.black54,
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
class ShimmerChampionDiversityCard extends StatelessWidget {


  const ShimmerChampionDiversityCard();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(6),
          bottomLeft: Radius.circular(6),
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
