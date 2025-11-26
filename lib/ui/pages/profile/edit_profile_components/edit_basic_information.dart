import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_strings.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/app_validators.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/form/transparant_date_picker.dart';
import '../../../../widgets/form/transparant_drop_down.dart';
import '../../../../widgets/form/transparent_form_field.dart';
import '../../../../widgets/pickers/profile_pic_edit_widget.dart';
import 'edit_profile_action_button.dart';

class EditBasicInformation extends ConsumerWidget {
  final bool isFromCommonEdit;
  const EditBasicInformation({super.key,this.isFromCommonEdit = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editEmployeeProfileProvider);
    final controller = ref.read(editEmployeeProfileProvider.notifier);
    final colorTheme = context.colors;
    final hasError = controller.sectionErrors.containsKey("basic");

    final Map<String, String> workStatusLabels = {
      'employed': 'Employed',
      'un-employed': 'Looking for a Job',
      'student': 'Student / Intern',
      'self-employed': 'Running Own Business',
    };
    return Card(
      elevation: 2,
      color: colorTheme.jobCardBgColor,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),side: BorderSide(
          color: hasError ? Colors.red : colorTheme.themBasedWhite,
          width:  1,
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpansionTile(
            initiallyExpanded: isFromCommonEdit != true,
              maintainState: true,
            // collapsed by default
            title: Text(
              "Basic Information",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorTheme.black87,
              ),
            ),
            visualDensity: VisualDensity.compact,

            iconColor: colorTheme.black54,
            collapsedIconColor: colorTheme.black54,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),side: BorderSide.none),
            trailing: isFromCommonEdit ? null : const SizedBox.shrink(),
            onExpansionChanged: isFromCommonEdit ? null : (_) {},
            childrenPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            children: [
              Form(
                key: controller.basicInfoFormKey,
                child: Column(
                  children:  [
                    _profileImage(ref),
                    gapH8(),
                    // "Active • Employed",
                    RichText(
                      text: TextSpan(
                          text: "Active",
                          style: context.textTheme.labelMedium?.copyWith(
                            color: BootstrapColors.colors["green"] ??
                                colorTheme.buttonPrimaryColor,
                          ),
                          children: [
                            TextSpan(
                                text: ' • ',
                                style:  context.textTheme.labelMedium
                            ),
                            TextSpan(
                              text: '${workStatusLabels[state.profileData?.workStatus] ?? 'Select Status'}',
                              style: context.textTheme.labelMedium?.copyWith(
                                color:colorTheme.buttonPrimaryColor,
                              ),
                            ),
                          ]
                      ),
                    ),
                    gapH16(),
                    TransparentFormField(
                      isRequired: true,
                      controller: controller.nameController,
                      hint: AppStrings.name,
                      label: AppStrings.name,
                      icon: Icons.person_outline,
                      textInputAction: TextInputAction.next,
                      validator: AppValidators.fieldEmpty(AppStrings.name),
                      textCapitalization: TextCapitalization.words,
                    ),
                    gapH16(),
                    TransparentFormField(
                      isRequired: true,
                      controller: controller.emailController,
                      hint: AppStrings.email,
                      label: AppStrings.email,
                      icon: Icons.email_outlined,
                      readOnly: true,
                      fillColor: Colors.black12,
                    ),
                    gapH16(),
                    TransparentFormField(
                      isRequired: true,
                      readOnly: true,
                      fillColor: Colors.black12,
                      controller: controller.mobileController,
                      hint: AppStrings.mobile,
                      label: AppStrings.mobile,
                      textInputAction: TextInputAction.next,
                      icon: Icons.phone_android,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                    ),
                    gapH16(),
                    TransparentDatePickerField(
                      label: "Date of Birth",
                      hint: "Select your date of birth",
                      icon: Icons.calendar_today_outlined,
                      controller: controller.dobController,
                      initialDate: DateTime.now(),
                    ),
                    gapH16(),
                    TransparentDropdownField(
                      label: "Gender",
                      hint: "Select your gender",
                      icon: Icons.person_outline,
                      items: ["male", "female", "other", "prefer not to say"],
                      value: state.profileData?.gender,
                      onChanged: (value) {
                        controller.updateGender(value.toString());
                      },
                    ),
                    gapH16(),
                    TransparentDropdownField(
                      isRequired: true,
                      label: "Work Status",
                      hint: "Select your current work status",
                      icon: Icons.work_outline,
                      items: ["student", "employed", "un-employed", "self-employed"],
                      value: state.profileData?.workStatus,
                      validator: AppValidators.fieldEmpty("Work Status"),
                      onChanged: (value) {
                        controller.updateWorkStatus(value.toString());
                      },
                    ),
                    gapH16(),
                    TransparentFormField(
                      isRequired: true,
                      controller: controller.descriptionController,
                      hint: "short description",
                      label: "Description",
                      textInputAction: TextInputAction.next,
                      validator: AppValidators.fieldEmpty("Description"),
                      textCapitalization: TextCapitalization.sentences,
                      minLines: 3,
                    ),
                    gapH16(),
                    if (isFromCommonEdit != true)
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: EditProfileActionButtons(
                          isEmployee: true,
                          isFromCommonEdit: isFromCommonEdit,
                        ),
                      ),
                  ],
                ),
              ),
            ]
          ),
          if (hasError) Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              controller.sectionErrors["basic"] ?? '',
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


  /// Profile image widget that listens to state changes
  Widget _profileImage(WidgetRef ref) {
    final state = ref.watch(editEmployeeProfileProvider);
    final controller = ref.read(editEmployeeProfileProvider.notifier);
    return ImageViewPicker(
      formKey: GlobalKey(),
      imageUrl: state.profileData?.profilePhotoUrl,
      imageFile: state.profileFile,
      height: 100,
      width: 100,
      radius: 50,
      editAction: () async {
        await controller.pickProfileImage();
      },
    );
  }
}
