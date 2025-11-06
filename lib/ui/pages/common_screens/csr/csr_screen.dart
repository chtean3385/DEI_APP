import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import 'components/csr_view.dart';

class CsrScreen extends StatelessWidget {
  const CsrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: appBarCommon(title: "CSR",arrowLeft: true,titleStyleSmall: true),
      body: CsrView(),
    );
  }
}
