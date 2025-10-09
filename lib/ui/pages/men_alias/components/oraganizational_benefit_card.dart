import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/models/men_alias/organizational_benefit_model.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../utils/fa_icon.dart';


class OrganizationalBenefitCard extends StatelessWidget {
  final BenefitModel item;
  final double width;


  const OrganizationalBenefitCard({required this.item, required this.width,});

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
            topRight: Radius.circular(6),
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(16),
          ),
          border: Border.all(color: Colors.black12, width: 1),
        ),
        child: SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  getFontAwesomeIcon(item.icon),
                  color:
                  BootstrapColors.colors["lightNavy"] ??
                      AppColors.primaryColor,
                  size: 18,
                ),
                gapH8(),
                Flexible(
                  child: Text(
                    item.heading ?? "",
                    style: theme.displaySmall?.copyWith(fontSize: 13),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
                // gapH8(),
                // Text(
                //   item.description ?? "",
                //   softWrap: true,
                //   textAlign: TextAlign.start,
                //   style: context.textTheme.displaySmall?.copyWith(
                //     color: Colors.black54,
                //   ),
                // ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
class ShimmerOrganizationalBenefitCard extends StatelessWidget {


  const ShimmerOrganizationalBenefitCard();

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
