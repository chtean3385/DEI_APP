import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/models/home/friendly_industries/friendly_industry_model.dart';
import 'package:dei_champions/models/profile/employee_user_model/employee_user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/app_strings.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/app_validators.dart';
import '../../../../models/home/job_category/job_category_model.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/form/transparant_drop_down.dart';
import '../../../../widgets/form/transparent_form_field.dart';
import '../../auth/common/select_city.dart';
import 'edit_profile_action_button.dart';

class EditProfessionalInformation extends ConsumerWidget {
  final bool isFromCommonEdit;
  const EditProfessionalInformation({super.key,this.isFromCommonEdit = true});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editEmployeeProfileProvider);
    final controller = ref.read(editEmployeeProfileProvider.notifier);
    final categoryState = ref.watch(jobCategoryProvider);
    final industryState = ref.watch(friendlyIndustryProvider);
    final colorTheme = context.colors;
    final hasError = state.sectionErrors?.containsKey("professional") ?? false;
    final departmentList = (industryState.data?.first.department ?? [])
      ..sort((a, b) => (a.name ?? "").compareTo(b.name ?? ""));

    final communityList = (categoryState.data?.categories ?? [])
      ..sort((a, b) => (a.title ?? "").compareTo(b.title ?? ""));



    return Card(
      elevation: 2,
      color: colorTheme.jobCardBgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),side: BorderSide(
        color: hasError ? Colors.red : colorTheme.themBasedWhite,
        width:  1,
      )),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          ExpansionTile(
            initiallyExpanded: isFromCommonEdit != true,
            title: Text(
              "Professional Information",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorTheme.black87,
              ),
            ),
            visualDensity: VisualDensity.compact,
            maintainState: true,
            iconColor: colorTheme.black54,
            collapsedIconColor: colorTheme.black54,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),side: BorderSide.none),
            trailing: isFromCommonEdit ? null : const SizedBox.shrink(),
            onExpansionChanged: isFromCommonEdit ? null : (_) {},
            childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
         children: [
           Form(
             key: controller.professionalFormKey,
             child:Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [

                 /// ------------------ TOTAL EXPERIENCE ------------------
                 TransparentDropdownField(
                   isRequired: true,
                   hint: "Select Experience",
                   label: "Total Work Experience",
                   icon: Icons.work_outline,
                   items: AppStrings.totalExperienceOptions.map((e) => e["label"]!).toList(),
                   value: getLabelFromValue(AppStrings.totalExperienceOptions, controller.totalWorkExpController.text),
                   validator: AppValidators.fieldEmpty("Total Work Experience"),
                   onChanged: (selectedLabel) {
                     final selectedValue = AppStrings.totalExperienceOptions.firstWhere(
                           (option) =>
                       option["label"]!.trim().toLowerCase() ==
                           selectedLabel?.trim().toLowerCase(),
                       orElse: () => {"value": ""},
                     )["value"]!;

                     controller.totalWorkExpController.text = selectedValue;

                     print("Selected Label: $selectedLabel");
                     print("Mapped Value: $selectedValue");
                   },

                 ),

                 gapH16(),

                 /// ------------------ NOTICE PERIOD ------------------
                 TransparentDropdownField(
                   isRequired: true,
                   hint: "Select Notice Period",
                   label: "Notice Period",
                   icon: Icons.timer_outlined,
                   items: AppStrings.noticePeriodOptions.map((e) => e["label"]!).toList(),
                   value: getLabelFromValue(AppStrings.noticePeriodOptions, controller.noticePeriodController.text),
                   validator: AppValidators.fieldEmpty("Notice Period"),
                   onChanged: (selectedLabel) {
                     final selectedValue = AppStrings.noticePeriodOptions.firstWhere(
                           (option) =>
                       option["label"]!.trim().toLowerCase() ==
                           selectedLabel?.trim().toLowerCase(),
                       orElse: () => {"value": ""},
                     )["value"]!;

                     controller.noticePeriodController.text = selectedValue;
                     print("selectedValueselectedValueselectedValue$selectedValue");
                     print("selectedValueselectedValueselectedValue${ controller.noticePeriodController.text}");
                   },
                 ),

                 gapH16(),

                 /// ------------------ DEPARTMENT ------------------
                 TransparentDropdownField(
                   isRequired: true,
                   hint: "Select department",
                   label: "Department",
                   icon: Icons.apartment_outlined,
                   items: departmentList.map((e) => e.name ?? "").toList(),
                   value: controller.departmentController.text.isNotEmpty
                       ? controller.departmentController.text
                       : null,
                   validator: AppValidators.fieldEmpty("Department"),
                   onChanged: (value) {
                     if (value == null) return;

                     final selectedDept = departmentList.firstWhere(
                           (d) =>
                       (d.name ?? "").trim().toLowerCase() ==
                           value.trim().toLowerCase(),
                       orElse: () => IndustryDepartmentModel(),
                     );


                     // Prevent crash
                     if (selectedDept.id?.isEmpty == true) return;

                     controller.departmentId = selectedDept.id;
                     controller.departmentController.text = selectedDept.name ?? "";

                     print("controller.departmentId ${controller.departmentId}");
                     print("controller.departmentController.text ${ controller.departmentController.text}");
                   },
                 ),

                 gapH16(),


                 /// ------------------ COMMUNITY PREFERENCE ------------------
                 TransparentDropdownField(
                   isRequired: true,
                   hint: "Select community",
                   label: "Which Community you preferred",
                   icon: Icons.people_outline,
                   items: communityList.map((e) => e.title ?? "").toList(),
                   value: controller.communityController.text.isNotEmpty
                       ? controller.communityController.text
                       : null,
                   validator: AppValidators.fieldEmpty("Community"),
                   onChanged: (value) {
                     if (value == null) return;

                     final selectedComm = communityList.firstWhere(
                           (c) =>
                       (c.title ?? "").trim().toLowerCase() ==
                           value.trim().toLowerCase(),
                       orElse: () => JobCategoryMode(),
                     );


                     if (selectedComm.id?.isEmpty == true) return;

                     controller.communityId = selectedComm.id;
                     controller.communityController.text = selectedComm.title ?? "";
                     print("controller.communityId ${controller.communityId}");
                     print("controller.communityController.text ${ controller.communityController.text}");
                   },
                 ),

                 gapH16(),


                 /// ------------------ CURRENT SALARY ------------------
                 TransparentFormField(
                   controller: controller.currentCtcController,
                   hint: "Enter your current salary EX.10LPA",
                   label: "Current Annual Salary (optional)",
                   icon: Icons.currency_rupee_outlined,
                   keyboardType: TextInputType.text,
                   textInputAction: TextInputAction.next,
                 ),
                 gapH16(),

                 if (isFromCommonEdit != true)
                   Padding(
                     padding: const EdgeInsets.only(top: 20),
                     child: EditProfileActionButtons(
                       isFromCommonEdit: isFromCommonEdit,
                     ),
                   ),
               ],
             )

           )
         ],
          ),
          if (hasError) Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              controller.sectionErrors["professional"] ?? '',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
String getLabelFromValue(List<Map<String, String>> options, String value) {
  return options.firstWhere(
        (option) => option["value"] == value,
    orElse: () => {"label": ""}, // fallback
  )["label"]!;
}
String? getLabelById(List list, String id) {
  final match = list.firstWhere((e) => e.id == id, orElse: () => null);
  return match?.name;
}
