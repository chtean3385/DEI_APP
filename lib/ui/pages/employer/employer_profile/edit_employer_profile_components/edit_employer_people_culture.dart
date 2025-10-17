import 'package:dei_champions/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/app_validators.dart';
import '../../../../../widgets/form/transparent_form_field.dart';


class EditEmployerPeopleAndCulture extends ConsumerWidget {
  const EditEmployerPeopleAndCulture({super.key});

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
          "People",
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
            controller: controller.peopleCultureController,
            hint: "Describe your company's culture, values, and team environment",
            label: "People & Culture",
            textInputAction: TextInputAction.done,
            validator: AppValidators.fieldEmpty("People & Culture"),
            textCapitalization: TextCapitalization.sentences,
            minLines: 3,
          ),],
      ),
    );
  }

}
