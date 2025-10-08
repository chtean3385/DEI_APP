import 'package:flutter/material.dart';

import 'men_alias_title.dart';
import 'men_champion_diversity_.dart';


class MenAliasView extends StatelessWidget {
  const MenAliasView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MenAliasTitle(),
            // EmpowerWomenWorkForce(),
            MenChampionDiversity(),
          ],
        ),
      ),
    );
  }
}
