import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/app_styles.dart';
import '../../../../providers/providers.dart';
import '../../auth/signup/widgets/key_skills/selected_key_skills.dart';
import '../../auth/signup/widgets/key_skills/skill_form.dart';

class EditSkillInformation extends ConsumerWidget {
  const EditSkillInformation({super.key});

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
          "Skills",
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
          /// 🔽 Skill Input
          KeyForm(
            controller:controller.skillController,
            onSkillSelected: controller.addSkill,
            hint:"Enter your key skills",
            label: "Your Skills",
          ),

          gapH16(),

          /// 🔽 Show selected skills

          SelectedKeySkills(
            selectedSkill: state.profileData?.skillsInfo ?? [],
            onRemove: controller.removeSkill,
          ),
        ],
      ),
    );
  }
}
