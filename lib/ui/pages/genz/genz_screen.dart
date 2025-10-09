import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import 'components/genz_view.dart';

class GenZScreen extends StatelessWidget {
  const GenZScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: appBarCommon(title: "Gen Z",arrowLeft: true),
      body: GenZView(),
    );
  }
}
