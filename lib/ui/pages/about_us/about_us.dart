import 'package:dei_champions/constants/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../networks/api_urls.dart';
import '../../../widgets/others/app_bar_common.dart';
import 'components/about_us_web_view.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.themBasedWhite,
      appBar: appBarCommon(title: "About Us", arrowLeft: true,titleStyleSmall: true),
      body: WebViewPage(pageUrl: ApiUrls.aboutUsPage,)
    );
  }
}
