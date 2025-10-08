import 'package:dei_champions/ui/pages/empower_women/components/women_program.dart';
import 'package:dei_champions/ui/pages/empower_women/components/women_quotes.dart';
import 'package:flutter/material.dart';

import 'empower_women_workforce.dart';


class EmpowerWomenView extends StatelessWidget {
  const EmpowerWomenView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            WomenPrograms(),
            EmpowerWomenWorkForce(),
            WomenQuotes(),
          ],
        ),
      ),
    );
  }
}
