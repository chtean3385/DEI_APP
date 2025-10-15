import 'package:dei_champions/constants/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../models/corporate_championing/corporates_partner_model.dart';
import '../../../../utils/fa_icon.dart';


class DeiCorporatePartnerCard extends StatelessWidget {
  final WhyPartnerCardModel item;
  final double width;


  const DeiCorporatePartnerCard({required this.item, required this.width,});

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
            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  getFontAwesomeIcon(item.icon),
                  color:Colors.black,
                  size:20,
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
                Text(
                  item.subtitle ?? "",
                  softWrap: true,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: theme.displaySmall?.copyWith(
                    color: Colors.black54,fontSize: 11
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
class ShimmerDeiCorporatePartnerCard extends StatelessWidget {


  const ShimmerDeiCorporatePartnerCard();

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


