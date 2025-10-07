
import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class AboutDeiContent extends StatelessWidget {
  const AboutDeiContent({super.key});

  @override
  Widget build(BuildContext context) {
    return  ColoredBox(
      color:  AppColors.bg ,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "DEI Champion is India’s pioneering platform championing inclusive hiring. We collaborate with top companies committed to diversity, equity, and inclusion, offering equal opportunities across gender, disability, neurodiversity, and LGBTQ+ communities. lol it wokrs",
        style: context.textTheme.displaySmall?.copyWith(color: Colors.black87),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
