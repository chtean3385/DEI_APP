import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/models/about_us/core_values_model.dart';
import 'package:dei_champions/widgets/others/rounded_network_image.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';


class CoreValueCard extends StatelessWidget {
  final CoreValueItem item;
  final double width;


  const CoreValueCard({required this.item, required this.width,});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final colorTheme = context.colors;
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorTheme.jobCardBgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(6),
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(16),
          ),
          border: Border.all(color: colorTheme.black12, width: 1),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: width,
            minHeight: 130,
            minWidth: 200
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RoundedNetworkImage(
                  imageUrl: item.image ?? "",
                  width: 40,
                  height: 40,
                  borderRadius: 8,
                ),

                Text(
                  item.title ?? "",
                  style: theme.labelMedium,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                gapH4(),
                Text(
                  item.description ?? "",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: context.textTheme.displaySmall?.copyWith(
                    color: colorTheme.black54,
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
class ShimmerCoreValueCard extends StatelessWidget {


  const ShimmerCoreValueCard();

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
