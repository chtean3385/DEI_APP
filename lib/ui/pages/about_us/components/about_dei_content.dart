import 'package:dei_champions/widgets/others/rounded_network_image.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_styles.dart';
import 'impact_card.dart';

class AboutDeiContent extends StatelessWidget {
  final String description;
  final String backgroundImage;
  final String jobsPromoted;
  final String employers;
  const AboutDeiContent({super.key, required this.description,required this.backgroundImage, required this.jobsPromoted, required this.employers});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.bottomCenter,
      children: [
        RoundedNetworkImage(
          imageUrl: backgroundImage,
          width: double.infinity,
          height: 250,
          borderRadius: 0,
        ),
        // Overlay
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.black.withValues(
              alpha: 0.3,
            ), // Adjust opacity as needed
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                description,
                style: context.textTheme.displaySmall?.copyWith(
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
              gapH16(),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ImpactCard(
                      title: "Jobs Promoted",
                      value:jobsPromoted,
                    ),
                  ),
                  gapW16(),
                  Expanded(
                    flex: 1,
                    child: ImpactCard(
                      title: "Inclusive Employers",
                      value:employers,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
