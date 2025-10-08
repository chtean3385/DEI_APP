import 'package:flutter/material.dart';

import 'become_an_ally.dart';
import 'men_alias_title.dart';
import 'men_champion_diversity_.dart';
import 'organizational_benefits.dart';


class MenAliasView extends StatelessWidget {
  const MenAliasView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MenAliasTitle(),
          OrganizationalBenefits(),
          BecomeAnAlly(),
          MenChampionDiversity(),



        ],
      ),
    );
  }
}
