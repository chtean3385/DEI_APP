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
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),
        Text(
          'Join thousands of professionals',
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium?.copyWith(color: Colors.black54),
        ),

        const SizedBox(height: 40),
      ],
    );
  }
}
class SignupHeaderSmall extends StatelessWidget {
  final String title;
  final String subTitle;
  const SignupHeaderSmall({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        // Welcome Text
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.textTheme.headlineMedium?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium?.copyWith(color: Colors.black54),
        ),

        const SizedBox(height: 10),
      ],
    );
  }
}
class SignupHeaderEmployer extends StatelessWidget {
  const SignupHeaderEmployer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),

        // Welcome Text
        Text(
          'Create Account as Job Poster',
          textAlign: TextAlign.center,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),
        Text(
          'Register to post jobs and find the best talent for your organization',
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium?.copyWith(color: Colors.black54),
        ),

        const SizedBox(height: 40),
      ],
    );
  }
}
