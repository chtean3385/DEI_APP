import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/view_all_button.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_styles.dart';

class HiringInfoWidget extends StatelessWidget {
  const HiringInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.bg.withValues(alpha: .5),
            borderRadius: BorderRadius.only(topRight:Radius.circular(30) ,topLeft: Radius.circular(30))
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
                        color: Colors.black26,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Top companies on DEI are hiring by directly "
                          "reaching out to jobseekers without posting a job. "
                          "Learn how you can make the best of this opportunity",
                      style: theme.textTheme.displaySmall?.copyWith(
                        color: Colors.black45,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ViewAllButton(text: "Learn more",),
                    gapH20(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
