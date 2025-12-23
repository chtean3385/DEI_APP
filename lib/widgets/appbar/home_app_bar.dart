import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../constants/app_keys.dart';
import '../../ui/pages/notification/components/notification_view.dart';
import '../form/home_search.dart';

AppBar appBarHome(
  BuildContext context, {
  bool isFromHome = false,
  bool isFromProfile = false,
  bool isFromBlog = false,
  String title = "",
  VoidCallback? onPressed,
  bool isEmployer = false,
  bool showTutorial = false,
}) {
  return AppBar(
    elevation: 0,
    centerTitle: !isFromBlog,
    titleSpacing: 0,
    leading: Builder(
      builder: (context) => IconButton(
        icon:  Icon(Icons.menu, color: context.colors.black54, size: 30),
        onPressed: onPressed,
      ),
    ),
    title: isFromHome
        ? HomeSearch(showTutorial: showTutorial)
        :isFromBlog?
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Stay Informed With Us",
          style: context.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,fontSize: 12
          ),
          textAlign: TextAlign.left,
        ),
        Text(
          "Don't miss the trending news",
          style: context.textTheme.displaySmall
              ?.copyWith(color: context.colors.black54),
          textAlign: TextAlign.left,
        ),
      ],
    ):

    title.isNotEmpty
        ? Text(title, style: context.textTheme.headlineMedium)
        : null,
    actions: isFromHome
        ? [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: const NotificationIconButton(),

            ),
          ]
        : isFromProfile
        ? [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                icon:  Icon(Icons.edit, color:context.colors.black54, size: 25),
                onPressed: () =>
                    AppNavigator.loadEditProfileScreen(),
              ),
            ),
          ]
        :  null,
  );
}

