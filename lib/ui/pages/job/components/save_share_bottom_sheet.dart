import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/ui/pages/job/components/save_hide_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 🔹 Save / Unsave Button
                    CustomDynamicButton(
                      activeIcon: Icons.bookmark_border,
                      inActiveIcon: Icons.bookmark,
                      activeTitle: "Save",
                      inActiveTitle: "Saved",
                      size: 20,
                      smaller: true,
                      initialValue: !(job?.isSaved ?? false),
                      onPressed: (isSavedNow) async {
                        final jobId = job?.id ?? "";

                        if (isSavedNow) {
                          await jobNotifier.unSaveJob(jobId);
                          debugPrint("❌ unSaveJob for $jobId");
                          return true;
                        } else {
                          await jobNotifier.saveJob(jobId);
                          debugPrint("✅ saveJob for $jobId");
                          return true;
                        }
                      },
                    ),

                    gapH16(),

                    /// 🔹 Apply / Unapply Button
                    CustomDynamicButton(
                      activeIcon: Icons.send_rounded,
                      inActiveIcon: Icons.check_circle_rounded,
                      activeTitle: "Apply",
                      inActiveTitle: "Applied",
                      size: 20,
                      smaller: true,
                      initialValue: !(job?.isApplied ?? false),
                      onPressed: (isAppliedNow) async {
                        final jobId = job?.id ?? "";

                        if (isAppliedNow) {
                          final success =
                          await jobNotifier.unApplyJob(context, jobId);
                          return success;
                        } else {
                          final success =
                          await jobNotifier.applyJob(context, jobId);
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
            ),
          );
        },
      );
    },
  );
}

