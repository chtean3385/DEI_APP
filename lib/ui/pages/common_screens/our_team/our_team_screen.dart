import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/others/app_bar_common.dart';
import '../components/out_team_view.dart';


class OurTeamScreen extends StatelessWidget {
  const OurTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(title: "Our Team",arrowLeft: true,titleStyleSmall: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(
                "Meet our dedicated team of Diversity, Equity, and Inclusion champions who are committed to creating a more inclusive workplace for everyone.",
                style: context.textTheme.bodyMedium?.copyWith(color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              Expanded(child: OurTeamView()),
            ],
          ),
        ),
      ),
    );
  }
}


