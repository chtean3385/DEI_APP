import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/theme_controller.dart';
import '../../../repo/shared_preference_repository.dart';
import '../employee_settings/components/setting_section_title.dart';
import '../employee_settings/components/setting_section_togle.dart';
import 'font_size_setting_card.dart';

class AccessibilityBody extends ConsumerWidget {
  const AccessibilityBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accessibility = ref.watch(accessibilityProvider);
    final accController = ref.read(accessibilityProvider.notifier);

    final themeMode = ref.watch(themeNotifierProvider);
    final themeController = ref.read(themeNotifierProvider.notifier);



    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        children: [

          // -----------------------------------
          // APPEARANCE TITLE
          // -----------------------------------
          const SectionTitle("Appearance"),

          // -----------------------------------
          // THEME SWITCH
          // -----------------------------------
          SettingToggle(
            title: themeMode == ThemeMode.dark ? "Dark Mode" : "Light Mode",
            subtitle: "Switch between dark and light themes",
            value: themeMode == ThemeMode.dark,
            icon: themeMode == ThemeMode.dark
                ? Icons.dark_mode
                : Icons.light_mode,
            onChanged: (val) {
              themeController.state = val ? ThemeMode.dark : ThemeMode.light;
               SharedPreferenceRepository.setTheme(val?"dark":"light" );
            },
          ),

          // -----------------------------------
          // FONT SIZE
          // -----------------------------------
          SettingFontSize(
            fontSize: (accessibility.fontScale * 16).round(),
            onDecrease: accController.decreaseFont,
            onIncrease: accController.increaseFont,
          ),

          // Card(
          //   elevation: 2,
          //   color: Colors.white,
          //   shadowColor: AppColors.primaryColor,
          //   surfaceTintColor: AppColors.primaryColor,
          //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          //   child: ListTile(
          //     leading: Icon(Icons.format_size, color: AppColors.primaryColor),
          //     title: Text(
          //       "Font Size",
          //       style: context.textTheme.labelMedium?.copyWith(height: 2),
          //     ),
          //     subtitle: Text(
          //       "Adjust text size across the app",
          //       style: context.textTheme.bodyMedium?.copyWith(color: Colors.black54),
          //     ),
          //     trailing: Row(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         IconButton(
          //           icon: Icon(Icons.remove,color: Colors.black,),
          //           onPressed: accController.decreaseFont,
          //         ),
          //         Text( (accessibility.fontScale * 16).round().toString(),style: context.textTheme.bodyMedium,),
          //         IconButton(
          //           icon: Icon(Icons.add,color: Colors.black,),
          //           onPressed: accController.increaseFont,
          //
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          // Card(
          //   elevation: 2,
          //   color: Colors.white,
          //   shadowColor: AppColors.primaryColor,
          //   surfaceTintColor: AppColors.primaryColor,
          //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          //   child: ListTile(
          //     leading: Icon(Icons.color_lens, color: AppColors.primaryColor),
          //     title: Text(
          //       "Button Color",
          //       style: context.textTheme.labelMedium?.copyWith(height: 2),
          //     ),
          //     subtitle: Text(
          //       "Choose your preferred button color",
          //       style: context.textTheme.bodyMedium?.copyWith(color: Colors.black54),
          //     ),
          //     trailing: GestureDetector(
          //       onTap: () async {
          //         final selectedColor = await showDialog<Color>(
          //           context: context,
          //           builder: (_) => ButtonColorDialog(),
          //         );
          //         if (selectedColor != null) {
          //           settingsCtrl.setButtonColor(selectedColor);
          //         }
          //       },
          //       child: CircleAvatar(
          //         radius: 14,
          //         backgroundColor: settings.buttonColor,
          //       ),
          //     ),
          //   ),
          // ),





        ],
      ),
    );
  }

}
