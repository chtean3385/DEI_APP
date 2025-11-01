import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/app_styles.dart';
import '../../../../providers/providers.dart';
import '../../auth/signup/widgets/key_skills/selected_key_skills.dart';
import '../../auth/signup/widgets/key_skills/skill_form.dart';
import 'edit_profile_action_button.dart';

class EditSkillInformation extends ConsumerWidget {
  final bool isFromCommonEdit;
  const EditSkillInformation({super.key,this.isFromCommonEdit = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editEmployeeProfileProvider);
    final controller = ref.read(editEmployeeProfileProvider.notifier);

    return Card(
      elevation: 2,
      color: Colors.white,clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SafeArea(
        child: ExpansionTile(
          initiallyExpanded: isFromCommonEdit!= true, // collapsed by default
          title: Text(
            "Skills",
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
          childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          children: [
            /// 🔽 Skill Input

            TransparentAddFormField(
              controller: controller.skillController,
              hint: "Enter a skill",
              label: "Skills",
              icon: Icons.build_circle_outlined,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.done,
              onSkillSelected: controller.addSkill,
            ),


            gapH16(),

            /// 🔽 Show selected skills

            SelectedKeySkills(
              selectedSkill: state.profileData?.skills ?? [],
              onRemove: controller.removeSkill,
            ),

          if(isFromCommonEdit!= true)  Padding(
              padding: const EdgeInsets.only(top: 20),
              child: EditProfileActionButtons(),
            )
          ],
        ),
      ),
    );
  }
}

