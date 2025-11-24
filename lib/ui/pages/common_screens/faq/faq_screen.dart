import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import '../../../../constants/app_colors.dart';
import '../../../../widgets/others/app_bar_common.dart';
import '../components/faq_view.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colors;
    return Scaffold(
      appBar: appBarCommon(
        title: "FAQ",
        arrowLeft: true,
        titleStyleSmall: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColoredBox(
              color: colorTheme.commonBg2Color,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Frequently Asked Questions",
                        style: context.textTheme.titleMedium?.copyWith(
                          color: colorTheme.buttonPrimaryColor,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      gapH8(),
                      Text(
                        "Find answers to common questions about our platform. Learn how to use our job portal effectively and get the most out of your experience.",
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: colorTheme.black54,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(child: FaqView()),
          ],
        ),
      ),
    );
  }
}
