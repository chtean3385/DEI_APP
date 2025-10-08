import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import 'components/empower_women_view.dart';

class EmpowerWomenScreen extends StatelessWidget {
  const EmpowerWomenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: appBarCommon(title: "Empower Women",arrowLeft: true),
      body: EmpowerWomenView(),
    );
  }
}
