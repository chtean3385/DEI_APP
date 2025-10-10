import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import 'components/lgbtq_view.dart';

class LgbtqScreen extends StatelessWidget {
  const LgbtqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: appBarCommon(title: "Shine with Pride",arrowLeft: true,titleStyleSmall: true),
      body: LgbtqView(),
    );
  }
}
