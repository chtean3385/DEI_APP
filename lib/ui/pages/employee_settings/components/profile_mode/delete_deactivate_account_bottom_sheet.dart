import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/ui/pages/employee_settings/components/profile_mode/show_account_action_sheet.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
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
      return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(24.0),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // SettingActionButton(
                //   icon: FontAwesomeIcons.ban,
                //   title: "Deactivate Account",
                //   onTap: () {
                //     showAccountActionSheet(
                //       context: context,
                //       title: "You are about to deactivate your DEI account",
                //       points: [
                //         "This will make my profile completely invisible to recruiters",
                //         "I will not hear from DEI unless I login again on the platform",
                //       ],
                //       onConfirm: () {
                //         Navigator.pop(context);
                //         Navigator.pop(context);
                //         // handle deactivate logic
                //       },
                //     );
                //   },
                //
                // ),
                // const SizedBox(height: 20),
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
                    );
                  },

                ),
              ],
            )



        ),
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
