import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/theme_controller.dart';
import 'components/button_color_dialog.dart';
import 'components/setting_section_title.dart';
import 'components/setting_section_togle.dart';

class SettingsBody extends ConsumerWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accessibility = ref.watch(accessibilityProvider);
    final accController = ref.read(accessibilityProvider.notifier);

    final themeMode = ref.watch(themeNotifierProvider);
    final themeController = ref.read(themeNotifierProvider.notifier);

    final settings = ref.watch(userSettingsProvider);
    final settingsCtrl = ref.read(userSettingsProvider.notifier);

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      children: [
        const SectionTitle("Account"),

        // -----------------------------------
        // THEME SWITCH
        // -----------------------------------
        SettingArrow(
          title: "Profile Mode",
          subtitle: "Control the visibility of your profile to recruiters & companies",
          icon: Icons.manage_accounts_sharp,
          onTap: () => AppNavigator.loadProfileModeSettingsScreen(),
        ),
        // -----------------------------------
        // APPEARANCE TITLE
        // -----------------------------------
        const SectionTitle("Appearance"),

        // -----------------------------------
        // THEME SWITCH
        // -----------------------------------
        SettingToggle(
          title: themeMode == ThemeMode.dark ? "Dark Mode" : "Light Mode",
          subtitle: "Switch between dark and light themes",
          value: themeMode == ThemeMode.dark,
          icon: themeMode == ThemeMode.dark
              ? Icons.dark_mode
              : Icons.light_mode,
          onChanged: (val) {
            themeController.state = val ? ThemeMode.dark : ThemeMode.light;
          },
        ),

        // -----------------------------------
        // FONT SIZE
        // -----------------------------------

        // Card(
        //   elevation: 2,
        //   color: Colors.white,
        //   shadowColor: AppColors.primaryColor,
        //   surfaceTintColor: AppColors.primaryColor,
        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        //   child: ListTile(
        //     leading: Icon(Icons.format_size, color: AppColors.primaryColor),
        //     title: Text(
        //       "Font Size",
        //       style: context.textTheme.labelMedium?.copyWith(height: 2),
        //     ),
        //     subtitle: Text(
        //       "Adjust text size across the app",
        //       style: context.textTheme.bodyMedium?.copyWith(color: Colors.black54),
        //     ),
        //     trailing: Row(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         IconButton(
        //           icon: Icon(Icons.remove,color: Colors.black,),
        //           onPressed: accController.decreaseFont,
        //         ),
        //         Text( (accessibility.fontScale * 16).round().toString(),style: context.textTheme.bodyMedium,),
        //         IconButton(
        //           icon: Icon(Icons.add,color: Colors.black,),
        //           onPressed: accController.increaseFont,
        //
        //         ),
        //       ],
        //     ),
        //   ),
        // ),

        // Card(
        //   elevation: 2,
        //   color: Colors.white,
        //   shadowColor: AppColors.primaryColor,
        //   surfaceTintColor: AppColors.primaryColor,
        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        //   child: ListTile(
        //     leading: Icon(Icons.color_lens, color: AppColors.primaryColor),
        //     title: Text(
        //       "Button Color",
        //       style: context.textTheme.labelMedium?.copyWith(height: 2),
        //     ),
        //     subtitle: Text(
        //       "Choose your preferred button color",
        //       style: context.textTheme.bodyMedium?.copyWith(color: Colors.black54),
        //     ),
        //     trailing: GestureDetector(
        //       onTap: () async {
        //         final selectedColor = await showDialog<Color>(
        //           context: context,
        //           builder: (_) => ButtonColorDialog(),
        //         );
        //         if (selectedColor != null) {
        //           settingsCtrl.setButtonColor(selectedColor);
        //         }
        //       },
        //       child: CircleAvatar(
        //         radius: 14,
        //         backgroundColor: settings.buttonColor,
        //       ),
        //     ),
        //   ),
        // ),


        // -----------------------------------
        // ALERTS SECTION
        // -----------------------------------
        const SectionTitle("Alerts"),

        SettingToggle(
          title: "App Notifications",
          subtitle: "Receive updates about new jobs and messages",
          value: settings.notifications,
          icon: Icons.notifications_active_outlined,
          onChanged: settingsCtrl.toggleNotifications,
        ),

        SettingToggle(
          title: "Email Alerts",
          subtitle: "Get job recommendations and updates via email",
          value: settings.emailAlert,
          icon: Icons.email_outlined,
          onChanged: settingsCtrl.toggleEmail,
        ),

        SettingToggle(
          title: "SMS Alerts",
          subtitle: "Receive important alerts through SMS",
          value: settings.smsAlert,
          icon: Icons.sms_outlined,
          onChanged: settingsCtrl.toggleSMS,
        ),
      ],
    );
  }
}
