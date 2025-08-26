import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_drawables.dart';
import '../../../../../constants/app_strings.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),

        // Welcome Text
        Text(
          'Create Account',
          textAlign: TextAlign.center,
          style: context.textTheme.headlineLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),
        Text(
          'Join thousands of professionals',
          textAlign: TextAlign.center,
          style: context.textTheme.bodySmall?.copyWith(color: Colors.white70),
        ),

        const SizedBox(height: 40),
      ],
    );
  }
}
