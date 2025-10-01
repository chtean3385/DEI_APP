import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../models/home/job_category/job_category_model.dart';
import '../../../../widgets/others/rounded_network_image.dart';

/// 📌 Individual Job category Card
class JobCategoryCard extends StatelessWidget {
  final JobCategoryMode categoryModel;
  final GestureTapCallback? onTap;


  const JobCategoryCard({
    required this.categoryModel, this.onTap,

  });

  @override
  Widget build(BuildContext context) {
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
          border: Border.all(color: Colors.black12, width: 1),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.43,

          // width: 180, // ~70% of screen width
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [

                    RoundedNetworkImage(
                      imageUrl: categoryModel.image,
                      width: 50,
                      height: 50,
                      borderRadius: 8,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            categoryModel.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  categoryModel.desc,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: context.textTheme.displaySmall?.copyWith(color:Colors.black54 )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
