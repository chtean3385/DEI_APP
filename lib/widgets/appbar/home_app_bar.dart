import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../constants/app_keys.dart';
import '../form/home_search.dart';

AppBar appBarHome(
  BuildContext context, {
  bool isFromHome = false,
  bool isFromProfile = false,
  String title = "",
  VoidCallback? onPressed,
  bool isEmployer = false,
  bool showTutorial = false,
}) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    titleSpacing: 0,
    leading: Builder(
      builder: (context) => IconButton(
        icon:  Icon(Icons.menu, color: context.colors.black54, size: 30),
        onPressed: onPressed,
      ),
    ),
    title: isFromHome
        ? HomeSearch(showTutorial: showTutorial)
        : title.isNotEmpty
        ? Text(title, style: context.textTheme.headlineMedium)
        : null,
    actions: isFromHome
        ? [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                key:!showTutorial ? null : AppTutorialKeys.notificationButtonKey,
                icon:  Icon(
                  Icons.notifications_none,
                  color: context.colors.black45,
                  size: 25,
                ),
                onPressed:  () => AppNavigator.loadEmployeeNotificationsScreen(),
              ),
            ),
          ]
        : isFromProfile
        ? [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                icon:  Icon(Icons.edit, color:context.colors.black54, size: 25),
                onPressed: () =>
                    AppNavigator.loadEditProfileScreen(isEmployer: isEmployer),
              ),
            ),
          ]
        :  null,
  );
}

