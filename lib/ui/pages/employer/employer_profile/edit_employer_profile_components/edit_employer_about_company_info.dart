import 'package:dei_champions/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/app_validators.dart';
import '../../../../../widgets/form/transparent_form_field.dart';


class EditEmployerAboutCompany extends ConsumerWidget {
  const EditEmployerAboutCompany({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editEmployerProfileProvider);
    final controller = ref.read(editEmployerProfileProvider.notifier);
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        initiallyExpanded: false,
        // collapsed by default
        title: Text(
          "About Us",
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
          TransparentFormField(
            controller: controller.aboutCompanyController,
            hint: "Write a brief overview about your company, mission, and core values",
            label: "About Your Company",
            textInputAction: TextInputAction.done,
            validator: AppValidators.fieldEmpty("About Your Company"),
            textCapitalization: TextCapitalization.sentences,
            minLines: 3,
          ),],
      ),
    );
  }

}
