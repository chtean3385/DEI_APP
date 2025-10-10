import 'package:dei_champions/ui/pages/veteran/components/veteran_advantages.dart';
import 'package:dei_champions/ui/pages/veteran/components/veteran_organizational_benefits.dart';
import 'package:dei_champions/ui/pages/veteran/components/veteran_roles.dart';
import 'package:dei_champions/ui/pages/veteran/components/veteran_title_section.dart';
import 'package:flutter/material.dart';

class VeteranView extends StatelessWidget {
  const VeteranView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [VeteranTitleSection(),VeteranAdvantages(),VeteranRolesSection(),VeteranOrganizationalBenefits()],
      ),
    );
  }
}
