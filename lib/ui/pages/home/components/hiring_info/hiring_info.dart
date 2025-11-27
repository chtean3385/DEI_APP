import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/view_all_button.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_styles.dart';

class HiringInfoWidget extends StatelessWidget {
  const HiringInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = context.colors;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorTheme.commonDividerBgColor.withValues(alpha: .3),
          borderRadius: BorderRadius.only(topRight:Radius.circular(16) ,topLeft: Radius.circular(16))
        ),
        child: Align(
          alignment: AlignmentGeometry.centerLeft,
          child: SizedBox(
            width: MediaQuery.of(context).size.width*.8,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "70% hiring \nhappens without \nany job post",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorTheme.grey.withValues(alpha: .5),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Top companies on DEI are hiring by directly "
                        "reaching out to jobseekers without posting a job. "
                        "Learn how you can make the best of this opportunity",
                    textAlign: TextAlign.left,
                    style: theme.textTheme.displaySmall?.copyWith(
                      color: colorTheme.black45,fontSize: 10,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text("Learn more",style: theme.textTheme.displaySmall?.copyWith(
                    color:  context.colors.buttonPrimaryColor,
                    fontWeight: FontWeight.w600,
                  )),
                  gapH20(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
