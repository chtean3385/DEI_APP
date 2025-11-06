import 'package:flutter/material.dart';

import 'csr_banner_section.dart';
import 'csr_focus_points.dart';
import 'csr_objective_section.dart';

class CsrView extends StatelessWidget {
  const CsrView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CsrBannerSection(),
          CsrObjectiveSection(),
          CsrFocusPoints(),
          // LgbtqInclusionSection()
        ],
      ),
    );
  }
}
