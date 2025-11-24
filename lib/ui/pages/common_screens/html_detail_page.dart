import 'package:dei_champions/constants/app_theme.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/others/app_bar_common.dart';
import 'components/html_content_view.dart';


class HtmlDetailPage extends StatelessWidget {
  final String title;

  const HtmlDetailPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colors;
    return Scaffold(
      backgroundColor: colorTheme.themBasedWhite,
      appBar: appBarCommon(title: title,arrowLeft: true,titleStyleSmall: true),
      body: SafeArea(child: HtmlContentVIew(pageName: title)),
    );
  }
}







