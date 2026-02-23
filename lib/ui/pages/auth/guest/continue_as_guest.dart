import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class GuestLoginSection extends StatelessWidget {
  final VoidCallback onGuestTap;

  const GuestLoginSection({
    super.key,
    required this.onGuestTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min,
      children: [
        _orDivider(context),
        const SizedBox(height: 8),
        _continueAsGuestButton(context),
      ],
    );
  }

  Widget _orDivider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 16),
      child: Row(
        children: [
          const Expanded(child: Divider(thickness: 1, color: Color(0xFFE0E0E0))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "or",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey,
              ),
            ),
          ),
          const Expanded(child: Divider(thickness: 1, color: Color(0xFFE0E0E0))),
        ],
      ),
    );
  }

  Widget _continueAsGuestButton(BuildContext context) {
    return  GestureDetector(
      onTap: onGuestTap,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: "Continue as ",
              style: context.textTheme.bodyMedium,
            ),
            TextSpan(
              text: "Guest User",
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colors.buttonPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}