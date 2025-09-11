import 'package:dei_champions/models/job/job_model.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_styles.dart';
import '../../../../../widgets/others/rounded_network_image.dart';

/// 📌 Single Job Card
class JobCard extends StatelessWidget {
  final JobModel jobModel;
  final GestureTapCallback? onTap;

  const JobCard({super.key, required this.jobModel, this.onTap});

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
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Company logo placeholder
                RoundedNetworkImage(
                  imageUrl: jobModel.logoUrl,
                  width: 40,
                  height: 40,
                  borderRadius: 8,
                ),

                const SizedBox(height: 8),
                Text(
                  jobModel.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.labelMedium,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    // 🏢 Company Name
                    Flexible(
                      child: Text(
                        jobModel.companyName,
                        style: theme.displaySmall?.copyWith(
                          color: Colors.black45,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    const SizedBox(width: 6),

                    // ⭐ Star + rating
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 16),
                        const SizedBox(width: 2),
                        Text(
                          jobModel.rating?.toString() ?? "",
                          style: theme.displaySmall?.copyWith(
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                gapH20(),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        jobModel.location,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  jobModel.postedTime,
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 11),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
