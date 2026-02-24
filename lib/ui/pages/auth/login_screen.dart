import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../constants/app_validators.dart';
import '../../../constants/enums.dart';
import '../../../providers/controllers/auth/employee_login_controller.dart';
import '../../../providers/providers.dart';
import '../../../utils/widget_utils.dart';
import '../../../constants/app_strings.dart';
import '../../../widgets/form/transparent_form_field.dart';
import '../../../widgets/others/check_box.dart';
import '../../../widgets/others/custom_theme_button.dart';
import 'common/email_suggestion_field_login.dart';
import 'guest/continue_as_guest.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignInScreen> {
  late final LoginController controller;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller = ref.read(loginProvider.notifier);
    controller.loadSavedCredentials();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginProvider);
    final controller = ref.read(loginProvider.notifier);
    final colorTheme = context.colors;

    // Central responsive values based on screen size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmall = screenHeight < 650;
    final isMedium = screenHeight < 800;
    final isLarge = screenHeight < 900;

    // Responsive spacing
    final verticalGap = isSmall ? 8.0 : isMedium ? 12.0 : isLarge ?  16.0 : 20.0;
    final horizontalPadding = (screenWidth * 0.06).clamp(16.0, 40.0);
    final topPadding = isSmall ? 12.0 : isMedium ? 30.0 : isLarge ? 50.0 : 65.0;
    final borderRadius = isSmall ? 30.0 : 50.0;

    return Scaffold(
      backgroundColor: colorTheme.jobCardBgColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // ── Logo Section ──────────────────────────────────────────
              _LogoSection(isSmall: isSmall, isMedium: isMedium,isLarge: isLarge),

              // ── Form Card ─────────────────────────────────────────────
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: colorTheme.commonDividerBgColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(borderRadius),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: colorTheme.black45,
                        offset: const Offset(0, -4),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(
                      horizontalPadding,
                      topPadding,
                      horizontalPadding,
                      MediaQuery.of(context).padding.bottom + 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          AppStrings.loginTitle,
                          style: context.textTheme.titleLarge?.copyWith(
                            fontSize: isSmall ? 18 : null,
                          ),
                        ),
                        SizedBox(height: verticalGap * 1.25),

                        _emailField(),
                        SizedBox(height: verticalGap),

                        _passwordField(),
                        SizedBox(height: verticalGap * 0.625),

                        // Remember me + Forgot password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomCheckbox(
                              label: "Remember Me",
                              initialValue: state.rememberMe,
                              onChanged: (label, isSelected) {
                                controller.toggleRememberMe(isSelected);
                              },
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.setResetPageState(PageState.initial);
                                controller.setOtpSendStatus(false);
                                AppNavigator.loadForgotPasswordScreen();
                              },
                              child: Text(
                                AppStrings.forgotPassword,
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: colorTheme.buttonPrimaryColor,
                                  fontSize: isSmall ? 11 : 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: verticalGap),

                        _signInButton(isSmall: isSmall),
                        SizedBox(height: verticalGap),

                        _signup(),
                        SizedBox(height: verticalGap * 0.5),

                        GuestLoginSection(
                          onGuestTap: controller.loadMainScreenAsGuest,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signup() {
    return GestureDetector(
      onTap: () => AppNavigator.loadSignUpScreen(),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: AppStrings.signupMsg,
              style: context.textTheme.bodyMedium,
            ),
            TextSpan(
              text: AppStrings.signupForFree,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colors.buttonPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailField() {
    return EmailSuggestionFieldLogin(
      controller: controller.emailNameController,
      hint: AppStrings.email,
      label: AppStrings.email,
      nextFocusNode: controller.passwordFocus,

    );
  }

  Widget _passwordField() {
    return TransparentFormField(
      controller: controller.passwordController,
      hint: AppStrings.password,
      label: AppStrings.password,
      icon: Icons.lock_outline,
      textInputAction: TextInputAction.done,
      isPassword: true,
      radius: 30,
      validator: AppValidators.password,
      autofillHints: [AutofillHints.password],
      focusNode: controller.passwordFocus,
      onFieldSubmitted: (_) {
        FocusScope.of(context).unfocus();
      },
    );
  }

  Widget _signInButton({required bool isSmall}) {
    final pageState = ref.watch(loginProvider).pageState;
    final colorTheme = context.colors;
    return CustomThemeButton(
      isLoading: pageState == PageState.loading,
      color: colorTheme.buttonPrimaryColor,
      radius: 30,
      height: isSmall ? 48 : 56,
      isExpanded: true,
      onTap: () {
        if (_formKey.currentState?.validate() == true) {
          controller.signIn();
        }
      },
      child: Text(
        AppStrings.signIn,
        style: context.textTheme.titleMedium?.copyWith(
          color: Colors.white,
          fontSize: isSmall ? 14 : 16,
        ),
      ),
    );
  }
}

// ── Extracted Logo Widget ──────────────────────────────────────────────────────
class _LogoSection extends StatelessWidget {
  final bool isSmall;
  final bool isMedium;
  final bool isLarge;

  const _LogoSection({required this.isSmall, required this.isMedium,required this.isLarge,});

  @override
  Widget build(BuildContext context) {
    final keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    final logoSize = keyboardOpen
        ? 60.0
        : isSmall
        ? 90.0
        : isMedium
        ? 120.0
        : isLarge
        ? 150.0
        : 200.0;

    final padding = keyboardOpen
        ? 8.0
        : isSmall
        ? 12.0
        : isMedium
        ? 20.0
        : isLarge
        ? 45.0
        : 55.0;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      padding: EdgeInsets.all(padding),
      alignment: Alignment.center,
      child: SizedBox(
        height: logoSize,
        width: logoSize,
        child: WidgetUtils.logoWidget(),
      ),
    );
  }
}