import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import 'components/corporates_championing_view.dart';


class CorporatesChampioningScreen extends StatelessWidget {
  const CorporatesChampioningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(title: "Corporates Championing",arrowLeft: true,titleStyleSmall: true),
      backgroundColor: AppColors.bg,
      body: CorporatesChampioningView(),
    );
  }
}
