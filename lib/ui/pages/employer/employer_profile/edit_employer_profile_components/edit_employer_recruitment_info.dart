import 'package:dei_champions/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/app_validators.dart';
import '../../../../../widgets/form/transparent_form_field.dart';
import '../../../profile/edit_profile_components/edit_profile_action_button.dart';


class EditEmployerRecruitmentInfo extends ConsumerWidget {
  final bool isFromCommonEdit;
  const EditEmployerRecruitmentInfo({super.key,this.isFromCommonEdit = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editEmployerProfileProvider);
    final controller = ref.read(editEmployerProfileProvider.notifier);
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        initiallyExpanded: isFromCommonEdit!= true,
        // collapsed by default
        title: Text(
          "Recruitments",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        visualDensity: VisualDensity.compact,

        iconColor: Colors.black54,
        collapsedIconColor: Colors.black54,
        // 👇 Hides the expand/collapse icon
        trailing: isFromCommonEdit ? null : const SizedBox.shrink(),

        // 👇 Prevent collapsing by making it non-interactive if not from common edit
        onExpansionChanged: isFromCommonEdit ? null : (_) {},
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        children: [
          TransparentFormField(
            controller: controller.recruitmentsController,
            hint: "Describe your company's recruitment process, approach, and hiring policies",
            label: "Recruitment Information",
            textInputAction: TextInputAction.done,
            validator: AppValidators.fieldEmpty("Recruitment Information"),
            textCapitalization: TextCapitalization.sentences,
            minLines: 3,
          ),
          if(isFromCommonEdit!= true)  Padding(
            padding: const EdgeInsets.only(top: 20),
            child: EditProfileActionButtons(),
          )],
      ),
    );
  }

}
