import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/constants/app_strings.dart';
import 'package:dei_champions/constants/app_validators.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../widgets/form/transparent_form_field.dart';
import '../../../../../widgets/others/custom_theme_button.dart';
import '../components/terms_conditions.dart';
import '../components/update_check_box.dart';

class BasicPersonalInfo extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const BasicPersonalInfo({super.key, required this.formKey});

  @override
  _BasicPersonalInfoState createState() => _BasicPersonalInfoState();
}

class _BasicPersonalInfoState extends State<BasicPersonalInfo>
    with SingleTickerProviderStateMixin {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _mobileController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            // Full Name Field
            TransparentFormField(
              controller: _nameController,
              hint: AppStrings.name,
              icon: Icons.person_outline,
              validator: AppValidators.fieldEmpty(AppStrings.name),
              textCapitalization: TextCapitalization.words,
            ),

            SizedBox(height: 20),

            // Email Field
            TransparentFormField(
              controller: _emailController,
              hint: AppStrings.email,
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              validator: AppValidators.email,
            ),

            SizedBox(height: 20),

            // Password Field
            TransparentFormField(
              controller: _passwordController,
              hint: AppStrings.password,
              icon: Icons.lock_outline,
              isPassword: true,
              validator: AppValidators.password,
            ),

            SizedBox(height: 20),

            // Confirm Password Field
            TransparentFormField(
              controller: _confirmPasswordController,
              hint: 'Confirm Password',
              icon: Icons.lock_outline,
              isPassword: true,
              validator: AppValidators.password,
            ),

            SizedBox(height: 20),

            // Confirm Password Field
            TransparentFormField(
              controller: _mobileController,
              hint: AppStrings.mobile,
              icon: Icons.phone_android,
              isPassword: true,
              validator: AppValidators.phone,
            ),

            SizedBox(height: 16),

            // Work Status Selection
            SizedBox(height: 24),

            // SMS/Email Updates Checkbox
            UpdatesCheckbox(
              initialValue: false,
              onChanged: (val) {
                print("Checkbox value: $val");
              },
            ),

            // Terms and Conditions
            const TermsAndConditions(),

            SizedBox(height: 32),

            // Sign Up Button
            _nextButton(),

            SizedBox(height: 24),

            // Divider
            Row(
              children: [
                Expanded(child: Divider(color: Colors.white30, thickness: 1)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'OR',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ),
                Expanded(child: Divider(color: Colors.white30, thickness: 1)),
              ],
            ),

            SizedBox(height: 32),

            // Login Link
            GestureDetector(
              onTap: () => AppNavigator.loadSignInScreen(),
              child: RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
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
    // final pageState = ref.watch(authProvider).pageState;
    return CustomThemeButton(
      // isLoading: pageState == PageState.loading,
      color: AppColors.primaryColor,
      height: 56,
      radius: 16,
      isExpanded: true,
      onTap: () {
        // AppNavigator.loadOtpScreen();
        if (widget.formKey.currentState?.validate() == true) {
          // controller.signInUser(context);
          // AppNavigator.loadOtpScreen();
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
