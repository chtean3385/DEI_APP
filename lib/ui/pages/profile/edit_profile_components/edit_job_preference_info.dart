import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/app_validators.dart';
import '../../../../constants/enums.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/form/transparant_drop_down.dart';
import '../../../../widgets/form/transparent_form_field.dart';
import '../../../../models/job/job_type_model.dart';

class EditJobPreferenceInfo extends ConsumerWidget {
  const EditJobPreferenceInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editEmployeeProfileProvider);
    final jobTypeState = ref.watch(jobTypesProvider);
    final controller = ref.read(editEmployeeProfileProvider.notifier);
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ExpansionTile(
        initiallyExpanded: false,
        title: Text(
          "Job Preferences",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        visualDensity: VisualDensity.compact,
        iconColor: Colors.black54,
        collapsedIconColor: Colors.black54,
        childrenPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          jobTypeState.pageState == PageState.loading
              ? const Center(child: CircularProgressIndicator())
              : TransparentDropdownField(
            label: "Job Type",
            hint: "Preferred job type",
            icon: Icons.work_outline,
            // lowercase names for the dropdown list
            items: jobTypeState.data
                ?.where((type) => type.name != null && type.id != null)
                .map((type) => type.name!.toLowerCase())
                .toList() ??
                [],
            // find selected job name (based on ID) and make it lowercase
            value: jobTypeState.data
                ?.firstWhere(
                  (type) => type.id == state.profileData?.preferences?.jobTypes?.first,
              orElse: () => JobTypeModel(),
            )
                .name
                ?.toLowerCase(),
            onChanged: (selectedName) {
              // find the job type by lowercase name
              final selectedType = jobTypeState.data?.firstWhere(
                    (type) => type.name?.toLowerCase() == selectedName?.toString().toLowerCase(),
                orElse: () => JobTypeModel(),
              );

              // store only the ID
              controller.jobTypeController.text = selectedType?.id ?? '';
            },
          ),

          gapH16(),
          TransparentDropdownField(
            label: "Salary",
            hint: "Salary Expectation",
            icon: Icons.currency_rupee,
            items: ["10-20 lac", "20-30 lac", "30-40 lac", "40-50 lac"],
            value: state.profileData?.preferences?.salaryRange,
            onChanged: (value) {
              controller.salaryExpectedController.text = value.toString();
            },
          ),
          gapH16(),
          TransparentFormField(
            controller: controller.preferredLocationController,
            hint: "Enter preferred locations separated by commas",
            label: "Preferred Locations",
            icon: Icons.location_on_outlined,
            textInputAction: TextInputAction.done,
            validator: AppValidators.fieldEmpty("Preferred Locations"),
            textCapitalization: TextCapitalization.words,
          ),

        ],
      ),
    );
  }
}
