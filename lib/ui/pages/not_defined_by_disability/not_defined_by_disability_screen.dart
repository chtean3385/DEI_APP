import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import 'components/not_defined_by_view.dart';

class NotDefinedByDisabilityScreen extends StatelessWidget {
  const NotDefinedByDisabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: appBarCommon(title: "Not defined by Disability",arrowLeft: true,titleStyleSmall: true),
      body: NotDefinedByView(),
    );
  }
}
