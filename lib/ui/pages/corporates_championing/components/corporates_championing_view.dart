import 'package:dei_champions/ui/pages/corporates_championing/components/ready_to_champion_dei.dart';
import 'package:flutter/material.dart';

import 'corporate_championing_title.dart';
import 'dei_corporates_partner.dart';
import 'dei_for_corporates.dart';


class CorporatesChampioningView extends StatelessWidget {
  const CorporatesChampioningView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CorporatesChampioningTitle(),
          DeiForCorporates(),
          ReadyToJoinChampion(),
          DeiCorporatesPartner()



        ],
      ),
    );
  }
}
