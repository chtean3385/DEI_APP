import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../main.dart';
import '../../../../../models/profile/profile_completion/profile_completion_model.dart';

void showProfileAlert(BuildContext context,List<MissingField>? missingFields) {
  final theme =Theme.of(context).textTheme;
  final List<String> labels = missingFields
      ?.map((e) => e.displayName ?? "")
      .where((e) => e.isNotEmpty)
      .toList()
      ?? [];

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
            Icon(
              Icons.info_outline,
              color: Colors.orange,
              size: 50,
            ),
            const SizedBox(height: 16),

            Text(
              "Complete Your Profile",
              style: theme.headlineMedium,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            Text(
              "Complete your profile to increase your chances of getting hired",
              textAlign: TextAlign.center,
              style: theme.bodyMedium,
            ),

            const SizedBox(height: 24),


            skillsRow(labels),
            const SizedBox(height: 24),
            Text(
              "Add the above information to make your profile stand out",
              textAlign: TextAlign.center,
              style: theme.displaySmall,
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:AppColors.primaryColor,
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                AppNavigator.loadEditProfileScreen();
              },
              child:  Text(
                "Okay",
                style: theme.titleMedium?.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    ),
  );




}
Widget skillsRow(List<String>? skills) {
  if (skills == null || skills.isEmpty) return const SizedBox.shrink();

  return Wrap(
    spacing: 8, // horizontal space between chips
    runSpacing: 8, // vertical space between rows
    crossAxisAlignment: WrapCrossAlignment.center,
    alignment: WrapAlignment.center,

    children: skills.map((s) => tagChip(s)).toList(),
  );
}
Widget tagChip(String tag) {
  return // Tag chip
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.bg2,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        tag,
        maxLines: 1,overflow: TextOverflow.ellipsis,softWrap: true,textAlign: TextAlign.center,
        style: navigatorKey.currentContext!.textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.w400,fontSize: 10,
          color: Colors.black54,
        ),
      ),
    );
}