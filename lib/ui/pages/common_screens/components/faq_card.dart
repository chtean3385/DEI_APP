import 'package:dei_champions/models/common/faq_model.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class FaqCard extends StatelessWidget {
  final FaqModel item;

  const FaqCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Card(
      elevation: 2,
      color: Colors.white,
      shadowColor: AppColors.primaryColor,
      surfaceTintColor: AppColors.primaryColor,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        initiallyExpanded: false,
        // collapsed by default
        title: Text(
          item.question ?? "",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        visualDensity: VisualDensity.compact,

        iconColor: Colors.black54,
        collapsedIconColor: Colors.black54,
        backgroundColor: Colors.white,
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        children: [Text(item.answer ?? "", style: theme.bodyMedium)],
      ),
    );
  }
}
