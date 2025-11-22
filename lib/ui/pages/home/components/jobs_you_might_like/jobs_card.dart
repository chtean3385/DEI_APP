import 'package:dei_champions/constants/app_theme.dart';
import 'package:flutter/material.dart';

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
    final colorTheme = context.colors;
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
            side: BorderSide(color: colorTheme.black12, width: 1),
          ),
          elevation: 0,
          color: colorTheme.cardBgColor,
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
                        fontSize: 13
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                const SizedBox(height:8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: colorTheme.black54,
                    ),
                    SizedBox(width: 4),
                    Text(
                      jobModel.state ?? "",
                      style: theme.displaySmall?.copyWith(color: colorTheme.black54,fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  " ${getShortTimeAgo(jobModel.createdAt ?? DateTime.now())}",
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: theme.displaySmall?.copyWith(
                    color: colorTheme.black45,
                  ),
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
              ShimmerBox(height: 14, width: 200),
              const SizedBox(height: 4),
              ShimmerBox(height: 12, width: 150),

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
              Spacer(),
              ShimmerBox(height: 10, width: 80),
            ],
          ),
        ),
      ),
    );
  }
}
