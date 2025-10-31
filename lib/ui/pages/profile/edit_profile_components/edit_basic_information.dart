import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/app_strings.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/app_validators.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/form/transparant_date_picker.dart';
import '../../../../widgets/form/transparant_drop_down.dart';
import '../../../../widgets/form/transparent_form_field.dart';
import '../../auth/common/email_suggestion_field.dart';

class EditBasicInformation extends ConsumerWidget {
  const EditBasicInformation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editEmployeeProfileProvider);
    final controller = ref.read(editEmployeeProfileProvider.notifier);

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
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black12,
            child: Icon(
              Icons.person_add,
              size: 30,
              color: Colors.grey.shade600,
            ),
          ),
          gapH16(),
          TransparentFormField(
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
            controller: controller.emailController,
            hint: AppStrings.email,
            label: AppStrings.email,
            icon: Icons.email_outlined,
            readOnly: true,
            fillColor: Colors.black12,
          ),
          gapH16(),
          TransparentFormField(
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
            onChanged: (value) {},
          ),
          gapH16(),
          TransparentDropdownField(
            label: "Work Status",
            hint: "Select your current work status",
            icon: Icons.work_outline,
            items: ["student", "employed", "un-employed", "self-employed"],
            value: state.profileData?.workStatus,
            onChanged: (value) {},
          ),
          gapH16(),
          TransparentFormField(
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
    );
  }
}
