import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class AboutDeiContent extends StatelessWidget {
  final String description;
  const AboutDeiContent({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.bg,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          description,
          style: context.textTheme.displaySmall?.copyWith(
            color: Colors.black87,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
