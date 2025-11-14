import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/models/job/job_model_api.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_styles.dart';
import '../../../../widgets/others/rounded_network_image.dart';
import '../../search/components/search_job_card.dart';

class JobDetailHeader extends StatelessWidget {
  final JobModelApi jobModel;

  const JobDetailHeader({Key? key, required this.jobModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // Company Logo Placeholder
            jobModel.employer?.companyLogo?.isNotEmpty == true
                ? RoundedNetworkImage(
                    imageUrl: jobModel.employer!.companyLogo!,
                    width: 50,
                    height: 50,
                    borderRadius: 8,
                  )
                : Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        jobModel.employer?.company?[0].toUpperCase() ?? "",
                        style: theme.headlineMedium,
                      ),
                    ),
                  ),
            const SizedBox(width: 16),
            // Job Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(jobModel.title ?? "", style: theme.headlineMedium),
                  const SizedBox(height: 4),
                  Text(
                    jobModel.employer?.company ?? "",
                    style: theme.bodySmall?.copyWith(color: Colors.black54),
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
            Row(
              children: [
                Icon(
                  Icons.work_outline_rounded,
                  size: 24,
                  color: Colors.black54,
                ),
                gapW8(),
                Text(
                  jobModel.jobType ?? "",
                  style: theme.bodyMedium?.copyWith(color: Colors.black54),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.access_time, size: 24, color: Colors.black54),
                gapW8(),
                Text(
                  '${getShortTimeAgo(jobModel.createdAt ?? DateTime.now())}',
                  style: theme.bodyMedium?.copyWith(color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
