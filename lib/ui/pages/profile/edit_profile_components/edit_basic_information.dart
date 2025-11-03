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

class EditBasicInformation extends ConsumerWidget {
  const EditBasicInformation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editEmployeeProfileProvider);
    final controller = ref.read(editEmployeeProfileProvider.notifier);
    final Map<String, String> workStatusLabels = {
      'employed': 'Employed',
      'un-employed': 'Looking for a Job',
      'student': 'Student / Intern',
      'self-employed': 'Running Own Business',
    };

print("state.profileData?.workStatus -->> ${state.profileData?.workStatus}");
    return Form(
      key: controller.formKey,
      child: Card(
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ExpansionTile(
          initiallyExpanded: false,
          // collapsed by default
          title: Text(
            "Basic Information",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          visualDensity: VisualDensity.compact,

          iconColor: Colors.black54,
          collapsedIconColor: Colors.black54,
          childrenPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          children: [
            _profileImage(ref),
            gapH8(),
            // "Active • Employed",
            RichText(
              text: TextSpan(
                  text: "Active",
                  style: context.textTheme.labelMedium?.copyWith(
                    color: BootstrapColors.colors["green"] ??
                        AppColors.primaryColor,
                  ),
                  children: [
                    TextSpan(
                        text: ' • ',
                        style:  context.textTheme.labelMedium
                    ),
                    TextSpan(
                      text: '${workStatusLabels[state.profileData?.workStatus] ?? 'Select Status'}',
                      style: context.textTheme.labelMedium?.copyWith(
                        color:AppColors.primaryColor,
                      ),
                    ),
                  ]
              ),
            ),
            // Column(
            //   mainAxisSize: MainAxisSize.min,
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //
            //
            //
            //
            //     CustomThemeButton(
            //       onTap: () {
            //       },
            //
            //       padding:  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 10),
            //         child: Text(
            //           'Active',
            //           style: context.textTheme.labelMedium?.copyWith(
            //             color: Colors.white,
            //           ),
            //         ),
            //       ),
            //       radius: 30,
            //       color: BootstrapColors.colors["green"] ??
            //           AppColors.primaryColor,
            //       borderColor:  BootstrapColors.colors["green"] ??
            //           AppColors.primaryColor,
            //     ),
            //     const SizedBox(height: 8),
            //     CustomThemeButton(
            //       onTap: () {
            //       },
            //       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            //       child: Text(
            //         workStatusLabels[state.profileData?.workStatus] ?? 'Select Status',
            //         style: context.textTheme.labelMedium?.copyWith(
            //           color: AppColors.primaryColor,
            //         ),
            //       ),
            //       radius: 30,
            //       color: AppColors.bg,
            //       borderColor: AppColors.primaryColor,
            //     ),
            //   ],
            // ),
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
              controller: controller.mobileController,
              hint: AppStrings.mobile,
              label: AppStrings.mobile,
              autofillHints: [AutofillHints.telephoneNumber],
              textInputAction: TextInputAction.next,
              icon: Icons.phone_android,
              validator: AppValidators.phone,
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
              textCapitalization: TextCapitalization.words,
              minLines: 3,
            ),
          ],
        ),
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
