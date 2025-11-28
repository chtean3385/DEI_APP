import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/ui/pages/employee_settings/settings_view.dart';
import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/enums.dart';
import '../../../providers/providers.dart';
import '../../../widgets/others/custom_theme_button.dart';


class EmployeeSettingsScreen extends StatelessWidget {
  const EmployeeSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(title: 'Settings',titleStyleSmall: true),
      body: const SettingsBody(),
      floatingActionButton: _submit(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  Widget _submit() {
    return Consumer(
      builder: (context, ref, _) {
        final isLoading = ref.watch(employeeSettingsProvider).updatePageState == PageState.loading;

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: CustomThemeButton(
              isExpanded: false,
              removeAlign: true,
              onTap: isLoading
                  ? null
                  : () async {
                await ref.read(employeeSettingsProvider.notifier).updateUserSettings();
              },
              isLoading: isLoading,
              padding: isLoading
                  ? const EdgeInsets.symmetric(horizontal: 50, vertical: 12)
                  : const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Save Settings',
                  style: context.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),

              radius: 30,
              color: context.colors.buttonPrimaryColor,
              borderColor:context.colors.buttonPrimaryColor,
            ),
          ),
        );
      },
    );
  }
}

