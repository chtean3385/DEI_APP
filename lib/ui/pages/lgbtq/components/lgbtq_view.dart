import 'package:flutter/material.dart';

import 'lgbtq_title_section.dart';

class LgbtqView extends StatelessWidget {
  const LgbtqView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [LgbtqTitleSection()],
      ),
    );
  }
}
