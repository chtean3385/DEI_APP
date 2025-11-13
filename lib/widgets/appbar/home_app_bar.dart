import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../form/home_search.dart';

AppBar appBarHome(
  BuildContext context, {
  bool isFromHome = false,
  bool isFromProfile = false,
  String title = "",
  VoidCallback? onPressed,
  bool isEmployer = false,
}) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    titleSpacing: 0,
    leading: Builder(
      builder: (context) => IconButton(
        icon: const Icon(Icons.menu, color: Colors.black45, size: 30),
        onPressed: onPressed,
      ),
    ),
    title: isFromHome
        ? HomeSearch()
        : title.isNotEmpty
        ? Text(title, style: context.textTheme.headlineMedium)
        : null,
    actions: isFromHome
        ? [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                icon: const Icon(
                  Icons.notifications_none,
                  color: Colors.black45,
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
                icon: const Icon(Icons.edit, color: Colors.black54, size: 25),
                onPressed: () =>
                    AppNavigator.loadEditProfileScreen(isEmployer: isEmployer),
              ),
            ),
          ]
        :  null,
  );
}

