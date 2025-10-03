import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../models/home/job_category/job_category_model.dart';
import '../../../../widgets/others/rounded_network_image.dart';
import '../../../../widgets/others/view_all_button.dart';

/// 📌 Individual Job category Card
class JobCategoryCard extends StatelessWidget {
  final JobCategoryMode categoryModel;
  final GestureTapCallback? onTap;

  const JobCategoryCard({required this.categoryModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
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
          width: 180,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RoundedNetworkImage(
                  imageUrl: categoryModel.image,
                  width: 35,
                  height: 35,
                  borderRadius: 8,
                ),
                const SizedBox(height: 12),
                Text(
                  categoryModel.title,
                  style: theme.labelMedium,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                const SizedBox(height: 6),

                Text(
                  categoryModel.desc,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: context.textTheme.displaySmall?.copyWith(
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 12),

                ViewAllButton(text: 'View jobs', isSmall: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerJobCategoryCard extends StatelessWidget {
  const ShimmerJobCategoryCard();

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
        width: 180,
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
              const SizedBox(height: 12),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(
                  height:14,width: 100,
                ),
              ),

              const SizedBox(height: 6),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(
                  height:10,width: 170,
                ),
              ),
              const SizedBox(height: 2),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(
                  height:10,width: 150,
                ),
              ),
              const SizedBox(height: 2),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(
                  height:10,width: 170,
                ),
              ),
              const SizedBox(height: 12),

              ViewAllButton(text: 'View jobs', isSmall: true),
            ],
          ),
        ),
      ),
    );
  }
}
