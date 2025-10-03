import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/models/home/friendly_industries/friendly_industry_model.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_styles.dart';
import '../../../../../widgets/others/view_all_button.dart';

class DeiFriendlyIndustryCard extends StatelessWidget {
  final FriendlyIndustry employer;
  final VoidCallback? onTap;

  const DeiFriendlyIndustryCard({required this.employer, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(6),
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(16),
          ),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: SizedBox(
          width: 250,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(employer.icon, width: 30, height: 30),
                gapH8(),
                Text(
                  employer.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.labelMedium,
                ),
                gapH4(),
                Flexible(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: getBootStrapColor(employer.badge.color ), // function to map class to color
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
                      child: Text(
                        employer.badge.text,
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: theme.displaySmall?.copyWith(
                          color: Colors.white, fontSize: 10// text color for contrast
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  employer.description,
                  style: theme.displaySmall?.copyWith( color: Colors.black45,),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_city_outlined, size: 14,
                      color: Colors.grey.shade600,),
                    gapW6(),
                    Text(
                      employer.location,
                      style: theme.displaySmall?.copyWith( color: Colors.black45),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // View jobs button
                ViewAllButton(text: employer.jobs,isSmall: true,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class ShimmerDeiFriendlyIndustryCard extends StatelessWidget {


  const ShimmerDeiFriendlyIndustryCard();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(6),
          bottomLeft: Radius.circular(6),
          bottomRight: Radius.circular(16),
        ),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: SizedBox(
        width: 250,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              ColoredBox(
                color: Colors.white,
                child: SizedBox(
                  height:30,width: 30,
                ),
              ),

              gapH8(),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(
                  height:14,width: 200,
                ),
              ),
              gapH8(),
              Flexible(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white, // function to map class to color
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
                      child:  ColoredBox(
                        color: Colors.white,
                        child: SizedBox(
                          height:10,width: 100,
                        ),
                      )
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(
                  height: 10,
                  width: 150,
                ),
              ),
              const SizedBox(height: 8),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(
                  height: 10,
                  width: 150,
                ),
              ),
              const SizedBox(height: 8),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(
                  height: 10,
                  width: 150,
                ),
              ),
              const SizedBox(height: 10),

              gapH20(),
              // View jobs button
              ViewAllButton(text: 'xxxx+ Open jobs'),
            ],
          ),
        ),
      ),
    );
  }
}
Color getBootStrapColor(String? colorKey) {
  return BootstrapColors.colors[colorKey] ?? Colors.grey;
}

