import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
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

class SettingsBody extends StatefulWidget {
  const SettingsBody({super.key});

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  bool notifications = true;
  bool onlineStatus = true;
  bool emailAlert = false;
  bool smsAlert = false;

  Widget _buildToggle({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
    IconData? icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
        elevation: 2,
        color: Colors.white,
        shadowColor: AppColors.primaryColor,
        surfaceTintColor: AppColors.primaryColor,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ListTile(
          leading: Icon(icon, color: AppColors.primaryColor,size: 25,),
          title: Text(title, style:  context.textTheme.labelMedium?.copyWith(height: 2)),
          subtitle: Text(subtitle, style: context.textTheme.bodyMedium?.copyWith(color: Colors.black54,height: 1.2)),
          trailing: Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: AppColors.primaryColor,
            inactiveTrackColor: Colors.grey,
            padding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
      children: [
        //  Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        //   child: Text(
        //     "General",
        //     style: context.textTheme.labelMedium?.copyWith(color: Colors.grey),
        //   ),
        // ),
        // _buildToggle(
        //   title: "Online Status",
        //   subtitle: "Show others when you’re active on the platform",
        //   value: onlineStatus,
        //   onChanged: (val) => setState(() => onlineStatus = val),
        //   icon: Icons.circle,
        // ),
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            "Alerts",
            style: context.textTheme.labelMedium?.copyWith(color: Colors.grey),
          ),
        ),
        _buildToggle(
          title: "App Notifications",
          subtitle: "Receive updates about new jobs and messages",
          value: notifications,
          onChanged: (val) => setState(() => notifications = val),
          icon: Icons.notifications_active_outlined,
        ),
        _buildToggle(
          title: "Email Alerts",
          subtitle: "Get job recommendations and updates via email",
          value: emailAlert,
          onChanged: (val) => setState(() => emailAlert = val),
          icon: Icons.email_outlined,
        ),
        _buildToggle(
          title: "SMS Alerts",
          subtitle: "Receive important alerts through SMS",
          value: smsAlert,
          onChanged: (val) => setState(() => smsAlert = val),
          icon: Icons.sms_outlined,
        ),
      ],
    );
  }
}
