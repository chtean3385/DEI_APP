import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/ui/pages/auth/signup/widgets/key_skills/skill_form.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../widgets/others/custom_theme_button.dart';
import '../../auth/signup/widgets/key_skills/selected_key_skills.dart';
import '../../auth/signup/widgets/preference/work_location_field.dart';


class SkillsDesignationsLocations extends StatefulWidget {
  final VoidCallback onNext;

  const SkillsDesignationsLocations({super.key, required this.onNext});

  @override
  State<SkillsDesignationsLocations> createState() => _SkillsDesignationsLocationsState();
}
class _SkillsDesignationsLocationsState extends State<SkillsDesignationsLocations> {
  final formKeySkills = GlobalKey<FormState>();
  final TextEditingController skillController = TextEditingController();
  final _skillFocus = FocusNode();
  final List<String> _selectedSkills = [];
  final TextEditingController preferWorkLocationController =
  TextEditingController();
  final _preferWorkLocationFocus = FocusNode();
  final List<String> selectedLocations = [];

  @override
  void dispose() {
    skillController.dispose();
    _skillFocus.dispose();
    debugPrint("KeySkill dispose");
    super.dispose();
  }

  void _addSkill(String skill) {
    if (skill.isNotEmpty && !_selectedSkills.contains(skill)) {
      setState(() => _selectedSkills.add(skill));
    }
    skillController.clear();
    formKeySkills.currentState?.validate();
  }

  void _removeSkill(String skill) {
    setState(() => _selectedSkills.remove(skill));
    formKeySkills.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: IntrinsicHeight(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Form(
                  key: formKeySkills,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      gapH16(),
                      Text(
                        "Search jobs and internships",
                        style: theme.titleLarge,
                      ),
                      gapH16(),
                      /// 🔽 Skill Input
                      KeyForm(
                        controller: skillController,
                        focusNode: _skillFocus,
                        onSkillSelected: _addSkill,
                        hint:"Enter your key skills, designations, companies",
                        label: "Skills, designations, companies",
                      ),


                      /// 🔽 Show selected skills

                      SelectedKeySkills(
                        selectedSkill: _selectedSkills,
                        onRemove: _removeSkill,
                      ),
                      gapH16(),
                      WorkLocationField(
                        controller: preferWorkLocationController,
                        focusNode: _preferWorkLocationFocus,
                        label: "Location",
                      ),
                      gapH20(),
                    ],
                  ),
                ),
              ),
              _nextButton(),
              gapH20(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nextButton() {
    return SafeArea(
      child: CustomThemeButton(
        color: AppColors.primaryColor,
        height: 56,
        radius: 30,
        isExpanded: false,
        alignRight: true,
        onTap: () {

          if (formKeySkills.currentState?.validate() == true) {
            widget.onNext();
          }
        },
        child: Text(
         "Search Jobs",
          style: context.textTheme.titleMedium?.copyWith(
            color: context.theme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}

