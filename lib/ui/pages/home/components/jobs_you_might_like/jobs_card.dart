import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_styles.dart';
import '../../../../../models/job/job_model_api.dart';
import '../../../../../widgets/others/rounded_network_image.dart';
import '../../../search/components/search_job_card.dart';

/// 📌 Single Job Card
class RecommendedJobCard extends StatelessWidget {
  final JobModelApi jobModel;
  final GestureTapCallback? onTap;

  const RecommendedJobCard({super.key, required this.jobModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.65,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(6),
              bottomLeft: Radius.circular(6),
              bottomRight: Radius.circular(16),
            ),
            side: BorderSide(color: Colors.black12, width: 1),
          ),
          elevation: 0,
          color: Colors.white,
          margin: const EdgeInsets.only(right: 12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Company logo placeholder
                RoundedNetworkImage(
                  imageUrl: jobModel.employer?.companyLogo ?? "",
                  width: 50,
                  height: 50,
                  borderRadius: 8,
                ),
                const SizedBox(height: 8),
                Text(
                  jobModel.title ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.labelMedium,
                ),
                const SizedBox(height: 4),
                Flexible(
                  child: Text(
                    jobModel.employer?.company ?? "",
                    style: theme.displaySmall?.copyWith(
                      color: AppColors.primaryColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                const SizedBox(height: 12),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: Colors.black54,
                    ),
                    SizedBox(width: 4),
                    Text(
                      jobModel.state ?? "",
                      style: theme.displaySmall?.copyWith(color: Colors.black54),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      Icons.work_history_outlined,
                      size: 16,
                      color: Colors.black54,
                    ),
                    SizedBox(width: 4),
                    Text(
                      jobModel.jobType ?? "",
                      style: theme.displaySmall?.copyWith(color: Colors.black54),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 5),
                        Text(
                          "₹",
                          style: theme.labelMedium?.copyWith(
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          jobModel.salary ?? "",
                          style: theme.displaySmall?.copyWith(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 14,
                          color: Colors.black54,
                        ),
                        gapW4(),
                        Text(
                          " ${getTimeAgo(jobModel.createdAt ?? DateTime.now())}",
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: theme.displaySmall?.copyWith(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class ShimmerRecommendedJobCard extends StatelessWidget {

  const ShimmerRecommendedJobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(6),
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(16),
          ),
          side: const BorderSide(color: Colors.white, width: 2),
        ),
        elevation: 0,
        margin: const EdgeInsets.only(right: 12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company logo placeholder
              ShimmerBox(height: 50, width: 50, radius: 8),
              const SizedBox(height: 8),
              ShimmerBox(height: 14, width: 160),
              const SizedBox(height: 4),
              ShimmerBox(height: 12, width: 100),

              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 6),
                  ShimmerBox(height: 10, width: 80),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 6),
                  ShimmerBox(height: 10, width: 80),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 6),
                      ShimmerBox(height: 10, width: 80),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 6),
                      ShimmerBox(height: 10, width: 80),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
