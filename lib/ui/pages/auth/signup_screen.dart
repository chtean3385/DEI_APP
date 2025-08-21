import 'package:dei_champions/constants/app_drawables.dart';
import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/constants/app_strings.dart';
import 'package:dei_champions/constants/app_validators.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/form/transparent_form_field.dart';
import '../../../widgets/others/custom_theme_button.dart';
import 'components/backround_image_overlay.dart';
import 'components/gradient_overlay.dart';
import 'components/signup_header.dart';
import 'components/terms_conditions.dart';
import 'components/update_check_box.dart';
import 'components/work_status_view.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _mobileController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(begin: Offset(0, 0.3), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primaryColor, AppColors.secondaryColor],
          ),
        ),
        child: Stack(
          children: [
            // Background Image with Overlay
            BackgroundImageOverlay(
              imagePath: AppDrawables.signupBg,
              darkenOpacity: 0.5,
            ),
            // Gradient Overlay
            GradientOverlay(),
            SafeArea(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SignupHeader(),
                        // Signup Form
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              // Full Name Field
                              TransparentFormField(
                                controller: _nameController,
                                hint: AppStrings.name,
                                icon: Icons.person_outline,
                                validator: AppValidators.fieldEmpty(
                                  AppStrings.name,
                                ),
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
                              WorkStatusView(),

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
                              _signUpButton(),

                              SizedBox(height: 24),

                              // Divider
                              Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      color: Colors.white30,
                                      thickness: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      'OR',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color: Colors.white30,
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 32),

                              // Login Link
                              Center(
                                child: GestureDetector(
                                  onTap: () => AppNavigator.loadSignInScreen(),
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Already have an account? ',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 16,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Sign In',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _signUpButton() {
    // final pageState = ref.watch(authProvider).pageState;
    return CustomThemeButton(
      // isLoading: pageState == PageState.loading,
      color: AppColors.primaryColor,
      height: 56,
      radius: 16,
      isExpanded: true,
      onTap: () {
        if (_formKey.currentState?.validate() == true) {
          // controller.signInUser(context);
        }
      },
      child: Text(
        AppStrings.createAccount,
        style: context.textTheme.titleMedium?.copyWith(
          color: context.theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
