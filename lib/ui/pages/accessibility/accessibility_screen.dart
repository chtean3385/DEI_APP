import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';

import 'accessibility_view.dart';



class AccessibilityScreen extends StatelessWidget {
  const AccessibilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(title: 'Accessibility',titleStyleSmall: true),
      body: const AccessibilityBody(),
    );
  }
}

