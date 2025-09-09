import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/ui/pages/auth/signup/role_selection_view.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_strings.dart';
import '../../../../../widgets/others/custom_theme_button.dart';
import '../../../../utils/widget_utils.dart';

class ChooseSignupType extends StatefulWidget {
  const ChooseSignupType({super.key});

  @override
  State<ChooseSignupType> createState() => _ChooseSignupTypeState();
}

class _ChooseSignupTypeState extends State<ChooseSignupType> {
  final otherInfoFormKey = GlobalKey<FormState>();
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double responsivePadding = screenWidth * 0.2;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Form(
        key: otherInfoFormKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(responsivePadding.clamp(16.0, 50.0)),
                child: WidgetUtils.logoWidget(),
              ),
              Text(
                "Sign Up as",
                textAlign: TextAlign.center,
                style: context.textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),
              Text(
                "Are you an Employee or an Employer?",
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium?.copyWith(color: Colors.black54),
              ),

              gapH16(),
              gapH16(),
              RoleSelectionView(
                formKey: otherInfoFormKey,
                onRoleChanged: (value) {
                  setState(() {
                    selectedRole = value;
                    debugPrint("Selected Role: $selectedRole");
                  });
                },
              ),
              gap100(),
              _nextButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nextButton() {
    return CustomThemeButton(
      color: AppColors.primaryColor,
      height: 56,
      radius: 16,
      isExpanded: false,
      onTap: () {
        if (otherInfoFormKey.currentState?.validate() == true) {
          selectedRole == "employer" ? AppNavigator.loadEmployerSignUpScreen() : AppNavigator.loadSignUpScreen();
        }
      },
      child: Text(
        AppStrings.proceed,
        style: context.textTheme.titleMedium?.copyWith(
          color: context.theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
