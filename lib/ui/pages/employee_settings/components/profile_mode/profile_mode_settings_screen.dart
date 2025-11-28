import 'dart:ui';

import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/ui/pages/employee_settings/components/profile_mode/delete_deactivate_account_bottom_sheet.dart';
import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'confirm_public_mode_alert.dart';



class ProfileModeSettingsScreen extends ConsumerWidget {
  const ProfileModeSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(employeeSettingsProvider);
    return Scaffold(
      appBar: appBarCommon(title: "Profile Mode",titleStyleSmall: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _settingCard(
              title: 'Private Mode',
              subtitle:
              'Your diversity details stay hidden from all employers.',
              isSelected: settingsState.privacyMode == "private",
               onTap: () {
                 showPrivacyModeConfirmAlert(
                   context: context,
                   title: "Switch to Private Mode?",
                   description:
                   "In Private Mode, none of your diversity information will be visible to employers.",
                   icon: Icons.lock_outline,
                   iconColor: Colors.redAccent,
                   onConfirm: () {
                     ref.read(employeeSettingsProvider.notifier).setPrivacyMode(
                         "private");
                   },
                 );
               }
            ),
            const SizedBox(height: 20),
            _settingCard(
              isSelected: settingsState.privacyMode == "selective",
              title: 'Selective',
              subtitle:
              'Visible only to verified inclusive employers.',
              onTap: (){
                showPrivacyModeConfirmAlert(
                  context: context,
                  title: "Enable Selective Mode?",
                  description:
                  "Your diversity details will be visible only to verified inclusive employers.",
                  icon: Icons.verified_user_outlined,
                  iconColor: Colors.amber,
                  onConfirm: () {
                    ref.read(employeeSettingsProvider.notifier).setPrivacyMode("selective");
                  },
                );

              }

            ),
            const SizedBox(height: 20),
            _settingCard(
              isSelected: settingsState.privacyMode == "public",
              onTap: () {
                showPrivacyModeConfirmAlert(
                  context: context,
                  title: "Enable Public Mode?",
                  description:
                  "You are about to make your diversity information visible to all employers. This means any employer on the platform will be able to view your professional profile and category information.",
                  icon: Icons.public,
                  iconColor: Colors.blue,
                  onConfirm: () {
                    ref.read(employeeSettingsProvider.notifier).setPrivacyMode("public");
                  },
                );

              },

              title: 'Public',
              subtitle:
              'Your diversity info is visible to all employers.',

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
          border: Border.all(
            color: isSelected
                ? colorTheme.buttonPrimaryColor.withValues(alpha: .9)
                : colorTheme.black12,
            width: isSelected ? 1.5 : 1,
          ),
          gradient: isSelected
              ? LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              colorTheme.buttonPrimaryColor.withValues(alpha: .05),
              colorTheme.buttonPrimaryColor.withValues(alpha: .12),
              colorTheme.buttonPrimaryColor.withValues(alpha: .18),
            ],
          )
              : null,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 110),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: theme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isSelected
                              ? colorTheme.buttonPrimaryColor
                              : colorTheme.black54,
                        ),
                      ),
                    ),
                    if (isSelected)
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 30,
                      ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: theme.bodyMedium?.copyWith(
                    color: isSelected
                        ? colorTheme.buttonPrimaryColor.withValues(alpha: .9)
                        : colorTheme.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      )
      ,
    );
  }
}

