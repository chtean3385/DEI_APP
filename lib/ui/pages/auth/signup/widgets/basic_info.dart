import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/constants/app_strings.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_validators.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../service/screen_shot_security_manager.dart';
import '../../../../../service/user_info_service.dart';
import '../../../../../widgets/form/transparent_form_field.dart';
import '../../../../../widgets/others/custom_theme_button.dart';
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
  final formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _mobileController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ScreenShotProtector.enableScreenProtection();
    _autoFillUserData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _mobileController.dispose();
    ScreenShotProtector.disableScreenProtection();
    super.dispose();
  }

  Future<void> _autoFillUserData() async {
    final email = await UserInfoService.getUserEmail();
    final mobile = await MobileHelper.getMobileNumber();

    if (email != null) _emailController.text = email;
    if (mobile != null) _mobileController.text = mobile;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            gap16(),
            // Full Name Field
            TransparentFormField(
              controller: _nameController,
              hint: AppStrings.name,
              icon: Icons.person_outline,
              textInputAction: TextInputAction.next,
              validator: AppValidators.fieldEmpty(AppStrings.name),
              textCapitalization: TextCapitalization.words,
            ),

            gap20(),

            // Email Field
            TransparentFormField(
              controller: _emailController,
              hint: AppStrings.email,
              icon: Icons.email_outlined,
              textInputAction: TextInputAction.next,
              autofillHints: [AutofillHints.email],
              keyboardType: TextInputType.emailAddress,
              validator: AppValidators.email,
            ),
            gap20(),

            // Confirm Password Field
            TransparentFormField(
              controller: _mobileController,
              hint: AppStrings.mobile,
              autofillHints: [AutofillHints.telephoneNumber],
              textInputAction: TextInputAction.next,
              icon: Icons.phone_android,
              validator: AppValidators.phone,
              keyboardType: TextInputType.phone,
            ),
            gap20(),

            // Password Field
            TransparentFormField(
              controller: _passwordController,
              hint: AppStrings.password,
              icon: Icons.lock_outline,
              textInputAction: TextInputAction.next,
              isPassword: true,
              validator: AppValidators.password,
            ),

            gap20(),

            // Confirm Password Field
            TransparentFormField(
              controller: _confirmPasswordController,
              hint: 'Confirm Password',
              icon: Icons.lock_outline,
              textInputAction: TextInputAction.next,
              isPassword: true,
              validator: AppValidators.confirmPassword(_passwordController),
            ),

            // Work Status Selection
            gap20(),

            // SMS/Email Updates Checkbox
            UpdatesCheckbox(
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
                Expanded(child: Divider(color: Colors.white30, thickness: 1)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'OR',
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.white70
                    ),
                  ),
                ),
                Expanded(child: Divider(color: Colors.white30, thickness: 1)),
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
                    color: Colors.white70
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
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _nextButton() {
    return CustomThemeButton(
      color: AppColors.primaryColor,
      height: 56,
      radius: 16,
      isExpanded: true,
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
    );
  }
}
