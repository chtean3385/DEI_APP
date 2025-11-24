import 'dart:ui';

import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/ui/pages/employee_settings/components/profile_mode/delete_deactivate_account_bottom_sheet.dart';
import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../providers/theme_controller.dart';

class ProfileModeSettingsScreen extends ConsumerWidget {
  const ProfileModeSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(userSettingsProvider);
    final settingsCtrl = ref.read(userSettingsProvider.notifier);
    return Scaffold(
      appBar: appBarCommon(title: "Profile Mode",titleStyleSmall: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _settingCard(
              title: 'Immediately looking for a job',
              subtitle:
              'Your profile is visible to recruiters & they can reach out to you for job opportunities',
              actions: const [
                _SettingTile(true, 'Job recommendations (daily)'),
                _SettingTile(true, 'Job status updates'),
                _SettingTile(true, 'Notification when your profile is viewed'),
                _SettingTile(true, 'Profile visible to recruiters'),
                _SettingTile(true, 'Jobs & messages from recruiters'),
                _SettingTile(true, 'Promotional mails'),
              ],
              isSelected: settings.profileMode == "immediate",
              onTap: ()=>settingsCtrl.setProfileMode("immediate")
            ),
            const SizedBox(height: 20),
            _settingCard(
              isSelected: settings.profileMode == "not_active",
              onTap: ()=>settingsCtrl.setProfileMode("not_active"),
              title: 'Not actively looking but open for job opportunities',
              subtitle:
              'Your profile is not visible to recruiters but you can still search and apply to jobs',
              actions: const [
                _SettingTile(true, 'Job recommendations (weekly)'),
                _SettingTile(true, 'Job status updates'),
                _SettingTile(true, 'Notification when your profile is viewed'),
                _SettingTile(false, 'Profile visible to recruiters'),
                _SettingTile(false, 'Jobs & messages from recruiters'),
                _SettingTile(false, 'Promotional mails'),
              ],

            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Not looking for a job change right now',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                ),
                IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: context.colors.black54,
                  ),
                  onPressed: () => showAccountDeleteOptionsSheet(context),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              'This will stop all communications from DEI & recruiters. But your profile will be reactivated whenever you log in to your account in the future.',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(color: context.colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingCard({
    required String title,
    required String subtitle,
    required bool isSelected,
    required List<Widget> actions,
    required VoidCallback onTap
  }) {
    final colorTheme = navigatorKey.currentContext!.colors;
    final theme = navigatorKey.currentContext!.textTheme;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorTheme.jobCardBgColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: isSelected? colorTheme.black87: colorTheme.black12,width: isSelected ?1.5:1),
        ),

        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: theme.titleMedium,
                    ),
                  ),
                  if (isSelected ==true)Icon(Icons.check_circle,color: Colors.green,),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style:theme.bodyMedium?.copyWith(color: colorTheme.black54),
              ),
              const SizedBox(height: 8),
              Column(children: actions),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  final bool enabled;
  final String text;

  const _SettingTile(this.enabled, this.text);

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colors;
    final theme = context.textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            enabled ? Icons.check_circle : Icons.cancel,
            size: 16,
            color: colorTheme.black54,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: theme.displaySmall?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
