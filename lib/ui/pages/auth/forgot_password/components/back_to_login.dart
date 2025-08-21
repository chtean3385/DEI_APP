import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class BackToLogin extends StatelessWidget {
  const BackToLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).pop(),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.arrow_back,
            color: Color(0xFF667eea),
            size: 18,
          ),
          const SizedBox(width: 8),
           Text(
            'Back to Login',
            style: context.textTheme.bodySmall?.copyWith(
              color: context.theme.colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }


}
