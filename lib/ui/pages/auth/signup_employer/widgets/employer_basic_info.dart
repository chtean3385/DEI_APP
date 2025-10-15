import 'package:dei_champions/constants/app_strings.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_validators.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../providers/providers.dart';
import '../../../../../service/screen_shot_security_manager.dart';
import '../../../../../widgets/form/transparent_form_field.dart';
import '../../../../../widgets/others/custom_theme_button.dart';
import '../../common/email_suggestion_field.dart';
import '../../signup/components/registration_progress_bar.dart';
import '../../signup/components/signup_header.dart';
import '../../signup/widgets/signup_back_button.dart';
import 'busines_type.dart';

class EmployerBasicPersonalInfo extends StatefulWidget {
  final VoidCallback onNext;

  const EmployerBasicPersonalInfo({super.key, required this.onNext});

  @override
  _EmployerBasicPersonalInfoState createState() => _EmployerBasicPersonalInfoState();
}

class _EmployerBasicPersonalInfoState extends State<EmployerBasicPersonalInfo>
    with SingleTickerProviderStateMixin {
  final employerPersonalInfoFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();

  // Create FocusNodes
  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _mobileFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _checkBoxFocus = FocusNode();
  bool isIndividual = true;


  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    // Dispose FocusNodes
    _mobileFocus.dispose();
    _nameFocus.dispose();
    _emailFocus.dispose();
    _checkBoxFocus.dispose();
    _passwordFocus.dispose();
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
                key: employerPersonalInfoFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // SignupHeaderEmployer(),
                    // gap16(),
                    // Text(
                    //   "Basic Details",
                    //   textAlign: TextAlign.left,
                    //   style: context.textTheme.labelMedium?.copyWith(
                    //     color: Colors.black,
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    // ),
                    //
                    // const SizedBox(height: 8),
                    // Text(
                    //   'We need these details to identify you and create your account',
                    //   textAlign: TextAlign.left,
                    //   style: context.textTheme.bodyMedium?.copyWith(color: Colors.black54),
                    // ),
                    EmployerSignupHeaderSmall(title:"Basic Details",subTitle: 'We need these details to identify you and create your account' ,),
                    gapH16(),
                    RegistrationProgressBar(isEmployer: true),
                    gapH16(),
                    gapH16(),
                    BusinessType(),
                    gapH20(),
                    // Confirm Password Field
                    TransparentFormField(
                      controller: _mobileController,
                      focusNode: _mobileFocus,
                      hint: AppStrings.enterMobile,
                      label: AppStrings.mobile,
                      autofillHints: [AutofillHints.telephoneNumber],
                      textInputAction: TextInputAction.next,
                      icon: Icons.phone_android,
                      validator: AppValidators.phone,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      nextFocusNode:_nameFocus ,
                    ),
                    gapH20(),
                    // Full Name Field
                    TransparentFormField(
                      controller: _nameController,
                      focusNode: _nameFocus,
                      hint: AppStrings.enterNameAsPerPAN,
                      label: AppStrings.nameAsPerPAN,
                      icon: Icons.person_outline,
                      textInputAction: TextInputAction.next,
                      validator: AppValidators.fieldEmpty(AppStrings.fullNameAsPerPan),
                      textCapitalization: TextCapitalization.words,
                      nextFocusNode:_emailFocus ,

                    ),

                    gapH20(),

                    // Email Field
                    Consumer(
                        builder: (context, ref, child) {
                          final email = ref.watch(signupFlowControllerProvider.select((user) => user.email));
                          if (email != null && email != _emailController.text) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              _emailController.text = email;
                            });
                          }
                        return EmailSuggestionField(
                          controller: _emailController,
                          focusNode: _emailFocus,
                          nextFocus: _passwordFocus,
                          hint: AppStrings.enterOfficialEmailId,
                          label: AppStrings.officialEmailId,
                        );
                      }
                    ),
                    gapH20(),
                    // Password Field
                    TransparentFormField(
                      controller: _passwordController,
                      focusNode: _passwordFocus,
                      hint: AppStrings.createStrongPassword,
                      label: AppStrings.createPassword,
                      icon: Icons.lock_outline,
                      textInputAction: TextInputAction.done,
                      isPassword: true,
                      validator: AppValidators.password,

                    ),
                    gapH20(),
                    _nextButton(),
                    gapH16(),

                  ],
                ),
              ),
            ),
          ),
          Positioned(top: 25,left: 10,child: SignupBackButton(isEmployer: true))
        ],
      ),
    );
  }

  Widget _nextButton() {
    return Consumer(
        builder: (context, ref, _) {
          final notifier = ref.read(employerRegisterProvider.notifier);
        return CustomThemeButton(
          color: AppColors.primaryColor,
          height: 56,
          radius: 16,
          isExpanded: false,
          alignRight: true,
          onTap: () {
            if (employerPersonalInfoFormKey.currentState?.validate() == true) {
              notifier.setName(_nameController.text.trim());
              notifier.setEmail(_emailController.text.trim());
              notifier.setMobile(_mobileController.text.trim());
              notifier.setPassword(_passwordController.text.trim());
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
    );
  }
}
