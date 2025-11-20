import 'package:dei_champions/ui/pages/employee_settings/settings_view.dart';
import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';


class EmployeeSettingsScreen extends StatelessWidget {
  const EmployeeSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(title: 'Settings',titleStyleSmall: true),
      body: const SettingsBody(),
    );
  }
}

