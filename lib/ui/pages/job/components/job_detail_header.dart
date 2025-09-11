import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/models/job/job_model.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/others/rounded_network_image.dart';

class JobDetailHeader extends StatelessWidget {
  final JobModel jobModel;

  const JobDetailHeader({
    Key? key,
    required this.jobModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // Company Logo Placeholder
            jobModel.logoUrl.isNotEmpty?  RoundedNetworkImage(
              imageUrl: jobModel.logoUrl,
              width: 50,
              height: 50,
              borderRadius: 8,
            ):
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  jobModel.companyName[0].toUpperCase(),
                    style: theme.headlineMedium
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Job Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    jobModel.title,
                      style: theme.headlineMedium
                  ),
                  const SizedBox(height: 4),
                  Text(
                    jobModel.companyName,
                    style: theme.bodySmall?.copyWith(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Applicants & Posted Info
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '46 applicants',
              style: theme.bodyMedium?.copyWith(color: Colors.black54),

            ),
            Text(
              'Posted ${jobModel.postedTime}',
              style: theme.bodyMedium?.copyWith(color: Colors.black54),

            ),
          ],
        ),
      ],
    );
  }
}
