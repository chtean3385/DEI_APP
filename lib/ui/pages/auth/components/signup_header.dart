import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_drawables.dart';
import '../../../../constants/app_strings.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),

        // Logo and Title Section
        Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.35),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  AppDrawables.logoWithoutSubtitle,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                AppStrings.appTitle,
                style: context.textTheme.headlineSmall?.copyWith(
                  color: context.theme.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 50),

        // Welcome Text
        const Text(
          'Create Account',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Join thousands of professionals',
          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),

        const SizedBox(height: 40),
      ],
    );
  }
}
