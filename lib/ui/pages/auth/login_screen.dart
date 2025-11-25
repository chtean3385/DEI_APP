import 'package:dei_champions/constants/app_drawables.dart';
import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../constants/app_colors.dart';
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
    return Scaffold(
      backgroundColor: colorTheme.jobCardBgColor,
      resizeToAvoidBottomInset: true,
      body:SafeArea(
        child: LayoutBuilder(
            builder: (context, constraints)  {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Form(
                  key: _formKey,
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Expanded(child: Center(child: SizedBox(
                        height: 200,width: 200,
                          child: WidgetUtils.logoWidget(),
                        ))),
                        Container(
                          padding: const EdgeInsets.fromLTRB(24, 50, 24, 50),
                          decoration:  BoxDecoration(
                            color: colorTheme.commonDividerBgColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: colorTheme.black45, // subtle shadow color
                                offset: Offset(0, -4), // negative Y offset = shadow on top
                                blurRadius: 8, // softness of shadow
                                spreadRadius: 1, // optional: how much the shadow spreads
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                AppStrings.loginTitle,
                                style: context.textTheme.titleLarge,
                              ),
                              const SizedBox(height: 30),
                              _emailField(),
                              const SizedBox(height: 16),
                              _passwordField(),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomCheckbox(
                                    label: "Remember Me",
                                    initialValue: state.rememberMe,
                                    onChanged: (label, isSelected) {
                                      print("$label changed to $isSelected");
                                      controller.toggleRememberMe(isSelected);
                                    },
                                  ),
                                  GestureDetector(
                                    onTap: AppNavigator.loadForgotPasswordScreen,
                                    child: Text(
                                      AppStrings.forgotPassword,
                                      style: context.textTheme.bodyMedium?.copyWith(color: AppColors.primaryColor),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              _signInButton(),
                              const SizedBox(height: 30),
                              _signup(),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  Widget _signup(){
    return GestureDetector(
      onTap: ()=>AppNavigator.loadSignUpScreen(),
      child: RichText(textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: AppStrings.signupMsg,
              style: context.textTheme.bodyMedium),
            TextSpan(
                text: AppStrings.signupForFree,
                style: context.textTheme.bodyMedium?.copyWith(color: context.colors.buttonPrimaryColor) )
        ]),
      ),
    );
  }

  Widget backgroundImage() {
    return Image.asset(
      AppDrawables.loginBg,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    );
  }



  Widget _emailField() {

    return  EmailSuggestionFieldLogin(
      controller:controller.emailNameController,
      hint: AppStrings.email,
      label: AppStrings.email,
    );
  }

  Widget _passwordField() {

   return TransparentFormField(
      controller: controller.passwordController,
      hint: AppStrings.password,
      label: AppStrings.password,
      icon: Icons.lock_outline,
      textInputAction: TextInputAction.next,
      isPassword: true,
      radius: 30,
      validator: AppValidators.password,
     autofillHints: [AutofillHints.password],
    );
  }

  Widget _signInButton() {
    final pageState = ref.watch(loginProvider).pageState;
    final colorTheme = context.colors;
    return CustomThemeButton(
      isLoading: pageState == PageState.loading,
      color: colorTheme.buttonPrimaryColor,
      radius: 30,
      height: 56,
      isExpanded: true,
      onTap: () {
        if (_formKey.currentState?.validate() == true) {
          controller.signIn();
        }
      },
      child:  Text(
        AppStrings.signIn,
        style: context.textTheme.titleMedium?.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
