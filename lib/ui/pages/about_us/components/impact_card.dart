import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/models/home/dei_champion_candidates/champion_list_model.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../widgets/others/rounded_network_image.dart';

class ImpactCard extends StatelessWidget {
  final String title;
  final String value;

  const ImpactCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
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
                color: Colors.black54,
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

  Widget _skillsRow(List<String>? skills) {
    if (skills == null || skills.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: 20, // fixed height for chips
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: skills
            .map(
              (s) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: _tagChip(s),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _tagChip(String tag) {
    return // Tag chip
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        tag,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        textAlign: TextAlign.center,
        style: navigatorKey.currentContext!.textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 10,
          color: Colors.black,
        ),
      ),
    );
  }
}
