import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../form/home_search.dart';

AppBar appBarHome(BuildContext context, {bool isFromHome = false,String title = ""}) {
  return AppBar(
    elevation: 0,
    backgroundColor: isFromHome ? AppColors.bg : null,
    leading: Builder(
      builder: (context) => IconButton(
        icon: const Icon(Icons.menu, size: 35),
        onPressed: () {
          Scaffold.of(context).openDrawer(); // this will open CustomDrawer
        },
      ),
    ),
    title: isFromHome ? HomeSearch() : title.isNotEmpty ? Text(title,style: context.textTheme.headlineMedium) :null,
    actions: isFromHome
        ? [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: IconButton(
                icon: const Icon(Icons.notifications_none, size: 35),
                onPressed: () {
                  // maybe show notifications later
                },
              ),
            ),
          ]
        : null,
  );
}
