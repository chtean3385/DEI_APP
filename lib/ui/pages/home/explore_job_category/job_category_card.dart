import 'package:dei_champions/constants/app_colors.dart';
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
      child: SizedBox(
        width: 80,
        child: Column(
          children: [
            RainbowBorderAvatar(imageUrl:  categoryModel.image ?? ""),
            const SizedBox(height: 6),
            Text(
              categoryModel.title ?? "",
              style: theme.displaySmall?.copyWith(height: 1,color: Colors.black54),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }

}
class RainbowBorderAvatar extends StatefulWidget {
  final String imageUrl;

  const RainbowBorderAvatar({super.key, required this.imageUrl});

  @override
  State<RainbowBorderAvatar> createState() => _RainbowBorderAvatarState();
}

class _RainbowBorderAvatarState extends State<RainbowBorderAvatar>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Total size = border padding + inner CircleAvatar radius * 2
    const double outerPadding = 3;
    const double innerPadding = 3;
    const double avatarRadius = 30;

    return SizedBox(
      width: (avatarRadius + outerPadding + innerPadding) * 2,
      height: (avatarRadius + outerPadding + innerPadding) * 2,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 🔄 Rotating rainbow border
          RotationTransition(
            turns: controller,
            child: Container(
              padding: const EdgeInsets.all(outerPadding),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: SweepGradient(
                  colors: [
                    Colors.red,
                    Colors.orange,
                    Colors.yellow,
                    Colors.green,
                    Colors.blue,
                    Colors.indigo,
                    Colors.purple,
                    Colors.red,
                  ],
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(innerPadding),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // 🖼️ Static inner image
          CircleAvatar(
            radius: avatarRadius,
            backgroundColor: Colors.white,
            child: RoundedNetworkImage(
              imageUrl: widget.imageUrl,
              width: 35,
              height: 35,
              borderRadius: 8,
            ),
          ),
        ],
      ),
    );
  }
}





class ShimmerJobCategoryCard extends StatelessWidget {
  const ShimmerJobCategoryCard();

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 80,
      child: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2,color: Colors.white)
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: RoundedNetworkImage(
                  imageUrl: "",
                  width: 35,
                  height: 35,
                  borderRadius: 8,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          ColoredBox(
            color: Colors.white,
            child: SizedBox(
              height:10,width: 50,
            ),
          ),

        ],
      ),
    );
  }
}
