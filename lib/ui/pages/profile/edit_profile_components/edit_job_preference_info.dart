import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/app_styles.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/form/transparant_drop_down.dart';
import '../../auth/signup/widgets/preference/work_location_field.dart';

class EditJobPreferenceInfo extends ConsumerWidget {
  const EditJobPreferenceInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editProfileProvider);
    final controller = ref.read(editProfileProvider.notifier);

    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ExpansionTile(
        initiallyExpanded: false, // collapsed by default
        title: Text(
          " Job Preferences",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        visualDensity: VisualDensity.compact,

        iconColor: Colors.black54,
        collapsedIconColor: Colors.black54,
        childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [

          TransparentDropdownField(
            label: "Job Type",
            hint: "Preferred job type",
            icon: Icons.work_outline,
            items: ["Part-Time", "Full-Time", "Contract",],
            onChanged: (value) {
              controller.jobTypeController.text = value.toString();
            },
          ),
          gapH16(),
          TransparentDropdownField(
            label: "Salary",
            hint: "Salary Expectation",
            icon: Icons.currency_rupee,
            items: ["10-20 lac", "20-3- lac", "30-40 lac", "40-50 lac"],
            onChanged: (value) {
              controller.salaryExpectedController.text = value.toString();
            },
          ),
          gapH16(),
          WorkLocationField(
            controller: controller.preferredLocationController,
          ),

        ],
      ),
    );
  }
}
