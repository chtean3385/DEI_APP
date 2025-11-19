import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/ui/pages/employee_settings/settings_view.dart';
import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/theme_controller.dart';

class EmployeeSettingsScreen extends StatelessWidget {
  const EmployeeSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(title: 'Settings',titleStyleSmall: true),
      body: const SettingsBody(),
    );
  }
}

// class SettingsBody extends ConsumerStatefulWidget {
//   const SettingsBody({super.key});
//
//   @override
//   ConsumerState<SettingsBody> createState() => _SettingsBodyState();
// }
//
// class _SettingsBodyState extends ConsumerState<SettingsBody> {
//   bool notifications = true;
//   bool onlineStatus = true;
//   bool emailAlert = false;
//   bool smsAlert = false;
//   // Appearance settings
//   bool isDarkMode = false;
//   int fontSize = 16;
//   Color primaryButtonColor = Colors.blue;
//
//
//   Widget _buildToggle({
//     required String title,
//     required String subtitle,
//     required bool value,
//     required Function(bool) onChanged,
//     IconData? icon,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Card(
//         elevation: 2,
//         color: Colors.white,
//         shadowColor: AppColors.primaryColor,
//         surfaceTintColor: AppColors.primaryColor,
//         clipBehavior: Clip.antiAlias,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         child: ListTile(
//           leading: Icon(icon, color: AppColors.primaryColor,size: 25,),
//           title: Text(title, style:  context.textTheme.labelMedium?.copyWith(height: 2)),
//           subtitle: Text(subtitle, style: context.textTheme.bodyMedium?.copyWith(color: Colors.black54,height: 1.2)),
//           trailing: Switch(
//             value: value,
//             onChanged: onChanged,
//             activeThumbColor: AppColors.primaryColor,
//             inactiveTrackColor: Colors.grey,
//             padding: EdgeInsets.zero,
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final accessibility = ref.watch(accessibilityProvider);
//     final controller = ref.read(accessibilityProvider.notifier);
//
//     final themeMode = ref.watch(themeNotifierProvider);
//     final themeController = ref.read(themeNotifierProvider.notifier);
//
//     return ListView(
//       padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           child: Text(
//             "Appearance",
//             style: context.textTheme.labelMedium?.copyWith(color: Colors.grey),
//           ),
//         ),
//
// // Dark Mode Toggle
//         _buildToggle(
//           title:  themeMode == ThemeMode.dark ? "Dark Mode" : "Light Mode",
//           subtitle: "Switch between dark and light themes",
//           value: themeMode == ThemeMode.dark,
//           onChanged: (val) {
//             themeController.state = val ? ThemeMode.dark : ThemeMode.light;
//           },
//           icon: themeMode == ThemeMode.dark ? Icons.dark_mode :Icons.light_mode ,
//         ),
//
// // Font Size Setting
//         Card(
//           elevation: 2,
//           color: Colors.white,
//           shadowColor: AppColors.primaryColor,
//           surfaceTintColor: AppColors.primaryColor,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//           child: ListTile(
//             leading: Icon(Icons.format_size, color: AppColors.primaryColor),
//             title: Text(
//               "Font Size",
//               style: context.textTheme.labelMedium?.copyWith(height: 2),
//             ),
//             subtitle: Text(
//               "Adjust text size across the app",
//               style: context.textTheme.bodyMedium?.copyWith(color: Colors.black54),
//             ),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.remove,color: Colors.black,),
//                   onPressed: controller.decreaseFont,
//                 ),
//                 Text(fontSize.toString(),style: context.textTheme.bodyMedium,),
//                 IconButton(
//                   icon: Icon(Icons.add,color: Colors.black,),
//                   onPressed: controller.increaseFont,
//
//                 ),
//               ],
//             ),
//           ),
//         ),
//
//
// // Button Color Picker
//         Card(
//           elevation: 2,
//           color: Colors.white,
//           shadowColor: AppColors.primaryColor,
//           surfaceTintColor: AppColors.primaryColor,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//           child: ListTile(
//             leading: Icon(Icons.color_lens, color: AppColors.primaryColor),
//             title: Text(
//               "Button Color",
//               style: context.textTheme.labelMedium?.copyWith(height: 2),
//             ),
//             subtitle: Text(
//               "Choose your preferred button color",
//               style: context.textTheme.bodyMedium?.copyWith(color: Colors.black54),
//             ),
//             trailing: GestureDetector(
//               onTap: () async {
//                 Color? selectedColor = await showDialog(
//                   context: context,
//                   builder: (_) => AlertDialog(
//                     title: Text("Pick Button Color"),
//                     content: Wrap(
//                       spacing: 10,
//                       children: [
//                         _colorCircle(Colors.blue, () {
//                           Navigator.pop(context, Colors.blue);
//                         }),
//                         _colorCircle(Colors.red, () {
//                           Navigator.pop(context, Colors.red);
//                         }),
//                         _colorCircle(Colors.green, () {
//                           Navigator.pop(context, Colors.green);
//                         }),
//                         _colorCircle(Colors.orange, () {
//                           Navigator.pop(context, Colors.orange);
//                         }),
//                       ],
//                     ),
//                   ),
//                 );
//
//                 if (selectedColor != null) {
//                   setState(() => primaryButtonColor = selectedColor);
//                 }
//               },
//               child: CircleAvatar(
//                 radius: 14,
//                 backgroundColor: primaryButtonColor,
//               ),
//             ),
//           ),
//         ),
//
//
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           child: Text(
//             "Alerts",
//             style: context.textTheme.labelMedium?.copyWith(color: Colors.grey),
//           ),
//         ),
//         _buildToggle(
//           title: "App Notifications",
//           subtitle: "Receive updates about new jobs and messages",
//           value: notifications,
//           onChanged: (val) => setState(() => notifications = val),
//           icon: Icons.notifications_active_outlined,
//         ),
//         _buildToggle(
//           title: "Email Alerts",
//           subtitle: "Get job recommendations and updates via email",
//           value: emailAlert,
//           onChanged: (val) => setState(() => emailAlert = val),
//           icon: Icons.email_outlined,
//         ),
//         _buildToggle(
//           title: "SMS Alerts",
//           subtitle: "Receive important alerts through SMS",
//           value: smsAlert,
//           onChanged: (val) => setState(() => smsAlert = val),
//           icon: Icons.sms_outlined,
//         ),
//       ],
//     );
//   }
// }
// Widget _colorCircle(Color color, VoidCallback onTap) {
//   return GestureDetector(
//     onTap: onTap,
//     child: CircleAvatar(
//       radius: 18,
//       backgroundColor: color,
//     ),
//   );
// }
