import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/ui/pages/auth/signup/widgets/key_skills/skill_form.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_drawables.dart';
import '../../../../../constants/app_strings.dart';
import '../../../../../widgets/others/custom_theme_button.dart';
import '../components/backround_image_overlay.dart';
import '../components/gradient_overlay.dart';
import '../components/registration_progress_bar.dart';
import '../components/signup_header.dart';
import '../widgets/key_skills/error_validation.dart';
import '../widgets/key_skills/selected_key_skills.dart';
import '../widgets/signup_back_button.dart';

class KeySkills extends StatefulWidget {
  final VoidCallback onNext;

  const KeySkills({super.key, required this.onNext});

  @override
  State<KeySkills> createState() => _KeySkillsState();
}
class _KeySkillsState extends State<KeySkills> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController skillController = TextEditingController();

  final List<String> _selectedSkills = [];

  @override
  void dispose() {
    skillController.dispose();
    super.dispose();
  }

  void _addSkill(String skill) {
    if (skill.isNotEmpty && !_selectedSkills.contains(skill)) {
      setState(() => _selectedSkills.add(skill));
    }
    skillController.clear();
    formKey.currentState?.validate();
  }

  void _removeSkill(String skill) {
    setState(() => _selectedSkills.remove(skill));
    formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImageOverlay(
          imagePath: AppDrawables.signupBg,
          darkenOpacity: 0.5,
        ),
        GradientOverlay(),
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SignupHeaderSmall(
                          title: "Key Skills",
                          subTitle: 'Let’s fill your specific key skills',
                        ),
                        RegistrationProgressBar(),
                        gap16(),
                        gap16(),

                        /// 🔽 Skill Input
                        KeyForm(
                          controller: skillController,
                          onSkillSelected: _addSkill,
                        ),

                        gap16(),

                        /// 🔽 Show selected skills

                          SelectedKeySkills(
                            selectedSkill: _selectedSkills,
                            onRemove: _removeSkill,
                          ),



                        gap20(),
                      ],
                    ),
                  ),
                ),
                _nextButton(),
                gap20(),
              ],
            ),
          ),
        ),
        const Positioned(left: 10, top: 40, child: SignupBackButton()),
      ],
    );
  }

  Widget _nextButton() {
    return SafeArea(
      child: CustomThemeButton(
        color: AppColors.primaryColor,
        height: 56,
        radius: 16,
        isExpanded: false,
        onTap: () {

          if (formKey.currentState?.validate() == true) {
          widget.onNext();
          }
          // if (_selectedSkills.isEmpty) {
          //   // force rebuild to show error
          //   setState(() {});
          //   return;
          // }
          //
          // widget.onNext();
        },
        child: Text(
          AppStrings.next,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.theme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}

