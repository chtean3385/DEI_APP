import 'package:flutter/material.dart';

import '../constants/app_drawables.dart';
import '../constants/app_strings.dart';
import '../main.dart';

class WidgetUtils {
  static Future<void> showExitPopUp(BuildContext context) async {
    return await showPopUp(context,
        title: "Confirmation",
        message: "Are you sure to exit the app?",
        sBtnLabel: "Exit",
        sBtnFunction: () => Navigator.of(context).pop(true),
        showBtnN: true);
  }

  static Future<void> showCustomPopUpWithMessage(BuildContext context,{String? message,String? buttonLabel,GestureTapCallback? sBtnFunction,}) async {
    return await showPopUp(context,
        title: "Confirmation",
        message: message,
        sBtnLabel: buttonLabel,
        sBtnFunction:sBtnFunction ??  () => Navigator.of(context).pop(true),
        showBtnN: true);
  }
  static Future<void> showPopUp(BuildContext context,
      {String? title,
      String? message,
      String? sBtnLabel,
      String? nBtnLabel,
      GestureTapCallback? sBtnFunction,
      GestureTapCallback? nBtnFunction,
      bool? showBtnN}) async {
    final theme = Theme.of(context);
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          title ?? AppStrings.appName,
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white),
        ),
        content: Text(
          message ?? "",
          textAlign: TextAlign.center,
          style: Theme.of(navigatorKey.currentContext!)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.w400),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: sBtnFunction ?? () => Navigator.of(context).pop(),
            child: Text(
              sBtnLabel ?? "OK",
              style: theme.textTheme.titleSmall,
            ),
          ),
          showBtnN == true
              ? TextButton(
                  onPressed:
                      nBtnFunction ?? () => Navigator.of(context).pop(false),
                  child: Text(
                    nBtnLabel ?? "Cancel",
                    style: theme.textTheme.titleSmall
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  static Widget errorWidget(String text, {String? image, Color? color}) {
    final theme = Theme.of(navigatorKey.currentContext!);
    return Center(
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: <Widget>[
          logoWidget(),
          const Text(AppStrings.appName),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelMedium
            ),
          ),
        ],
      ),
    );
  }

  static Widget logoWidget() {
    return Image.asset(AppDrawables.logo);
  }

  static Future<void> showLogoutPopUp(
    BuildContext context, {
    GestureTapCallback? sBtnFunction,
  }) async {
    return await showPopUp(context,
        title: "Confirmation",
        message: "Are you sure to Logout?",
        sBtnLabel: "Confirm",
        sBtnFunction: sBtnFunction,
        showBtnN: true);
  }
  static void showSnackBar(final String? message,{int? duration,BuildContext? context,SnackBarAction? action}) {
    ScaffoldMessenger.of(context ?? navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(message ?? ''),
        duration:  Duration(seconds: duration ?? 1),
        action:action,
      ),
    );
  }
}
