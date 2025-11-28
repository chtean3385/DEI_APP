import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void showPrivacyModeConfirmAlert({
  required BuildContext context,
  required String title,
  required String description,
  required IconData icon,
  required Color iconColor,
  required VoidCallback onConfirm,
}) {
  final theme = Theme.of(context).textTheme;
  final colorTheme = context.colors;

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) => Consumer(
        builder: (context, ref, _) {
          final loadingState = ref.watch(employeeSettingsProvider).updatePageState;
        return Dialog(
          backgroundColor: colorTheme.alertBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: iconColor, size: 48),

                const SizedBox(height: 18),

                Text(
                  title,
                  style: theme.headlineMedium,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 10),

                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: theme.bodyMedium,
                ),

                const SizedBox(height: 26),

                Row(
                  children: [
                    // CANCEL
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 48),
                          side: BorderSide(color: colorTheme.black26),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        child: Text(
                          "Cancel",
                          style: theme.titleMedium?.copyWith(
                            color: colorTheme.black87,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // CONFIRM
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorTheme.buttonPrimaryColor,
                          minimumSize: const Size(double.infinity, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (loadingState != PageState.loading) {
                            onConfirm();
                          }
                        },
                        child: loadingState == PageState.loading
                            ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator.adaptive(
                            strokeWidth: 2,
                            backgroundColor: Colors.transparent,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                            : Text(
                          "Confirm",
                          style: theme.titleMedium?.copyWith(color: Colors.white),
                        ),
                      )

                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }
    ),
  );
}

