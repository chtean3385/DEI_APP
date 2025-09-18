import 'package:dei_champions/constants/app_drawables.dart';
import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_validators.dart';
import '../../../constants/enums.dart';
import '../../../providers/controllers/employee_login_controller.dart';
import '../../../providers/providers.dart';
import '../../../utils/app_textformfield.dart';
import '../../../utils/widget_utils.dart';
import '../../../constants/app_strings.dart';
import '../../../widgets/others/check_box.dart';
import '../../../widgets/others/custom_theme_button.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignInScreen> {
  late final EmployeeLoginController controller;
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;
  @override
  void initState() {
    super.initState();
    controller = ref.read(loginProvider.notifier);
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double responsivePadding = screenWidth * 0.2;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          backgroundImage(),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(child: Center(child: Padding(
                  padding: EdgeInsets.all(responsivePadding.clamp(16.0, 50.0)),
                  child: WidgetUtils.logoWidget(),
                ))),
                Container(
                  padding: const EdgeInsets.fromLTRB(24, 50, 24, 50),
                  decoration: const BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
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
                            initialValue: false,
                            onChanged: (label, isSelected) {
                              print("$label changed to $isSelected");
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
        ],
      ),
    );
  }

  Widget _signup(){
    return GestureDetector(
      onTap: ()=>AppNavigator.loadCommonSignUp(),
      child: RichText(textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: AppStrings.signupMsg,
              style: context.textTheme.bodyMedium),
            TextSpan(
                text: AppStrings.signupForFree,
                style: context.textTheme.bodyMedium?.copyWith(color: AppColors.primaryColor) )
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
    return AppTextFormField(
      controller: controller.emailNameController,
      label: AppStrings.email,
      validator: AppValidators.email,
      textInputType: TextInputType.emailAddress,
      autofillHints: [AutofillHints.email],
      textInputAction: TextInputAction.next,

    );
  }

  Widget _passwordField() {
    return AppTextFormField(
      controller: controller.passwordController,
      label: AppStrings.password,
      validator: AppValidators.password,
      textInputType: TextInputType.text,
      autofillHints: [AutofillHints.password],
      textInputAction: TextInputAction.next,
    );
  }

  Widget _signInButton() {
    final pageState = ref.watch(loginProvider).pageState;
    return CustomThemeButton(
      isLoading: pageState == PageState.loading,
      color: AppColors.primaryColor,
      radius: 30,
      height: 56,
      isExpanded: true,
      onTap: () {
        if (_formKey.currentState?.validate() == true) {
          controller.signInEmployee();
        }
      },
      child:  Text(
        AppStrings.signIn,
        style: context.textTheme.titleMedium?.copyWith(
          color: context.theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
