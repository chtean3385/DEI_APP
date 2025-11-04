import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/ui/pages/search/components/search_job_card.dart';
import 'package:dei_champions/widgets/others/custom_theme_button.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_styles.dart';
import '../../../../models/common/team_member_model.dart';
import '../../../../widgets/others/rounded_network_image.dart';

class OurTeamCard extends StatelessWidget {
  final TeamMemberModel item;
  final VoidCallback? onTap;

  const OurTeamCard({required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      // borderRadius: BorderRadius.circular(10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RoundedNetworkImage(
                imageUrl: item.avatar ?? "",
                height: 70,
                width: 70,
                borderRadius: 35,
              ),
              gapH8(),
              gapH4(),
              Text(
                item.name ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: theme.labelMedium,
                textAlign: TextAlign.center,
              ),
              gapH4(),
              Text(
                item.role ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: theme.displaySmall?.copyWith(
                  color: AppColors.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              gapH4(),
              Text(
                item.bio ?? "",
                softWrap: true,
                style: theme.displaySmall?.copyWith(
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
              gapH4(),
              gapH8(),
              CustomThemeButton(
                child: Text(
                  "Contact",
                  style:theme.bodyMedium?.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                color:AppColors.primaryColor.withValues(alpha: .1),
                borderColor:  AppColors.primaryColor.withValues(alpha: .2),
                radius: 30,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                onTap: () {}, // disable tap for accepted/pending
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerOurTeamCard extends StatelessWidget {
  const ShimmerOurTeamCard();

  Widget build(BuildContext context) {
    return ShimmerLoader(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          border: Border.all(color: Colors.white38, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              ShimmerBox( height: 70,
                width: 70,radius: 35,),
              gapH8(),
              gapH4(),
              ShimmerBox( height: 14,
                width: 100),

              gapH4(),
              ShimmerBox( height: 12,
                  width: 150),

              gapH4(),
              ShimmerBox( height: 10,
                  width: double.infinity),
              gapH4(),
              ShimmerBox( height: 10,
                  width: double.infinity),

              gapH4(),
              gapH8(),
              ShimmerBox( height: 30,
                  width: 100,radius: 30,),

            ],
          ),
        ),
      ),
    );
  }
}
