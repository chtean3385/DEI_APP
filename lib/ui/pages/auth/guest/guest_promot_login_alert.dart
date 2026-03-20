import 'package:dei_champions/constants/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_navigator.dart';

import '../../../../constants/app_drawables.dart';

Future<void> showGuestButtonRestriction(BuildContext context,{String? subtitle}) {
  final theme = Theme.of(context);
  final colorTheme = context.colors;

  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: colorTheme.alertBgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              /// 🔹 Logo
              Image.asset(
                AppDrawables.logo,
                height: 70,
              ),

              const SizedBox(height: 20),

              /// 🔹 Title
              Text(
                "Login Required",
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorTheme.black87,
                ),
              ),

              const SizedBox(height: 12),

              /// 🔹 Description
              Text(
                subtitle ??  "Sign in to apply for jobs, save opportunities, and track your application status.",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorTheme.grey,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 24),

              /// 🔹 Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120, // adjust if needed
                    height: 44,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: colorTheme.buttonPrimaryColor,
                          width: 1.5, // optional thickness
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Cancel",
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: colorTheme.buttonPrimaryColor,fontSize: 16
                        ),
                      ),
                    ),

                  ),

                  const SizedBox(width: 16),

                  SizedBox(
                    width: 120, // adjust if needed
                    height: 44,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorTheme.buttonPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        AppNavigator.loadSignInScreen();
                      },
                      child:  Text("Sign In",style:theme.textTheme.titleMedium?.copyWith(color: Colors.white,fontSize: 16),),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      );
    },
  );
}

