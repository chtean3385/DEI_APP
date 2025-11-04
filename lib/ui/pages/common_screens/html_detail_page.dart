import 'package:flutter/material.dart';
import '../../../../widgets/others/app_bar_common.dart';
import 'components/html_content_view.dart';


class HtmlDetailPage extends StatelessWidget {
  final String title;

  const HtmlDetailPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommon(title: title),
      body: SafeArea(child: HtmlContentVIew(pageName: title)),
    );
  }
}


IconData _getIconForPage(String title) {
  switch (title) {
    case 'Privacy Policy':
      return Icons.privacy_tip_rounded;
    case 'About Us':
      return Icons.info_rounded;
    case 'Terms & Conditions':
      return Icons.description_rounded;
    default:
      return Icons.article_rounded;
  }
}




