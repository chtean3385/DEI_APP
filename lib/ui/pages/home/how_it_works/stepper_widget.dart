import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../models/home/how_it_works/how_it_work_model.dart';
import 'how_it_works_card.dart';

class HowItWorkTimeline extends StatelessWidget {
  final List<HowItsWorkModel> howItWork;

  const HowItWorkTimeline({super.key, required this.howItWork});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: howItWork.length,
          itemBuilder: (context, index) {
            bool isPassed = 60 >= index * 20;

            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // --- Timeline indicator ---
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: 4,
                          color: index == 0
                              ? Colors.transparent
                              : isPassed
                              ? AppColors.primaryColor.withValues(alpha: .3)
                              : Colors.grey.shade300,
                        ),
                      ),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor:
                            (BootstrapColors.colors["orange"] ?? Colors.black),
                        child: Text(
                          (index + 1).toString(),
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // Line (except for last item)
                      Expanded(
                        child: Container(
                          width: 4,
                          color: index == howItWork.length - 1
                              ? Colors.transparent
                              : isPassed
                              ? AppColors.primaryColor.withValues(alpha: .3)
                              : Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: HowItWorkCard(item: howItWork[index])),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
class ShimmerHowItWorkTimeline extends StatelessWidget {

  const ShimmerHowItWorkTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            bool isPassed = 60 >= index * 20;

            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // --- Timeline indicator ---
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: 4,
                          color: index == 0
                              ? Colors.transparent
                              : isPassed
                              ? AppColors.primaryColor.withValues(alpha: .3)
                              : Colors.grey.shade300,
                        ),
                      ),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor:
                            (BootstrapColors.colors["orange"] ?? Colors.black),
                        child: Text(
                          (index + 1).toString(),
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // Line (except for last item)
                      Expanded(
                        child: Container(
                          width: 4,
                          color: index == 3 - 1
                              ? Colors.transparent
                              : isPassed
                              ? AppColors.primaryColor.withValues(alpha: .3)
                              : Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: ShimmerHowItWorkCard()),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
