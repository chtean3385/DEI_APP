import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/widgets/others/custom_decorated_box.dart';
import 'package:flutter/material.dart';

import '../../../../models/job/job_model.dart';
import '../../../../widgets/others/rounded_network_image.dart';

class InvitesJobCard extends StatelessWidget {
  final JobModel job;
  final GestureTapCallback? onTap;

  const InvitesJobCard({super.key, required this.job, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap:onTap ,
      child: CustomDecoratedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDecoratedBox(
              color: AppColors.bg,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Job Title
                  Text(job.title, style: theme.titleMedium),
                  const SizedBox(height: 6),

                  /// Location
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          job.location,
                          style: theme.bodyMedium?.copyWith(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  /// Experience + Salary
                  Row(
                    children: [
                      const Icon(
                        Icons.work_outline,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        job.experience,
                        style: theme.bodyMedium?.copyWith(color: Colors.black54),
                      ),
                      const SizedBox(width: 12),
                      const Icon(
                        Icons.currency_rupee,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        job.salary,
                        style: theme.bodyMedium?.copyWith(color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            gapH16(),

            /// Company details
            Row(
              children: [
                /// Company Logo Placeholder
                job.logoUrl.isNotEmpty
                    ? RoundedNetworkImage(
                        imageUrl: job.logoUrl,
                        width: 40,
                        height: 40,
                        borderRadius: 8,
                      )
                    : Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            job.companyName[0].toUpperCase(),
                            style: theme.headlineMedium,
                          ),
                        ),
                      ),
                const SizedBox(width: 10),

                /// Company Name + Rating
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(job.companyName, style: theme.bodyMedium),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 14, color: Colors.orange),
                        const SizedBox(width: 2),
                        Text(
                          "${job.rating} (${job.reviews} Reviews)",
                          style: theme.displaySmall?.copyWith(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),

                /// Posted Date
                Text(
                  job.postedDate ?? "",
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),

            const SizedBox(height: 10),

            /// Walk-in Tag
            if (job.isWalkIn != null)
              DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.bg,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.primaryColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  child: Text(
                    "Walk-in",
                    style: theme.displaySmall?.copyWith(color: Colors.black54),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
