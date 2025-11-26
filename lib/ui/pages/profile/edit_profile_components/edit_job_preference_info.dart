import 'package:dei_champions/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/enums.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/form/transparant_drop_down.dart';
import '../../../../models/job/job_type_model.dart';
import '../../auth/signup/widgets/key_skills/selected_key_skills.dart';
import '../components/set_prefered_locations.dart';

class EditJobPreferenceInfo extends ConsumerWidget {
  const EditJobPreferenceInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editEmployeeProfileProvider);
    final jobTypeState = ref.watch(jobTypesProvider);
    final controller = ref.read(editEmployeeProfileProvider.notifier);
    final colorTheme = context.colors;
    final hasError = controller.sectionErrors.containsKey("jobPref");


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
            initiallyExpanded: false,
            title: Text(
              "Job Preferences",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorTheme.black87,
              ),
            ),
            maintainState: true,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),side: BorderSide.none),
            visualDensity: VisualDensity.compact,
            iconColor: colorTheme.black54,
            collapsedIconColor: colorTheme.black54,
            childrenPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
           children: [
             Form(
               key: controller.jobPrefFormKey,
               child: Column(
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

                     value: (state.profileData?.preferences?.jobTypes?.isNotEmpty ?? false)
                         ? jobTypeState.data
                         ?.firstWhere(
                           (type) => type.id == state.profileData?.preferences?.jobTypes?.first,
                       orElse: () => JobTypeModel(),
                     )
                         .name
                         ?.toLowerCase()
                         : null,

                     onChanged: (selectedName) {
                       // find the job type by lowercase name
                       final selectedType = jobTypeState.data?.firstWhere(
                             (type) => type.name?.toLowerCase() == selectedName?.toString().toLowerCase(),
                         orElse: () => JobTypeModel(),
                       );

                       // store only the ID
                       controller.updateJobType(selectedType?.id ?? '');
                     },
                   ),

                   gapH16(),
                   TransparentDropdownField(
                     label: "Salary",
                     hint: "Salary Expectation",
                     icon: Icons.currency_rupee,
                     items: ["10-20 lac", "20-30 lac", "30-40 lac", "40-50 lac"],
                     value: state.profileData?.preferences?.salaryRange?.range,
                     onChanged: (value) {
                       controller.updateSalary( value.toString());
                     },
                   ),
                   gapH16(),
                   SelectPreferredLocations(
                     controller: controller.preferredLocationController,
                     data:  state.cities?.map((e)=>e.name).toList() ?? [],
                     onSkillSelected: controller.addPreferredLocation,

                   ),
                   gapH16(),

                   /// 🔽 Show selected skills

                   SelectedKeySkills(
                     selectedSkill: state.profileData?.preferredLocations ?? [],
                     onRemove: controller.removeSkill,
                     label: "Location",
                   ),
                   // TransparentFormField(
                   //   controller: controller.preferredLocationController,
                   //   hint: "Locations separated by commas",
                   //   label: "Preferred Locations",
                   //   icon: Icons.location_on_outlined,
                   //   textInputAction: TextInputAction.done,
                   //   validator: AppValidators.fieldEmpty("Preferred Locations"),
                   //   textCapitalization: TextCapitalization.words,
                   // ),

                 ],
                          ),
             )
           ],
          ),
          if (hasError) Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              controller.sectionErrors["jobPref"] ?? '',
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
