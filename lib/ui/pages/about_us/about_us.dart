import 'package:flutter/material.dart';

import '../../../widgets/others/app_bar_common.dart';
import 'components/about_us_view.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(title: "About Us", arrowLeft: true,titleStyleSmall: true),
      body: AboutUsView(),
    );
  }
}
