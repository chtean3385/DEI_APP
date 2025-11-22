import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/widgets/others/custom_theme_button.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/app_validators.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/form/transparant_date_picker.dart';
import '../../../../widgets/form/transparant_drop_down.dart';
import '../../../../widgets/form/transparent_form_field.dart';
import '../../../../widgets/others/check_box.dart';
import 'edit_profile_action_button.dart';

class EditWorkExpInformation extends ConsumerWidget {
  final bool isFromCommonEdit;
  const EditWorkExpInformation({super.key,this.isFromCommonEdit = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(editEmployeeProfileProvider.notifier);
    final state = ref.watch(editEmployeeProfileProvider);
    final colorTheme = context.colors;

    return Card(
      elevation: 2,
      color: colorTheme.jobCardBgColor,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),side: BorderSide(color: colorTheme.themBasedWhite)),
      child: ExpansionTile(
        initiallyExpanded: isFromCommonEdit!= true,
        title: Text(
          "Work Experience",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorTheme.black87,
          ),
        ),
        visualDensity: VisualDensity.compact,
        iconColor: colorTheme.black54,
        collapsedIconColor: colorTheme.black54,
        trailing: isFromCommonEdit ? null : const SizedBox.shrink(),
        onExpansionChanged: isFromCommonEdit ? null : (_) {},
        childrenPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        children: [
          ...state.workExpEntries!.asMap().entries.map((entry) {
            final index = entry.key;
            final workExp = entry.value;
            return _item(
              workExp.companyController,
              workExp.positionController,
              workExp.startDateController,
              workExp.endDateController,
              workExp.descriptionController,
                  () => controller.removeWorkExpEntry(index),
                state.positions?.map((e) => e.name).toList() ?? [],

            );
          }).toList(),
          gapH16(),
          CustomThemeButton(
            isExpanded: false,
            color: colorTheme.buttonPrimaryColor,
            radius: 8,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.add, color: Colors.white, size: 20),
                const SizedBox(width: 4),
                Text(
                  "Add Experience",
                  style: context.textTheme.displaySmall?.copyWith(
                    color: Colors.white
                  ),
                ),
              ],
            ),
            onTap: () => controller.addWorkExpEntry(context),
          ),
          gapH16(),
          if(isFromCommonEdit!= true)  Padding(
            padding: const EdgeInsets.only(top: 20),
            child: EditProfileActionButtons(isEmployee: true,isFromCommonEdit: isFromCommonEdit),
          )
        ],
      ),
    );
  }

  // Widget _item(
  //     TextEditingController companyCtr,
  //     TextEditingController positionCtr,
  //     TextEditingController startCtr,
  //     TextEditingController endCtr,
  //     TextEditingController descCtr,
  //     VoidCallback onRemove,
  //     ) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 8),
  //     child: Card(
  //       elevation: 2,
  //       color: AppColors.bg,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //       child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             TransparentFormField(
  //               controller: companyCtr,
  //               isRequired: true,
  //               hint: "Enter company name",
  //               label: "Company",
  //               icon: Icons.business_outlined,
  //               textInputAction: TextInputAction.next,
  //               validator: AppValidators.fieldEmpty("Company"),
  //               textCapitalization: TextCapitalization.words,
  //             ),
  //             gapH16(),
  //             TransparentFormField(
  //               controller: positionCtr,
  //               isRequired: true,
  //               hint: "Enter position",
  //               label: "Position",
  //               icon: Icons.badge_outlined,
  //               textInputAction: TextInputAction.next,
  //               validator: AppValidators.fieldEmpty("Position"),
  //               textCapitalization: TextCapitalization.words,
  //             ),
  //             gapH16(),
  //             TransparentDatePickerField(
  //               hint: "Start Date",
  //               label: "Start Date",
  //               isRequired: true,
  //               icon: Icons.calendar_today_outlined,
  //               controller: startCtr,
  //               initialDate: DateTime.now(),
  //               validator: AppValidators.fieldEmpty("Start Date"),
  //             ),
  //             gapH16(),
  //             TransparentDatePickerField(
  //               hint: "End Date",
  //               label: "End Date",
  //               isRequired: true,
  //               icon: Icons.calendar_today_outlined,
  //               controller: endCtr,
  //               initialDate: DateTime.now(),
  //               validator: AppValidators.fieldEmpty("End Date"),
  //             ),
  //             CustomCheckbox(
  //               label: "I currently work here",
  //               initialValue: false,
  //               onChanged: (label, isSelected) {
  //                 print("$label changed to $isSelected");
  //                 // controller.toggleRememberMe(isSelected);
  //               },
  //             ),
  //
  //             gapH16(),
  //             TransparentFormField(
  //               controller: descCtr,
  //               hint: "short description",
  //               label: "Description",
  //               textInputAction: TextInputAction.next,
  //               validator: AppValidators.fieldEmpty("Description"),
  //               textCapitalization: TextCapitalization.words,
  //               minLines: 3,
  //             ),
  //             gapH16(),
  //             Align(
  //               alignment: Alignment.centerRight,
  //               child: TextButton.icon(
  //                 onPressed: onRemove,
  //                 icon: const Icon(Icons.delete_forever, color: Colors.red),
  //                 label: const Text(
  //                   "Delete",
  //                   style: TextStyle(color: Colors.red),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  Widget _item(
      TextEditingController companyCtr,
      TextEditingController positionCtr,
      TextEditingController startCtr,
      TextEditingController endCtr,
      TextEditingController descCtr,
      VoidCallback onRemove,
      List<String> positionList,
      ) {
    final ValueNotifier<bool> isCurrentlyWorking = ValueNotifier(false);
    final colorTheme = navigatorKey.currentContext!.colors;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
        elevation: 2,
        color: colorTheme.cardBgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ValueListenableBuilder<bool>(
            valueListenable: isCurrentlyWorking,
            builder: (context, currentlyWorking, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TransparentFormField(
                    controller: companyCtr,
                    isRequired: true,
                    hint: "Enter company name",
                    label: "Company",
                    icon: Icons.business_outlined,
                    textInputAction: TextInputAction.next,
                    validator: AppValidators.fieldEmpty("Company"),
                    textCapitalization: TextCapitalization.words,
                  ),
                  gapH16(),
                  TransparentDropdownField(
                    isRequired: true,
                    label: "Position",
                    hint: "Select your position",
                    icon: Icons.badge_outlined,
                    items: positionList,
                    value: positionCtr.text,
                    validator: AppValidators.fieldEmpty("Position"),
                    onChanged: (value) {
                      positionCtr.text = value ?? "";
                    },
                  ),
                  gapH16(),
                  TransparentDatePickerField(
                    hint: "Start Date",
                    label: "Start Date",
                    isRequired: true,
                    icon: Icons.calendar_today_outlined,
                    controller: startCtr,
                    initialDate: DateTime.now(),
                    validator: AppValidators.fieldEmpty("Start Date"),
                  ),
                  gapH16(),
                  TransparentDatePickerField(
                    hint: "End Date",
                    label: "End Date",
                    isRequired: !currentlyWorking,
                    icon: Icons.calendar_today_outlined,
                    controller: endCtr,
                    initialDate: DateTime.now(),
                    validator: currentlyWorking
                        ? null
                        : AppValidators.fieldEmpty("End Date"),
                    enabled: !currentlyWorking,
                  ),
                  CustomCheckbox(
                    label: "I currently work here",
                    initialValue: currentlyWorking,
                    onChanged: (label, isSelected) {
                      isCurrentlyWorking.value = isSelected;

                      if (isSelected) {
                        final now = DateTime.now();
                        final formattedDate =
                            "${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year}";
                        endCtr.text = formattedDate;
                      } else {

                        endCtr.clear();
                      }
                    },
                  ),

                  gapH16(),
                  TransparentFormField(
                    controller: descCtr,
                    hint: "Short description",
                    label: "Description",
                    textInputAction: TextInputAction.next,
                    // validator: AppValidators.fieldEmpty("Description"),
                    textCapitalization: TextCapitalization.sentences,
                    minLines: 3,
                  ),
                  gapH16(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: onRemove,
                      icon: const Icon(Icons.delete_forever, color: Colors.red),
                      label: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

}

class WorkExperienceEntryControllers {
  final TextEditingController companyController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void dispose() {
    companyController.dispose();
    positionController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    descriptionController.dispose();
  }
}
