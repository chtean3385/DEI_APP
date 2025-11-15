import 'package:flutter/material.dart';

class AppTutorialKeys {
  static GlobalKey searchButtonKey = GlobalKey(
    debugLabel: "searchButtonKey",
  ); // for search field
  static GlobalKey notificationButtonKey = GlobalKey(
    debugLabel: "notificationButtonKey",
  ); // for notifications
  static GlobalKey homeButtonKey = GlobalKey(
    debugLabel: "homeButtonKey",
  ); // for Home button
  static GlobalKey profileButtonKey = GlobalKey(
    debugLabel: "profileButtonKey",
  ); // for Profile button
  static GlobalKey appliedButtonKey = GlobalKey(
    debugLabel: "appliedButtonKey",
  ); // for Applied Jobs
  static GlobalKey savedButtonKey = GlobalKey(
    debugLabel: "savedButtonKey",
  ); // for Saved Jobs
  static GlobalKey dashBoardButtonKey = GlobalKey(
    debugLabel: "dashBoardButtonKey",
  ); // for Dashboard
  static GlobalKey filterButtonKey = GlobalKey(
    debugLabel: "filterButtonKey",
  ); // optional filter FAB
}
