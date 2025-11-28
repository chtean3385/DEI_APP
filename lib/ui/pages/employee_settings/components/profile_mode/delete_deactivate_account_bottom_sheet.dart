import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/ui/pages/employee_settings/components/profile_mode/show_account_action_sheet.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void showAccountDeleteOptionsSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: context.colors.commonDividerBgColor,
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext context) {
      return Consumer(
        builder: (context, ref, _) {

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SettingActionButton(
                    icon: FontAwesomeIcons.ban,
                    title: "Deactivate Account",
                    onTap: () {
                      showAccountActionSheet(
                        context: context,
                        title: "You are about to deactivate your DEI account",
                        points: [
                          "This will make my profile completely invisible to recruiters",
                          "I will not hear from DEI unless I login again on the platform",
                        ],
                        onConfirm: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          // handle deactivate logic
                        },
                      );
                    },

                  ),
                  const SizedBox(height: 20),
                  SettingActionButton(
                    icon: FontAwesomeIcons.trashCan,
                    title: "Delete Account",
                    onTap: () {
                      showAccountActionSheet(
                        context: context,
                        title: "You are about to delete your DEI Account",
                        points: [
                          "All your DEI account data will be lost",
                        ],
                        onConfirm: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          // handle delete logic
                        },
                      );
                    },

                  ),
                ],
              )



              //   Column(
            //     mainAxisSize: MainAxisSize.min,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            // IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.ban)),
            // IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.trash))
            //       // CustomDynamicButton(
            //       //   activeIcon: FontAwesomeIcons.bookmark,
            //       //   inActiveIcon: FontAwesomeIcons.solidBookmark,
            //       //   activeTitle: "Deactivate Account",
            //       //   inActiveTitle: "Deactivate Account",
            //       //   radius: 30,
            //       //   smaller: true,
            //       //   activeIconSize:12,
            //       //   inActiveIconSize:12,
            //       //   activeColor:colorTheme.buttonPrimaryColor,
            //       //   inActiveColor: colorTheme.buttonPrimaryColor,
            //       //   activeBgColor: colorTheme.jobCardBgColor,
            //       //   inActiveBgColor: colorTheme.jobCardBgColor,
            //       //   initialValue: !(job?.isSaved ?? false),
            //       //   onPressed: (isSavedNow) async {
            //       //     final jobId = job?.id ?? "";
            //       //
            //       //     if (isSavedNow) {
            //       //       await jobNotifier.unSaveJob(jobId);
            //       //       debugPrint("❌ unSaveJob for $jobId");
            //       //       Navigator.pop(context);
            //       //       return true;
            //       //     } else {
            //       //       await jobNotifier.saveJob(jobId);
            //       //       debugPrint("✅ saveJob for $jobId");
            //       //       Navigator.pop(context);
            //       //       return true;
            //       //     }
            //       //
            //       //   },
            //       // ),
            //       //
            //       // gapH16(),
            //       //
            //       // /// 🔹 Apply / Unapply Button
            //       // CustomDynamicButton(
            //       //   activeIcon: FontAwesomeIcons.paperPlane,
            //       //   inActiveIcon: FontAwesomeIcons.circleCheck,
            //       //   activeTitle: "Apply",
            //       //   inActiveTitle: "Applied",
            //       //   size:15,
            //       //   activeIconSize:12,
            //       //   radius: 30,
            //       //   smaller: true,
            //       //   activeColor:colorTheme.buttonPrimaryColor,
            //       //   inActiveColor: colorTheme.buttonPrimaryColor,
            //       //   activeBgColor: colorTheme.jobCardBgColor,
            //       //   inActiveBgColor: colorTheme.jobCardBgColor,
            //       //   initialValue: !(job?.isApplied ?? false),
            //       //   onPressed: (isAppliedNow) async {
            //       //     final jobId = job?.id ?? "";
            //       //
            //       //     if (isAppliedNow) {
            //       //       final success =
            //       //       await jobNotifier.unApplyJob(context, jobId);
            //       //       Navigator.pop(context);
            //       //       return success;
            //       //     } else {
            //       //       final success =
            //       //       await jobNotifier.applyJob(context, jobId);
            //       //       Navigator.pop(context);
            //       //       return success;
            //       //     }
            //       //   },
            //       // ),
            //       //
            //       // gapH16(),
            //       //
            //       // // /// 🔹 Share Button
            //       // // CustomDynamicButton(
            //       // //   activeIcon: Icons.share,
            //       // //   inActiveIcon: Icons.share_outlined,
            //       // //   activeTitle: "Shared Job",
            //       // //   inActiveTitle: "Share Job",
            //       // //   size: 30,
            //       // //   smaller: false,
            //       // //   onPressed: (shared) async {
            //       // //     debugPrint("Share tapped!");
            //       // //     return true;
            //       // //   },
            //       // // ),
            //       // //
            //       // // gapH16(),
            //     ],
            //   ),
            ),
          );
        },
      );
    },
  );
}
class SettingActionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SettingActionButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            icon,
            color: context.colors.black87,
            size: 16,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
