import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';

class HomeTopSliderTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final double? progress;
  final String? missingDetails;
  final String? counter;
  final String? action;

  const HomeTopSliderTile({
    required this.title,
    required this.subtitle,
    this.progress,
    this.missingDetails,
    this.counter,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SizedBox(
      width: 250,
      child: Card(
        elevation: 1,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            children: [
              Center(
                child: progress != null
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  value: progress ?? 0.65,
                                  strokeWidth: 4,
                                  backgroundColor: Colors.grey[200],
                                  valueColor: const AlwaysStoppedAnimation(
                                    AppColors.primaryColor,
                                  ),
                                ),
                              ),
                              const CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.person,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withValues(
                                alpha: 0.3,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 4,
                              ),
                              child: Text(
                                " ${(progress! * 100).toStringAsFixed(0)} %",
                                style: theme.labelSmall?.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : (counter != null
                          ? CircleAvatar(
                              radius: 25,
                              backgroundColor: AppColors.primaryColor
                                  .withValues(alpha: .1),
                              child: Text(
                                counter!,
                                style: theme.headlineMedium,
                              ),
                            )
                          : const SizedBox()),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: theme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: theme.displaySmall?.copyWith(
                        color: Colors.black45,
                      ),
                    ),
                    gapH8(),
                    if (missingDetails != null)
                      Text(
                        missingDetails!,
                        style: theme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    if (action != null)
                      Text(
                        action!,

                        style: theme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
