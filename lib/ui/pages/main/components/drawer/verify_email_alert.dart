import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/app_colors.dart';

void showEmailVerificationAlert() {
  final theme = Theme.of(navigatorKey.currentContext!).textTheme;
final colorTheme = navigatorKey.currentContext!.colors;
  showDialog(
    context: navigatorKey.currentContext!,
    barrierDismissible: true,
    builder: (_) => Dialog(
      backgroundColor: colorTheme.commonDividerBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer(
            builder: (context, watchRef, child) {
              final state = watchRef.watch(profileCompletionProvider);
              final emailState = watchRef.watch(drawerProfileProvider);
              final controller = watchRef.read(profileCompletionProvider.notifier);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.email_outlined,
                  color: colorTheme.buttonPrimaryColor,
                  size: 50,
                ),
                const SizedBox(height: 16),

                Text(
                  "Verify Your Email Address",
                  style: theme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),

                Text(
                  "Your email address is not verified. Please verify your email to access all features and receive important notifications.",
                  textAlign: TextAlign.center,
                  style: theme.bodyMedium,
                ),


                const SizedBox(height: 6),

                Text(
                  emailState.profileData?.email ?? "",
                  textAlign: TextAlign.center,
                  style: theme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorTheme.buttonPrimaryColor,
                  ),
                ),

                const SizedBox(height: 24),

                // SEND EMAIL BUTTON
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorTheme.buttonPrimaryColor,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    Navigator.pop(navigatorKey.currentContext!);
                    // close alert first
                    controller.resendEmailVerification();
                   // trigger API
                  },
                  child:  state.verifyEmailPageState == PageState.loading ? CircularProgressIndicator(color: Colors.white):Text(
                    "Send Verification Email",
                    style: theme.titleMedium?.copyWith(color: Colors.white),
                  ),
                ),

                const SizedBox(height: 12),

                // CANCEL BUTTON
                TextButton(
                  onPressed: () => Navigator.pop(navigatorKey.currentContext!),
                  child: Text(
                    "Cancel",
                    style: theme.titleMedium?.copyWith(
                      color: colorTheme.black54,
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ),
    ),
  );
}
