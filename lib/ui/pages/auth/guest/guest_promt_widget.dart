import 'package:dei_champions/constants/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_drawables.dart';
import '../../../../constants/app_navigator.dart';
import '../../../../widgets/others/custom_theme_button.dart';

class GuestPromptWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final bool? isGoBack;
  final bool hideButton;
  final bool showSignupButton;

  const GuestPromptWidget({
    super.key,
    this.title,
    this.subTitle,
    this.isGoBack = false,
    this.hideButton = false,
    this.showSignupButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = context.colors;
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.symmetric(horizontal: 50),
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
                      height: 100,
                    ),

                    const SizedBox(height: 24),

                    // Title
                    Text(
                      title ?? "Sign in to Continue",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorTheme.black87,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Subtitle
                    Text(
                      subTitle ?? "Sign in to explore jobs and track your applications.",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorTheme.grey600,
                        fontSize: 12,
                      ),
                    ),


                    const SizedBox(height: 16),

                    // Sign In button

                      CustomThemeButton(
                        color: colorTheme.buttonPrimaryColor,
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
                        color: colorTheme.buttonPrimaryColor,
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
                  if(showSignupButton)  GestureDetector(
                      onTap: () => AppNavigator.loadSignUpScreen(), // TODO: your sign up route
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Don't have an account? ",
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorTheme.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: "Sign Up",
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorTheme.buttonPrimaryColor,
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