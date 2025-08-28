import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_drawables.dart';
import '../../../../../constants/app_strings.dart';
import '../../../../../constants/app_validators.dart';
import '../../../../../widgets/form/transparent_form_field.dart';
import '../../../../../widgets/others/custom_theme_button.dart';
import '../components/backround_image_overlay.dart';
import '../components/gradient_overlay.dart';
import '../components/registration_progress_bar.dart';
import '../components/signup_header.dart';
import '../widgets/introduction/select_intro.dart';
import '../widgets/signup_back_button.dart';

class IntroductionToRecruiter extends StatefulWidget {
  final VoidCallback onNext;

  const IntroductionToRecruiter({super.key, required this.onNext});

  @override
  State<IntroductionToRecruiter> createState() =>
      _IntroductionToRecruiterState();
}

class _IntroductionToRecruiterState extends State<IntroductionToRecruiter> {
  final formKeySkills = GlobalKey<FormState>();
  final TextEditingController introlController = TextEditingController();

  final List<String> _introList = [];

  @override
  void dispose() {
    introlController.dispose();
    super.dispose();
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: formKeySkills,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SignupHeaderSmall(
                      title: "Introduction to recruiter",
                      subTitle: 'Let’s introduce yourself',
                    ),
                    RegistrationProgressBar(),
                    gap16(),
                    gap16(),

                    TransparentFormField(
                      controller: introlController,
                      hint: "Short Introduction",
                      icon: Icons.person_outline,
                      textInputAction: TextInputAction.next,
                      validator: AppValidators.fieldEmpty(
                        "Short Introduction",
                      ),
                      textCapitalization: TextCapitalization.words,
                    ),

                    gap16(),

                    SelectIntro(
                      introList: AppStrings.introList,
                      onRemove: (v) {},
                    ),

                    gap20(),
                  ],
                ),
              ),
              _nextButton(),
              gap20(),
            ],
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
          if (formKeySkills.currentState?.validate() == true) {
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
