import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';



void showAccountActionSheet({
  required BuildContext context,
  required String title,
  required List<String> points,
  required VoidCallback onConfirm,
}) {
  final colorTheme = context.colors;
  final theme = context.textTheme;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: colorTheme.commonDividerBgColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
    ),
    builder: (context) {
      // ✅ Create the list here (not inside builder)
      List<bool> checked = List.filled(points.length, false);

      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 45,
                    height: 5,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: colorTheme.black26,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                Text(title,
                    style: theme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    )),

                const SizedBox(height: 20),

                Text("I understand that",
                    style: theme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    )),

                const SizedBox(height: 12),

                ...List.generate(points.length, (i) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        Theme(
                          data: Theme.of(context).copyWith(
                            checkboxTheme: CheckboxThemeData(
                              side:  BorderSide(color: colorTheme.themBasedBlack, width: 1.5), // always white border
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            unselectedWidgetColor: colorTheme.themBasedBlack, // dot/tick color before selecting
                          ),
                          child: Checkbox(
                            value: checked[i],
                            checkColor: Colors.white, // tick color
                            activeColor: colorTheme.buttonPrimaryColor, // checkbox fill color when checked
                            onChanged: (val) {
                              setState(() {
                                checked[i] = val ?? false;
                              });
                            },
                          ),
                        ),

                        Expanded(
                          child: Text(points[i], style: theme.bodyMedium),
                        ),
                      ],
                    ),
                  );
                }),

                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: checked.every((e) => e) ? onConfirm : null, // 🔥 Enable only when all checked
                    style: ElevatedButton.styleFrom(
                      backgroundColor: checked.every((e) => e)
                          ? colorTheme.buttonPrimaryColor
                          : colorTheme.black26, // disabled color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      "Confirm",
                      style: theme.titleMedium?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

