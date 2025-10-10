import 'package:flutter/material.dart';

import 'lgbtq_advantages.dart';
import 'lgbtq_inclusion_section.dart';
import 'lgbtq_quote_section.dart';
import 'lgbtq_title_section.dart';

class LgbtqView extends StatelessWidget {
  const LgbtqView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [LgbtqTitleSection(),LgbtqAdvantages(),LgbtqQuoteSection(),LgbtqInclusionSection()],
      ),
    );
  }
}
