import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/ui/pages/about_us/components/impact_card.dart';
import 'package:dei_champions/ui/pages/about_us/components/what_we_do.dart';
import 'package:flutter/material.dart';

import 'about_dei_content.dart';

class DeiImpacts extends StatelessWidget {
  const DeiImpacts({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AboutDeiContent(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ImpactCard(
                      title: "Jobs Promoted",
                      value: "+1,20,0000",
                    ),
                  ),
                  gapW16(),
                  Expanded(
                    flex: 1,
                    child: ImpactCard(
                      title: "Inclusive Employers",
                      value: "5000+",
                    ),
                  ),
                ],
              ),
            ),
            WhatWeDo(
              title: "What We Do",
              details:
                  "We connect diverse talent — from women returnees to neurodiverse professionals — with companies that care about building inclusive teams. Our platform curates DEI-certified jobs, offers tools like resume optimization, and creates a safe space for equitable hiring journeys. We connect diverse talent — from women returnees to neurodiverse professionals — with companies that care about building inclusive teams. Our platform curates DEI-certified jobs, offers tools like resume optimization, and creates a safe space for equitable hiring journeys. We connect diverse talent — from women returnees to neurodiverse professionals — with companies that care about building inclusive teams. Our platform curates DEI-certified jobs, offers tools like resume optimization, and creates a safe space for equitable hiring journeys.",
            ),
          ],
        ),
      ),
    );
  }
}
