import 'package:dei_champions/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../main.dart';

Future<void> showPermissionAlert({required String requestMessage}) async {
  final colorTheme = navigatorKey.currentContext!.colors;
  await showDialog(
      context: navigatorKey.currentContext!,
      useSafeArea: true,
      builder: (context) => AlertDialog(
            insetPadding: const EdgeInsets.all(20),
            titlePadding: const EdgeInsets.all(0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.all(0),
            actionsPadding: const EdgeInsets.all(0),
            backgroundColor:  colorTheme.alertBgColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius:  BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    color: colorTheme.buttonPrimaryColor,
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Icon(
                    Icons.contacts,
                    color: colorTheme.themBasedWhite,
                    size: 32,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(requestMessage,textScaleFactor: 1,style:Theme.of(context).textTheme.bodyMedium?.copyWith(color: colorTheme.themBasedBlack,) ,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: Text(
                            "CANCEL",textScaleFactor: 1,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: colorTheme.themBasedBlack),
                          )),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await openAppSettings();

                        Navigator.pop(navigatorKey.currentContext!);
                      },
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: Text(
                            "CONTINUE",textScaleFactor: 1,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: colorTheme.themBasedBlack),
                          )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ));
}
