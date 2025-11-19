import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/ui/pages/job/components/save_hide_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constants/app_colors.dart';
import '../../../../providers/providers.dart';

void showJobOptionsSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext context) {
      return Consumer(
        builder: (context, ref, _) {
          final job = ref.watch(employeeJobDetailsProvider).data; // 👈 read directly
          final jobNotifier = ref.read(employeeManageJobProvider.notifier);

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 🔹 Save / Unsave Button
                  CustomDynamicButton(
                    activeIcon: FontAwesomeIcons.bookmark,
                    inActiveIcon: FontAwesomeIcons.solidBookmark,
                    activeTitle: "Save",
                    inActiveTitle: "Saved",
                    radius: 30,
                    smaller: true,
                    activeIconSize:12,
                    inActiveIconSize:12,
                    activeColor:AppColors.primaryColor,
                    inActiveColor: AppColors.primaryColor,
                    activeBgColor: Colors.white,
                    inActiveBgColor: Colors.white,
                    initialValue: !(job?.isSaved ?? false),
                    onPressed: (isSavedNow) async {
                      final jobId = job?.id ?? "";

                      if (isSavedNow) {
                        await jobNotifier.unSaveJob(jobId);
                        debugPrint("❌ unSaveJob for $jobId");
                        Navigator.pop(context);
                        return true;
                      } else {
                        await jobNotifier.saveJob(jobId);
                        debugPrint("✅ saveJob for $jobId");
                        Navigator.pop(context);
                        return true;
                      }

                    },
                  ),

                  gapH16(),

                  /// 🔹 Apply / Unapply Button
                  CustomDynamicButton(
                    activeIcon: FontAwesomeIcons.paperPlane,
                    inActiveIcon: FontAwesomeIcons.circleCheck,
                    activeTitle: "Apply",
                    inActiveTitle: "Applied",
                    size:15,
                    activeIconSize:12,
                    radius: 30,
                    smaller: true,
                    activeColor: AppColors.primaryColor,
                    inActiveColor: AppColors.primaryColor,
                    activeBgColor: Colors.white,
                    inActiveBgColor: Colors.white,
                    initialValue: !(job?.isApplied ?? false),
                    onPressed: (isAppliedNow) async {
                      final jobId = job?.id ?? "";

                      if (isAppliedNow) {
                        final success =
                        await jobNotifier.unApplyJob(context, jobId);
                        Navigator.pop(context);
                        return success;
                      } else {
                        final success =
                        await jobNotifier.applyJob(context, jobId);
                        Navigator.pop(context);
                        return success;
                      }
                    },
                  ),

                  gapH16(),

                  // /// 🔹 Share Button
                  // CustomDynamicButton(
                  //   activeIcon: Icons.share,
                  //   inActiveIcon: Icons.share_outlined,
                  //   activeTitle: "Shared Job",
                  //   inActiveTitle: "Share Job",
                  //   size: 30,
                  //   smaller: false,
                  //   onPressed: (shared) async {
                  //     debugPrint("Share tapped!");
                  //     return true;
                  //   },
                  // ),
                  //
                  // gapH16(),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

