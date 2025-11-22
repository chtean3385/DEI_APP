import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';


class ImpactCard extends StatelessWidget {
  final String title;
  final String value;

  const ImpactCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final themeColor = context.colors;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: themeColor.jobCardBgColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(6),
          bottomLeft: Radius.circular(6),
          bottomRight: Radius.circular(16),
        ),
        border: Border.all(color: themeColor.black12, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: context.textTheme.displaySmall?.copyWith(
                color: themeColor.black54,
              ),
            ),
            gapH4(),

            Text(
              value,
              style: theme.labelMedium,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
