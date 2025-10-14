import 'package:dei_champions/main.dart';
import 'package:dei_champions/models/job/job_model.dart';
import 'package:dei_champions/widgets/others/custom_decorated_box.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../../constants/app_styles.dart';
import '../../../../constants/app_colors.dart';
import '../../../../widgets/others/custom_theme_button.dart';

class AppliedJobCard extends StatelessWidget {
  final JobModel jobModel;
  final GestureTapCallback? onTap;

  const AppliedJobCard({super.key, required this.jobModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(6),
          bottomLeft: Radius.circular(6),
          bottomRight: Radius.circular(16),
        ),
        side: BorderSide(color: Colors.black12, width: 1),
      ),
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        jobModel.title,
                        style: theme.labelMedium?.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        jobModel.companyName,
                        style: theme.labelSmall?.copyWith(color: Colors.black),
                      ),
                      const SizedBox(height: 6),
                    ],
                  ),
                ),
                gapW8(),
                _buildStatusButton(jobModel.status ?? ""),

                // RoundedNetworkImage(
                //   imageUrl: jobModel.logoUrl,
                //   width: 50,
                //   height: 50,
                //   borderRadius: 8,
                // ),
              ],
            ),

            // Rating
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //
            //   children: [
            //     // ⭐ Star + rating
            //     Row(
            //       children: [
            //         const Icon(Icons.star, color: Colors.orange, size: 20),
            //         const SizedBox(width: 2),
            //         Text(
            //           jobModel.rating.toString(),
            //           style: theme.bodyMedium?.copyWith(
            //             color: Colors.black45,
            //           ),
            //         ),
            //       ],
            //     ),
            //     const SizedBox(width: 6),
            //     // 🏢 Company Name
            //     Flexible(
            //       child: Text(
            //         "  |  ${jobModel.reviews} reviews",
            //         style: theme.bodyMedium?.copyWith(color: Colors.black45),
            //         overflow: TextOverflow.ellipsis,
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 6),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 20,
                  color: Colors.black54,
                ),
                SizedBox(width: 4),
                Text(
                  jobModel.location,
                  style: theme.bodyMedium?.copyWith(color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(
                  Icons.work_history_outlined,
                  size: 20,
                  color: Colors.black54,
                ),
                SizedBox(width: 4),
                Text(
                  jobModel.experience,
                  style: theme.bodyMedium?.copyWith(color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                SizedBox(width: 5),
                Text(
                  "₹",
                  style: theme.titleMedium?.copyWith(color: Colors.black54),
                ),
                SizedBox(width: 6),
                Text(
                  jobModel.salary,
                  style: theme.bodyMedium?.copyWith(color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 6),
            const SizedBox(height: 6),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomDecoratedBox(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.info_outline, size: 20, color: Colors.black54),
                      gapW8(),
                      Text(
                        "Applied on:  ${jobModel.postedTime}",
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: theme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                // GestureDetector(
                //   onTap: () => AppNavigator.loadSimilarJobsListScreen(),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       Icon(
                //         Icons.work_outline,
                //         color: AppColors.primaryColor,
                //         size: 20,
                //       ),
                //       SizedBox(width: 8),
                //       Text(
                //         'Similar jobs',
                //         style: theme.bodyMedium?.copyWith(
                //           color: AppColors.primaryColor,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomThemeButton(
                  child: Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye,
                        size: 15,
                        color: AppColors.primaryColor,
                      ),
                      gapW6(),
                      Text(
                        "View More",
                        style: navigatorKey
                            .currentContext!
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                  color: AppColors.primaryColor.withValues(alpha: .1),
                  borderColor: AppColors.primaryColor.withValues(alpha: .1),
                  radius: 8,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  onTap: onTap,
                ),
                CustomThemeButton(
                  child: Row(
                    children: [
                      Icon(Icons.cancel, size: 15, color: Colors.red),
                      gapW6(),
                      Text(
                        "Unapply",
                        style: navigatorKey
                            .currentContext!
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                  // color: Colors.red.withValues(alpha: .1),
                  borderColor: Colors.red,
                  radius: 8,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  onTap: () {}, // disable tap for accepted/pending
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusButton(String status) {
    late Color buttonColor;
    late String buttonText;

    switch (status.toLowerCase()) {
      case "accepted":
        buttonText = "Accepted";
        buttonColor = Colors.green; // success
        break;
      case "rejected":
        buttonText = "Rejected";
        buttonColor = Colors.red; // error
        break;
      case "pending":
        buttonText = "Pending";
        buttonColor = Colors.orange; // warning
        break;
    }

    return CustomThemeButton(
      child: Text(
        buttonText,
        style: navigatorKey.currentContext!.textTheme.labelSmall?.copyWith(
          color: buttonColor,
        ),
      ),
      color: buttonColor.withValues(alpha: .1),
      borderColor: buttonColor.withValues(alpha: .1),
      radius: 30,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      onTap: () {}, // disable tap for accepted/pending
    );
  }
}
