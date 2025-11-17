import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/main.dart';
import 'package:flutter/material.dart';


void showJobStatusUpdateAlert({
  required String jobTitle,
  required String oldStatus,
  required String newStatus,
}) {
  final context = navigatorKey.currentContext;
  if (context == null) return;

  final theme = Theme.of(context).textTheme;

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) => Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            // Icon
            const Icon(
              Icons.notifications_active_outlined,
              color: Colors.orange,
              size: 50,
            ),

            const SizedBox(height: 16),

            // Title
            Text(
              "Job Status Updated",
              style: theme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            // Description
            Text(
              "Your application status has changed for:",
              textAlign: TextAlign.center,
              style: theme.bodyMedium,
            ),

            const SizedBox(height: 8),

            // Job Title
            Text(
              jobTitle,
              textAlign: TextAlign.center,
              style: theme.titleLarge?.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 20),

            // Status Old -> New
            buildStatusChangeBox(oldStatus, newStatus, theme),


            const SizedBox(height: 24),

            // OK Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "OK",
                style: theme.titleMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
Widget buildStatusChangeBox(String oldStatus, String newStatus, TextTheme theme) {
  // Normalize
  final s = newStatus.toLowerCase().trim();

  // Colors for new status
  late final Color color;

  switch (s) {
    case "pending":
      color = Colors.orange;
      break;

    case "accepted":
      color = Colors.green;
      break;

    case "rejected":
      color = Colors.red;
      break;

    case "interviewing":
      color = Colors.blue;
      break;

    case "negotiation":
      color = Colors.purple;
      break;

    case "hired":
      color = Colors.teal;
      break;

    default:
      color = Colors.grey;
  }

  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    decoration: BoxDecoration(
      color: color.withOpacity(0.3),   // background color with 30% opacity
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      "$oldStatus → $newStatus",
      style: theme.titleMedium?.copyWith(
        color: color,                  // full color for text
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
