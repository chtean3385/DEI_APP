import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import 'components/career_explorers_view.dart';


class CareerExplorersScreen extends StatelessWidget {
  const CareerExplorersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(title: "Career Explorers",arrowLeft: true,titleStyleSmall: true),
      backgroundColor: AppColors.bg,
      body: CareerExplorersView(),
    );
  }
}
