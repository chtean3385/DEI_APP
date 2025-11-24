import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/models/common/faq_model.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class FaqCard extends StatelessWidget {
  final FaqModel item;

  const FaqCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final colorTheme  = context.colors;
    return Card(
      elevation: 2,
      color: colorTheme.commonDividerBgColor,
      shadowColor: colorTheme.buttonPrimaryColor,
      surfaceTintColor: colorTheme.buttonPrimaryColor,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),side: BorderSide(color:colorTheme.commonDividerBgColor, )),
      child: ExpansionTile(
        initiallyExpanded: false,
        // collapsed by default
        title: Text(
          item.question ?? "",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorTheme.black87,
          ),
        ),
        visualDensity: VisualDensity.compact,

        iconColor: colorTheme.black54,
        collapsedIconColor: colorTheme.black54,
        backgroundColor: colorTheme.commonDividerBgColor,
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        children: [Text(item.answer ?? "", style: theme.bodyMedium)],
      ),
    );
  }
}
