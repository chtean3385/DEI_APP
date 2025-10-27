import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../widgets/others/custom_theme_button.dart';
import '../../../../../widgets/others/rounded_network_image.dart';

class CandidateBasicDetails extends StatelessWidget {
  const CandidateBasicDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RoundedNetworkImage(
            imageUrl:  "https://randomuser.me/api/portraits/men/32.jpg",
            width: 60,
            height: 60,
            borderRadius: 30,
          ),
          const SizedBox(height: 8),
          Text(
            "John Deo",
            style: context.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Software Engineer, Dreams Technology",
            style: context.textTheme.labelLarge?.copyWith(
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Having more than 10 years of experience. A BCA graduate with a passion for developing scalable web applications and working on both the front-end andback-end of software projects. Completed several academic projects using mern technologies showcasing afoundational ",
            style: context.textTheme.displaySmall?.copyWith(
              color: Colors.black54,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomThemeButton(
                color:BootstrapColors.colors["green"] ??
                    AppColors.primaryColor,
                borderColor:BootstrapColors.colors["green"] ??
                    AppColors.primaryColor,
                radius: 30,
                isExpanded: false,
                alignRight: false,
                padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                onTap: () {
                },
                child: Text(
                  "Active",
                  style: context.textTheme.labelMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              CustomThemeButton(
                color:
                AppColors.bg,
                borderColor:
                AppColors.bg,
                radius: 30,
                isExpanded: false,
                alignRight: false,
                padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                onTap: () {
                },
                child: Text(
                  "Not Verified",
                  style: context.textTheme.displaySmall?.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          )


        ],
      ),
    );
  }
}

