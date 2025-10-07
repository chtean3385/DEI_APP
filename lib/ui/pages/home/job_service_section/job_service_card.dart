import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/models/home/job_services/job_service_model.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/others/rounded_network_image.dart';
import '../../../../widgets/others/view_all_button.dart';

class JobServiceCard extends StatelessWidget {
  final JobServiceModel jobServiceModel;
  final GestureTapCallback? onTap;
  final Color color;
  final double width;

  const JobServiceCard({
    required this.jobServiceModel,
    this.onTap,
    required this.color,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.transparent, width: 1),
        ),
        child: SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RoundedNetworkImage(
                  imageUrl: jobServiceModel.image,
                  width: 50,
                  height: 50,
                  borderRadius: 8,
                ),
                gapH8(),
                Text(
                  jobServiceModel.title,
                  style: theme.labelMedium,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerJobServiceCard extends StatelessWidget {
  const ShimmerJobServiceCard();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: SizedBox(
        width: 170,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RoundedNetworkImage(
                imageUrl: "",
                width: 50,
                height: 50,
                borderRadius: 8,
              ),
              gapH8(),
              const SizedBox(height: 6),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(height: 10, width: 170),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
