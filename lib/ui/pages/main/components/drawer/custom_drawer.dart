import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: 350,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 20),
        children: [
          const SizedBox(height: 24),

          // 🔹 Profile Section
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
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
                        backgroundColor: Colors.grey[200],
                        valueColor:
                        const AlwaysStoppedAnimation(Colors.orange),
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
                    Text("Gree", style: context.textTheme.labelMedium),
                    Text(
                      "Update profile",
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Divider(color: Colors.black12),

          // 🔹 Job Actions
          _drawerItem(Icons.visibility, "Actively searching jobs", true),
          _drawerItem(Icons.search, "Search jobs"),
          _drawerItem(Icons.work_outline, "Recommended jobs"),
          _drawerItem(Icons.bookmark_border, "Saved jobs"),
          _drawerItem(Icons.bar_chart, "Profile performance"),

          const Divider(color: Colors.black12),

          // 🔹 Preferences & Help
          _drawerItem(Icons.remove_red_eye_outlined, "Display preferences"),
          _drawerItem(Icons.chat_outlined, "Chat for help", false, "New"),
          _drawerItem(Icons.settings, "Settings"),

          const Divider(color: Colors.black12),

          // 🔹 Paid Services
          _drawerItem(Icons.card_membership, "Jobseeker services", false, "Paid"),
          _drawerItem(Icons.workspace_premium, "DEI Pro", false, "Paid"),

          const Divider(color: Colors.black12),

          // 🔹 Info & Support
          _drawerItem(Icons.article_outlined, "DEi blog"),
          _drawerItem(Icons.help_outline, "How DEI works"),
          _drawerItem(Icons.mail_outline, "Write to us"),
          _drawerItem(Icons.info_outline, "About us"),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _drawerItem(
      IconData icon,
      String text, [
        bool bold = false,
        String? badge,
      ]) {
    final theme = Theme.of(navigatorKey.currentContext!);
    return ListTile(
      leading: Icon(icon, color: Colors.black87, size: 20),
      visualDensity: VisualDensity.compact,
      title: Row(
        children: [
          Text(
            text,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (badge != null) ...[
            const SizedBox(width: 6),
            Text(
              "($badge)",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: badge == "New" ? Colors.red : Colors.blueGrey,
                fontSize: 13,
              ),
            ),
          ],
        ],
      ),
      onTap: () {},
    );
  }
}

