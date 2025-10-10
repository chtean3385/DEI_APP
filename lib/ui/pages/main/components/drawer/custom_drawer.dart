import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../repo/shared_preference_repository.dart';
import '../../../../../utils/widget_utils.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color:AppColors.primaryColor,
        width: double.infinity,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 20),
          children: [

            // 🔹 Profile Section
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.transparent,
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(
                          value: 0.65,
                          strokeWidth: 5,
                          backgroundColor: Colors.grey,
                          valueColor:
                          const AlwaysStoppedAnimation(AppColors.bg),
                        ),
                      ),
                      const CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey,
                        child:
                        Icon(Icons.person, size: 30, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Gree", style: context.textTheme.labelMedium?.copyWith(color: Colors.white)),
                      Text(
                        "Update profile",
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.bg,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(color: Colors.black12),

            // 🔹 Job Actions
            // _drawerItem(Icons.visibility, "Actively searching jobs", true),
            // _drawerItem(Icons.search, "Search jobs"),
            // _drawerItem(Icons.work_outline, "Recommended jobs"),
            // _drawerItem(Icons.bookmark_border, "Saved jobs"),
            // _drawerItem(Icons.bar_chart, "Profile performance"),
            //
            // const Divider(color: Colors.black12),
            //
            // // 🔹 Preferences & Help
            // // _drawerItem(Icons.remove_red_eye_outlined, "Display preferences"),
            // _drawerItem(Icons.chat_outlined, "Chat for help", false, "New"),
            // _drawerItem(Icons.settings, "Settings"),
            //
            // const Divider(color: Colors.black12),
            //
            // // 🔹 Paid Services
            // _drawerItem(Icons.card_membership, "Jobseeker services", false, "Paid"),
            // _drawerItem(Icons.workspace_premium, "DEI Pro", false, "Paid"),
            //
            // const Divider(color: Colors.black12),

            // 🔹 Info & Support
            // _drawerItem(Icons.article_outlined, "DEi blog"),
            // _drawerItem(Icons.help_outline, "How DEI works"),
            // _drawerItem(Icons.mail_outline, "Write to us"),
            _drawerItem(Icons.woman_outlined, "Empower Women", false, // bold
                null,  // badge
                    () =>AppNavigator.loadEmpowerWomenScreen()),
            _drawerItem(Icons.man, "Men as Allies", false, // bold
                null,  // badge
                    () =>AppNavigator.loadMenAsAliasScreen()),
            _drawerItem(Icons.accessible_forward, "Not Defined by Disability", false,
                null,
                    () => AppNavigator.loadNotDefinedByDisabilityScreen()),
            _drawerItem(
              Icons.auto_awesome,
              "Gen Z",
              false,
              null,
                  () => AppNavigator.loadGenZScreen(),
            ),
            _drawerItem(
              Icons.military_tech,
              "Defense Veteran",
              false,
              null,
                  () => AppNavigator.loadVeteranScreen(),
            ),

            _drawerItem(Icons.info_outline, "About us", false, // bold
              null,  // badge
                  () =>AppNavigator.loadAboutUsScreen()),
            _drawerItem(
              Icons.logout,
              "Logout",
              false, // bold
              null,  // badge
                  () {
                logoutAlertBox();
              },
            ),


            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }


  Widget _drawerItem(
      IconData icon,
      String text, [
        bool bold = false,
        String? badge,
        VoidCallback? onTap, // ✅ added as optional positional param
      ]) {
    final theme = Theme.of(navigatorKey.currentContext!);
    return ListTile(
      leading: Icon(icon, color: Colors.white, size: 20),
      visualDensity: VisualDensity.compact,
      title: Row(
        children: [
          Text(
            text,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              color: Colors.white
            ),
          ),
          if (badge != null) ...[
            const SizedBox(width: 6),
            Text(
              "($badge)",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: badge == "New"
                    ? AppColors.primaryColor
                    : Colors.blueGrey,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
      onTap: onTap, // ✅ use it here
    );
  }


}

void logoutAlertBox() {
  WidgetUtils.showLogoutPopUp(
    navigatorKey.currentContext!,
    sBtnFunction: () => signOut(),
  );
}
Future<void> signOut() async {
  await SharedPreferenceRepository.setToken("");
  await SharedPreferenceRepository.setUserId("");
AppNavigator.loadSignInScreen();
}
