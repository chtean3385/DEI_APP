import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';


class AboutVisionCard extends StatelessWidget {
  final String title;
  final String value;

  const AboutVisionCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final colorTheme = context.colors;
    return DecoratedBox(
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
          maxWidth: 300,minHeight: 120
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
                style: theme.labelMedium,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
              gapH4(),
              Text(
                value,
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
    );
  }
}
class ShimmerAboutVisionCard extends StatelessWidget {


  const ShimmerAboutVisionCard();

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
