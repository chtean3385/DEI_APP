import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/models/job/job_model.dart';
import 'package:dei_champions/widgets/others/custom_decorated_box.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../../constants/app_styles.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../widgets/others/custom_theme_button.dart';

class ManageJobCard extends StatelessWidget {
  final JobModel jobModel;
  final GestureTapCallback? onTap;

  const ManageJobCard({super.key, required this.jobModel, this.onTap});

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                CustomDecoratedBox(
                  color: AppColors.bg,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.calendar_month, size: 20, color: Colors.black54),
                      gapW4(),
                      Text(
                        "Posted on:  Tue Aug 19 2025",
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: theme.displaySmall?.copyWith(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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

                CustomDecoratedBox(
                  color: AppColors.bg,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.info_outline, size: 20, color: Colors.black54),
                      gapW4(),
                      Text(
                        "Applicants:  2",
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: theme.displaySmall?.copyWith(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomThemeButton(
                  child: Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye,
                        size: 15,
                        color: Colors.black,
                      ),
                      gapW4(),
                      Text(
                        "View",
                        style: navigatorKey
                            .currentContext!
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  color: AppColors.bg,
                  borderColor: AppColors.bg,
                  radius: 8,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  onTap: ()=>AppNavigator.loadEmployerJobDetailsScreen(),
                ),
                gapW8(),
                CustomThemeButton(
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit,
                        size: 14,
                        color: Colors.black,
                      ),
                      gapW4(),
                      Text(
                        "Edit",
                        style: navigatorKey
                            .currentContext!
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  color: AppColors.bg,
                  borderColor: AppColors.bg,
                  radius: 8,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  onTap: ()=>AppNavigator.loadEditJobPostScreen(),
                ),
                gapW8(),
                CustomThemeButton(
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete,
                        size: 15,
                        color: Colors.black,
                      ),
                      gapW4(),
                      Text(
                        "Delete",
                        style: navigatorKey
                            .currentContext!
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  color: AppColors.bg,
                  borderColor:AppColors.bg,
                  radius: 8,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  onTap: onTap,
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
      case "open":
        buttonText = "Open";
        buttonColor = Colors.green; // success
        break;
      case "closed":
        buttonText = "Closed";
        buttonColor = Colors.red; // error
        break;
      case "drafts":
        buttonText = "Drafts";
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
