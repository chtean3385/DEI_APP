import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';

import 'components/men_alias_view.dart';


class MenAliasScreen extends StatelessWidget {
  const MenAliasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(title: "Men as Allies",arrowLeft: true),
      body: MenAliasView(),
    );
  }
}
