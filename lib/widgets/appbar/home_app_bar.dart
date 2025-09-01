import 'package:flutter/material.dart';

import '../form/home_search.dart';

AppBar appBarHome(BuildContext context) {
  return AppBar(
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.only(left: 12, right: 6),
      child: Icon(Icons.menu,size: 35
      ),
    ),
    title: HomeSearch(),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openEndDrawer();
            },
            child: Icon(Icons.notifications_none_outlined,size: 35,),
          ),
        ),
      )
    ],
  );
}
