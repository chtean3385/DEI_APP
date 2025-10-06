import 'package:dei_champions/models/home/featured_employer/employer_model.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_styles.dart';
import '../../../../../widgets/others/view_all_button.dart';

class FeaturedEmployerCard extends StatelessWidget {
  final Employer employer;
  final VoidCallback? onTap;

  const FeaturedEmployerCard({required this.employer, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(12),clipBehavior: Clip.antiAlias,
        child:   Image.asset(employer.logo ?? "", width: 60, height: 60,)

        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     // Logo
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //
        //       children: [
        //         Image.asset(employer.logo ?? "", width: 30, height: 30),
        //         gapW16(),
        //         Flexible(
        //           child: DecoratedBox(
        //             decoration: BoxDecoration(
        //               color: getBadgeColor(employer.badgeClass), // function to map class to color
        //               borderRadius: BorderRadius.circular(16),
        //             ),
        //             child: Padding(
        //               padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
        //               child: Text(
        //                 employer.badge ?? "",
        //                 maxLines: 1,
        //                 softWrap: true,
        //                 overflow: TextOverflow.ellipsis,
        //                 style: theme.displaySmall?.copyWith(
        //                     color: Colors.black, fontSize: 10// text color for contrast
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //
        //       ],
        //     ),
        //     const SizedBox(height: 12),
        //     // Name
        //     Text(
        //       employer.title ?? "",
        //       maxLines: 1,
        //       overflow: TextOverflow.ellipsis,
        //       style: theme.labelMedium,
        //     ),
        //     const SizedBox(height: 8),
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: employer.tags?.map((tag) {
        //         return Padding(
        //           padding: const EdgeInsets.symmetric(vertical: 2),
        //           child: Text(
        //             tag,
        //             style: theme.displaySmall,
        //           ),
        //         );
        //       }).toList() ?? [],
        //     ),
        //
        //
        //     gapH20(),
        //     // View jobs button
        //     ViewAllButton(text: 'View jobs',fillColor: true,radius: 30,isSmall: true,),
        //   ],
        // ),
      ),
    );
  }
}
class ShimmerFeaturedEmployerCard extends StatelessWidget {


  const ShimmerFeaturedEmployerCard();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(12),clipBehavior: Clip.antiAlias,
      child: ColoredBox(
        color: Colors.white,
        child: SizedBox(
          width: 60,height: 60
        ),
      ),
    );
  }
}
Color getBadgeColor(String? badgeClass) {
  switch (badgeClass) {
    case "gold":
      return const Color(0xFFFFD700); // gold
    case "silver":
      return const Color(0xFFC0C0C0); // silver
    case "bronze":
      return const Color(0xFFCD7F32); // bronze
    default:
      return Colors.grey; // fallback
  }
}
