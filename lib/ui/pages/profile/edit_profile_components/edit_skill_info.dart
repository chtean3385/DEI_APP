import 'package:dei_champions/constants/app_theme.dart';
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
    final colorTheme = context.colors;
    final hasError = controller.sectionErrors.containsKey("skill");

    return Card(
      elevation: 2,
      color:colorTheme.jobCardBgColor,clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),side: BorderSide(
        color: hasError ? Colors.red : colorTheme.themBasedWhite,
        width:  1,
      )),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            ExpansionTile(
              initiallyExpanded: isFromCommonEdit!= true, // collapsed by default
              title: Text(
                "Skills",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorTheme.black87,
                ),
              ),
              visualDensity: VisualDensity.compact,

              iconColor: colorTheme.black54,
              collapsedIconColor: colorTheme.black54,
              // 👇 Hides the expand/collapse icon
              trailing: isFromCommonEdit ? null : const SizedBox.shrink(),

              // 👇 Prevent collapsing by making it non-interactive if not from common edit
              onExpansionChanged: isFromCommonEdit ? null : (_) {},
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),side: BorderSide.none),
              childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
             children: [
               Form(
                 key: controller.skillFormKey,
                 child: Column(
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
                       child: EditProfileActionButtons(isEmployee: true,isFromCommonEdit: isFromCommonEdit),
                     )
                   ],
                 ),
               )
             ],
            ),
            if (hasError) Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                controller.sectionErrors["skill"] ?? '',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

