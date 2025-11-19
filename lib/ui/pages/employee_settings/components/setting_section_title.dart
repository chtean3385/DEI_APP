import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String text;

  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
      child: Text(
        text,
        style: context.textTheme.labelMedium?.copyWith(color: Colors.grey),
      ),
    );
  }
}