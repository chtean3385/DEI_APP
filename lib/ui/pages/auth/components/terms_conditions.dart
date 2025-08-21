import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          text: 'By clicking register, you agree to the \n ',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
          children: [
            TextSpan(
              text: 'Terms of Service',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(text: ' and '),
            TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
