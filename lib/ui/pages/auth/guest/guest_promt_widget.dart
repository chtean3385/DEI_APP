import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_drawables.dart';
import '../../../../constants/app_navigator.dart';
import '../../../../widgets/others/custom_theme_button.dart';

class GuestPromptWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final bool? isGoBack;
  final bool hideButton;

  const GuestPromptWidget({
    super.key,
    this.title,
    this.subTitle,
    this.isGoBack = false,
    this.hideButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Illustration
                    Image.asset(
                      AppDrawables.logo,
                      height: 200,
                    ),

                    const SizedBox(height: 24),

                    // Title
                    Text(
                      title ?? "Sign in to Continue",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Subtitle
                    Text(
                      subTitle ?? "Sign in to view your order history\nand track current orders.",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey.shade500,
                        fontSize: 12,
                      ),
                    ),


                    const SizedBox(height: 16),

                    // Sign In button

                      CustomThemeButton(
                        color: AppColors.primaryColor,
                        radius: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        onTap: () => AppNavigator.loadSignInScreen(), // TODO: your sign in route
                        child:  Text(
                          "Sign In",
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),

                        ),
                      ),

                    const SizedBox(height: 16),

                    // Go Back button
                    if (isGoBack == true)
                      CustomThemeButton(
                        color: AppColors.primaryColor,
                        radius: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        onTap: () => Navigator.pop(context),
                        child:  Text(
                          "Go Back",
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                    const SizedBox(height: 16),

                    // Sign Up link
                    GestureDetector(
                      onTap: () => AppNavigator.loadSignUpScreen(), // TODO: your sign up route
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Don't have an account? ",
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: "Sign Up",
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}