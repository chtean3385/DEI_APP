import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import 'components/veteran_view.dart';

class VeteranScreen extends StatelessWidget {
  const VeteranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: appBarCommon(title: "Defense Veteran",arrowLeft: true,titleStyleSmall: true),
      body: VeteranView(),
    );
  }
}
