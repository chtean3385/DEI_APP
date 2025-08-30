import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/constants/app_strings.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_validators.dart';
import 'package:dei_champions/ui/pages/auth/signup/widgets/signup_back_button.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../providers/providers.dart';
import '../../../../../service/screen_shot_security_manager.dart';
import '../../../../../widgets/form/transparent_form_field.dart';
import '../../../../../widgets/others/custom_theme_button.dart';
import '../components/registration_progress_bar.dart';
import '../components/signup_header.dart';
import '../components/terms_conditions.dart';
import '../components/update_check_box.dart';

class BasicPersonalInfo extends StatefulWidget {
  final VoidCallback onNext;

  const BasicPersonalInfo({super.key, required this.onNext});

  @override
  _BasicPersonalInfoState createState() => _BasicPersonalInfoState();
}

class _BasicPersonalInfoState extends State<BasicPersonalInfo>
    with SingleTickerProviderStateMixin {
  final basicPersonalInfoFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();

  // Create FocusNodes
  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _mobileFocus = FocusNode();
  final _checkBoxFocus = FocusNode();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ScreenShotProtector.enableScreenProtection();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    // Dispose FocusNodes
    _mobileFocus.dispose();
    _nameFocus.dispose();
    _emailFocus.dispose();
    _checkBoxFocus.dispose();
    ScreenShotProtector.disableScreenProtection();
    debugPrint("BasicPersonalInfo dispose");

    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      child: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              physics: BouncingScrollPhysics(),
              child: Form(
                key: basicPersonalInfoFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SignupHeader(),
                    // Signup Form
                    RegistrationProgressBar(),
                    gap16(),
                    gap16(),
                    // Full Name Field
                    TransparentFormField(
                      controller: _nameController,
                      focusNode: _nameFocus,
                      hint: AppStrings.name,
                      label: AppStrings.name,
                      icon: Icons.person_outline,
                      textInputAction: TextInputAction.next,
                      validator: AppValidators.fieldEmpty(AppStrings.name),
                      textCapitalization: TextCapitalization.words,
                      nextFocusNode:_emailFocus ,
                    ),

                    gap20(),

                    // Email Field
                    Consumer(
                        builder: (context, ref, child) {
                          final email = ref.watch(signupFlowControllerProvider.select((user) => user.email));
                          if (email != null && email != _emailController.text) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              _emailController.text = email;
                            });
                          }
                        return TransparentFormField(
                          controller: _emailController,
                          focusNode: _emailFocus,
                          hint: AppStrings.email,
                          label: AppStrings.email,
                          icon: Icons.email_outlined,
                          textInputAction: TextInputAction.next,
                          autofillHints: [AutofillHints.email],
                          keyboardType: TextInputType.emailAddress,
                          validator: AppValidators.email,
                          nextFocusNode:_mobileFocus ,
                        );
                      }
                    ),
                    gap20(),

                    // Confirm Password Field
                    TransparentFormField(
                      controller: _mobileController,
                      focusNode: _mobileFocus,
                      hint: AppStrings.mobile,
                      label: AppStrings.mobile,
                      autofillHints: [AutofillHints.telephoneNumber],
                      textInputAction: TextInputAction.next,
                      icon: Icons.phone_android,
                      validator: AppValidators.phone,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      nextFocusNode:_checkBoxFocus ,
                    ),
                    gap20(),



                    // SMS/Email Updates Checkbox
                    UpdatesCheckbox(
                      formKey: basicPersonalInfoFormKey,
                      initialValue: false,
                      onChanged: (val) {
                        debugPrint("Checkbox value: $val");
                      },
                    ),

                    // Terms and Conditions
                    const TermsAndConditions(),

                    gap16(),
                    gap16(),

                    // Sign Up Button
                    _nextButton(),

                    gap16(),

                    // Divider
                    Row(
                      children: [
                        Expanded(
                          child: Divider(color: Colors.white30, thickness: 1),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'OR',
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(color: Colors.white30, thickness: 1),
                        ),
                      ],
                    ),

                    gap16(),

                    // Login Link
                    GestureDetector(
                      onTap: () => AppNavigator.loadSignInScreen(),
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: Colors.white70,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 40,
            child: SignupBackButton(),
          ),
        ],
      ),
    );
  }

  Widget _nextButton() {
    return CustomThemeButton(
      color: AppColors.primaryColor,
      height: 56,
      radius: 16,
      isExpanded: false,
      alignRight: true,
      onTap: () {
        if (basicPersonalInfoFormKey.currentState?.validate() == true) {
        widget.onNext();
        }
      },
      child: Text(
        AppStrings.next,
        style: context.textTheme.titleMedium?.copyWith(
          color: context.theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
