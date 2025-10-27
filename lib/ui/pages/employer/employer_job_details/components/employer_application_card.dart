import 'package:dei_champions/main.dart';
import 'package:dei_champions/models/employer/application_model.dart';
import 'package:dei_champions/widgets/others/custom_decorated_box.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../constants/app_styles.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_navigator.dart';
import '../../../../../widgets/others/custom_theme_button.dart';
import '../../../../../widgets/others/rounded_network_image.dart';

class EmployerApplicationCard extends StatelessWidget {
  final ApplicationModel item;

  const EmployerApplicationCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(6),
          bottomLeft: Radius.circular(6),
          bottomRight: Radius.circular(16),
        ),
        side: BorderSide(color: Colors.black12, width: 1),
      ),
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                RoundedNetworkImage(
                  imageUrl: item.profileImage ?? "",
                  width: 50,
                  height: 50,
                  borderRadius: 25,
                ),
                gapW16(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.userName ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: theme.labelMedium?.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Text(
                        item.userType ?? "",
                        style: theme.bodyMedium?.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                gapW8(),
                _buildStatusButton(item.applicationStatus ?? ""),


              ],
            ),


            const SizedBox(height: 6),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 20,
                        color: Colors.black54,
                      ),
                      SizedBox(width: 4),
                      Text(
                        item.location ?? "",
                        style: theme.bodyMedium?.copyWith(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                CustomDecoratedBox(
                  color: AppColors.bg,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.calendar_month, size: 20, color: Colors.black54),
                      gapW4(),
                      Text(
                        "Applied on:  ${DateFormat(
                          'MM/dd/yyyy',
                        ).format(item.appliedOn ?? DateTime.now()).toString()}",
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: theme.displaySmall?.copyWith(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 5),
                    Text(
                      "Status : ",
                      style: theme.bodyMedium?.copyWith(color: Colors.black54),
                    ),
                    SizedBox(width: 6),
                    Text(
                      item.isActive == true ? "Active":"In Active",
                      style: theme.bodyMedium?.copyWith(color: item.isActive == true ? Colors.green :  Colors.black54,fontWeight: FontWeight.w600),
                    ),
                  ],
                ),

              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomThemeButton(
                  child: Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        size: 15,
                        color: Colors.black,
                      ),
                      gapW4(),
                      Text(
                        "View",
                        style: navigatorKey
                            .currentContext!
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  color: AppColors.bg,
                  borderColor: AppColors.bg,
                  radius: 8,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                    onTap: ()=>AppNavigator.loadCandidateProfileDetailsScreen()
                ),
                gapW8(),
                CustomThemeButton(
                  child: Row(
                    children: [
                      Icon(
                        Icons.message_outlined,
                        size: 14,
                        color: Colors.black,
                      ),
                      gapW4(),
                      Text(
                        "Message",
                        style: navigatorKey
                            .currentContext!
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  color: AppColors.bg,
                  borderColor: AppColors.bg,
                  radius: 8,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  onTap: (){},
                ),
                gapW8(),
                CustomThemeButton(
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline_sharp,
                        size: 15,
                        color: Colors.black,
                      ),
                      gapW4(),
                      Text(
                        "Accept",
                        style: navigatorKey
                            .currentContext!
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  color: AppColors.bg,
                  borderColor:AppColors.bg,
                  radius: 8,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  onTap: (){},
                ),
                gapW8(),
                CustomThemeButton(
                  child: Row(
                    children: [
                      Icon(
                        Icons.cancel_outlined,
                        size: 15,
                        color: Colors.black,
                      ),
                      gapW4(),
                      Text(
                        "Reject",
                        style: navigatorKey
                            .currentContext!
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  color: AppColors.bg,
                  borderColor:AppColors.bg,
                  radius: 8,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  onTap: (){},
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusButton(String status) {
    late Color buttonColor;
    late String buttonText;

    switch (status.toLowerCase()) {
      case "new":
        buttonText = "New";
        buttonColor = BootstrapColors.colors["yellow"]!;
        break;

      case "reviewed":
        buttonText = "Reviewed";
        buttonColor = BootstrapColors.colors["teal"]!;
        break;

      case "interview":
        buttonText = "Interview";
        buttonColor = BootstrapColors.colors["primary"]!;
        break;

      case "rejected":
        buttonText = "Rejected";
        buttonColor = BootstrapColors.colors["danger"]!;
        break;

      case "accepted":
        buttonText = "Hired";
        buttonColor = BootstrapColors.colors["success"]!;
        break;

    }

    return CustomThemeButton(
      onTap: () {}, // Non-clickable
      color: buttonColor.withValues(alpha: 0.1),
      borderColor: buttonColor.withValues(alpha: 0.1),
      radius: 30,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Text(
        buttonText,
        style: navigatorKey.currentContext!.textTheme.displaySmall?.copyWith(
          color: buttonColor,
        ),
      ),
    );
  }


}
