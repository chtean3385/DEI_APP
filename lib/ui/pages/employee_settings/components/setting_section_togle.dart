import 'package:dei_champions/constants/app_theme.dart';
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
    final themeColor =context.colors;
    return Card(
      elevation: 2,
      color: themeColor.jobCardBgColor,
      shadowColor: themeColor.buttonPrimaryColor,
      surfaceTintColor: themeColor.buttonPrimaryColor,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, color: themeColor.buttonPrimaryColor,size: 25,),
        title: Text(title, style:  context.textTheme.labelMedium?.copyWith(height: 2)),
        subtitle: Text(subtitle, style: context.textTheme.bodyMedium?.copyWith(color: themeColor.black54,height: 1.2)),
        trailing: SwitchTheme(
          data: SwitchThemeData(
            trackOutlineColor: MaterialStateProperty.resolveWith((states) {
              if (!states.contains(MaterialState.selected)) {
                return themeColor.grey; // 🔥 inactive border color
              }
              return themeColor.buttonPrimaryColor; // active border color
            }),
          ),
          child: Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: themeColor.buttonPrimaryColor,
            inactiveThumbColor: themeColor.buttonPrimaryColor,
            inactiveTrackColor: themeColor.grey,
          
            padding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}