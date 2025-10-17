import 'package:dei_champions/main.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_strings.dart';
import '../../../../../constants/app_styles.dart';
import '../../../../../constants/app_validators.dart';
import '../../../../../providers/providers.dart';
import '../../../../../widgets/form/transparant_date_picker.dart';
import '../../../../../widgets/form/transparent_form_field.dart';
import '../../../../../widgets/others/custom_theme_button.dart';
import '../../../../../widgets/pickers/profile_pic_edit_widget.dart';
import '../../../auth/signup_employer/widgets/company_employee_size.dart';

class EditEmployerBasicInformation extends ConsumerWidget {
  const EditEmployerBasicInformation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editEmployerProfileProvider);
    final controller = ref.read(editEmployerProfileProvider.notifier);

    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ExpansionTile(
        initiallyExpanded: false, // collapsed by default
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
        childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          _profileImage(ref),
          gapH16(),
          CustomThemeButton(
            color:BootstrapColors.colors["yellow"] ??
                AppColors.primaryColor,
            borderColor:BootstrapColors.colors["yellow"] ??
                AppColors.primaryColor,
            radius: 30,
            isExpanded: false,
            alignRight: false,
            padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
            onTap: () {
            },
            child: Text(
              "Unverified",
              style: context.textTheme.labelMedium?.copyWith(
                color: Colors.black,
              ),
            ),
          ),
          gapH16(),
          CustomThemeButton(
            color:
                AppColors.bg,
            borderColor:
                AppColors.bg,
            radius: 30,
            isExpanded: false,
            alignRight: false,
            padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
            onTap: () {
            },
            child: Text(
              "Member Since: 01/02/2000",
              style: context.textTheme.labelMedium?.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          gapH16(),
          TransparentFormField(
            controller: controller.nameController,
            hint: AppStrings.enterCompanyName,
            label: AppStrings.companyName,
            icon: Icons.apartment,
            textInputAction: TextInputAction.next,
            validator: AppValidators.fieldEmpty(AppStrings.companyName),
            textCapitalization: TextCapitalization.words,
          ),
          gapH16(),
          TransparentFormField(
            controller: controller.contactPersonController,
            hint: "Enter contact person name",
            label:"Contact Person",
            icon: Icons.person,
            textInputAction: TextInputAction.next,
            validator: AppValidators.fieldEmpty("Contact Person"),
            textCapitalization: TextCapitalization.words,
          ),
          gapH16(),
          TransparentDatePickerField(
            label: "Member Since",
            hint: "Select date you joined",
            icon: Icons.calendar_today_outlined,
            controller: controller.joinedDateController,
            initialDate: DateTime.now(),
          ),
          gapH16(),
          TransparentFormField(
            controller: controller.websiteController,
            hint: AppStrings.enterWebsite,
            label: AppStrings.website,
            icon: Icons.language,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.url,
            textCapitalization: TextCapitalization.none,
            validator: AppValidators.website,
          ),
          gapH16(),

          CompanyEmployeeSize(controller:controller.companySizeController),


          gapH16(),
          TransparentFormField(
            controller: controller.tagController,
            hint: "enter short tagline",
            label: "Tagline",
            validator: AppValidators.fieldEmpty("Tagline"),
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.done,

          ),
          gapH16(),
          Text(
            "Account Status",
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
          gapH4(),
          CustomThemeButton(
            color:Colors.green.shade100,
            borderColor:Colors.green.shade100,
            radius: 30,
            isExpanded: false,
            alignRight: false,
            padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
            onTap: () {
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.check_circle,color: Colors.green,),
                gapW6(),
                Text(
                  "Active",
                  style: context.textTheme.titleMedium?.copyWith(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  /// Profile image widget that listens to state changes
  Widget _profileImage(WidgetRef ref) {
    final state = ref.watch(editEmployerProfileProvider);
    final controller = ref.read(editEmployerProfileProvider.notifier);

    return ImageViewPicker(
      formKey: GlobalKey(), // Provide a form key if needed
      imageUrl: state.profileData?.profileImageUrl,
      imageFile: state.profileFile,
      height: 100,
      width: 100,
      radius: 50,
      editAction: () async {
        await controller.pickProfileImage();
        // No setState needed; widget rebuilds automatically due to `ref.watch`
      },
    );
  }
}
