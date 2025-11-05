import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import '../../../../widgets/others/app_bar_common.dart';
import '../components/out_team_view.dart';


class OurTeamScreen extends StatelessWidget {
  const OurTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(title: "Our Team",arrowLeft: true,titleStyleSmall: true),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColoredBox(
              color: AppColors.bg,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "DEI Champions",
                      style: context.textTheme.titleMedium?.copyWith(color:AppColors.primaryColor),
                      textAlign: TextAlign.left,
                    ),
                    gapH8(),
                    Text(
                      "Meet our dedicated team of Diversity, Equity, and Inclusion champions who are committed to creating a more inclusive workplace for everyone.",
                      style: context.textTheme.bodyMedium?.copyWith(color: Colors.black54),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: OurTeamView()),
          ],
        ),
      ),
    );
  }
}


