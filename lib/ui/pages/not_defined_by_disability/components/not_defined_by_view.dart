import 'package:flutter/material.dart';

import 'disability_inclusion_stesps_section.dart';
import 'disability_title_section.dart';

class NotDefinedByView extends StatelessWidget {
  const NotDefinedByView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [DisabilityTitleSection(), DisabilityInclusionStepsSection()],
      ),
    );
  }
}
