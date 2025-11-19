import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class SettingToggle extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final Function(bool) onChanged;
  final IconData icon;

  const SettingToggle({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}