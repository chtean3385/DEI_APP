import 'package:dei_champions/ui/pages/about_us/components/what_we_do.dart';
import 'package:flutter/material.dart';
import 'about_us_header.dart';

class DeiImpacts extends StatelessWidget {
  const DeiImpacts({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [AboutUsHeader(), WhatWeDo()],
        ),
      ),
    );
  }
}
