import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/ui/pages/auth/signup/components/work_status_view.dart';
import 'package:dei_champions/ui/pages/auth/signup/widgets/signup_back_button.dart';
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

class OtherInfo extends StatefulWidget {
  final VoidCallback onNext;

  const OtherInfo({super.key, required this.onNext});

  @override
  State<OtherInfo> createState() => _OtherInfoState();
}

class _OtherInfoState extends State<OtherInfo> {
  final otherInfoFormKey = GlobalKey<FormState>();
  final _cityController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? selectedWorkStatus;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        // Background Image with Overlay
        BackgroundImageOverlay(
          imagePath: AppDrawables.signupBg,
          darkenOpacity: 0.5,
        ),
        // Gradient Overlay
        GradientOverlay(),
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child:Form(
                    key: otherInfoFormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SignupHeaderSmall(title: "Basic Details",subTitle: 'Lets start creating your profile',),
                        // Signup Form
                        RegistrationProgressBar(),
                        gap16(),
                        gap16(),
                        // Password Field
                        TransparentFormField(
                          controller: _passwordController,
                          hint: AppStrings.password,
                          icon: Icons.lock_outline,
                          textInputAction: TextInputAction.next,
                          isPassword: true,
                          validator: AppValidators.password,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).nextFocus();
                          },
                        ),

                        gap20(),

                        // Confirm Password Field
                        TransparentFormField(
                          controller: _confirmPasswordController,
                          hint: 'Confirm Password',
                          icon: Icons.lock_outline,
                          textInputAction: TextInputAction.next,
                          isPassword: true,
                          validator: AppValidators.confirmPassword(
                            _passwordController,
                          ),
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).nextFocus();
                          },
                        ),

                        gap20(),
                        WorkStatusView(
                          formKey: otherInfoFormKey,
                          onStatusChanged: (value) {
                            setState(() {
                              selectedWorkStatus = value;
                            });
                          },
                        ),
                        gap20(),
                        // Conditionally show location field
                        if (selectedWorkStatus != null &&
                            selectedWorkStatus!.isNotEmpty) ...[
                          TransparentFormField(
                            controller: _cityController,
                            hint: AppStrings.city,
                            icon: Icons.person_outline,
                            textInputAction: TextInputAction.next,
                            validator: AppValidators.fieldEmpty(AppStrings.city),
                            textCapitalization: TextCapitalization.words,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).nextFocus();
                            },
                          ),

                          gap20(),
                        ],

                      ],
                    ),
                  ),
                ),
                _nextButton(),
                gap20()
              ],
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 40,
          child: SignupBackButton(),
        ),


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
          // if (formKey.currentState?.validate() == true) {
            widget.onNext();
          // }
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
