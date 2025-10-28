import 'package:dei_champions/main.dart';
import 'package:dei_champions/models/job/job_model.dart';
import 'package:dei_champions/ui/pages/job/components/save_hide_button.dart';
import 'package:dei_champions/widgets/others/custom_decorated_box.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:dei_champions/widgets/others/view_all_button.dart';
import 'package:flutter/material.dart';

import '../../../../../../constants/app_colors.dart';
import '../../../../../../constants/app_styles.dart';
import '../../../../../../widgets/others/custom_theme_button.dart';
import '../../../../../../widgets/others/rounded_network_image.dart';

class SavedJobCard extends StatelessWidget {
  final JobModel jobModel;
  final GestureTapCallback? onTap;

  const SavedJobCard({super.key, required this.jobModel, this.onTap});

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

                RoundedNetworkImage(
                  imageUrl: jobModel.logoUrl,
                  width: 50,
                  height: 50,
                  borderRadius: 8,
                ),
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
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomThemeButton(
                  child: Row(
                    children: [
                      Text(
                        "View More",
                        style: navigatorKey
                            .currentContext!
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: AppColors.primaryColor),
                      ),
                      gapW6(),
                      Icon(Icons.arrow_forward_ios,size: 12,color: AppColors.primaryColor,)
                    ],
                  ),
                  color: AppColors.primaryColor.withValues(alpha: .1),
                  borderColor: AppColors.primaryColor.withValues(alpha: .1),
                  radius: 4,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  onTap: onTap,
                ),

                CustomDynamicButton(
                  activeIcon:  Icons.bookmark,
                  inActiveIcon:Icons.bookmark_border ,
                  activeTitle:"Saved Job" ,
                  inActiveTitle:"Save Job" ,
                  size:20 ,
                  smaller: true,
                  initialValue: true,
                  onPressed: (saved) {
                    // 🔹 Add API call here
                    print("Save/Hide tapped!");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
