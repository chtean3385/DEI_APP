import 'package:dei_champions/main.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../../constants/app_colors.dart';
import '../../../../../../constants/app_styles.dart';
import '../../../../../../widgets/others/rounded_network_image.dart';
import '../../../../../models/employer/candidate_model.dart';

class CandidateCard extends StatelessWidget {
  final CandidateModel candidateModel;
  final GestureTapCallback? onTap;

  const CandidateCard({super.key, required this.candidateModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Card(
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
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    candidateModel.title,
                    style: theme.labelMedium?.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                gapW8(),

                RoundedNetworkImage(
                  imageUrl: candidateModel.logoUrl,
                  width: 50,
                  height: 50,
                  borderRadius: 8,
                ),
              ],
            ),

            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 20,
                  color: Colors.black54,
                ),
                SizedBox(width: 4),
                Text(
                  candidateModel.location,
                  style: theme.bodyMedium?.copyWith(color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(
                  Icons.work_history_outlined,
                  size: 20,
                  color: Colors.black54,
                ),
                SizedBox(width: 4),
                Text(
                  candidateModel.jobType,
                  style: theme.bodyMedium?.copyWith(color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.timelapse_sharp,
                        size: 20,
                        color: Colors.black54,
                      ),
                      SizedBox(width: 4),
                      Text(
                        candidateModel.postedTime,
                        style: theme.bodyMedium?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.currency_rupee, size: 14, color: Colors.black54),
                    gapW2(),
                    Text(
                      "${candidateModel.hourlyRate.toStringAsFixed(1)}/ hr",
                      style: theme.labelMedium?.copyWith(
                        color: AppColors.primaryColor,
                      ),
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            _skillsRow(candidateModel.skills),
          ],
        ),
      ),
    );
  }

  Widget _skillsRow(List<String>? skills) {
    if (skills == null || skills.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: 20, // fixed height for chips
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: skills
            .map(
              (s) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: _tagChip(s),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _tagChip(String tag) {
    return // Tag chip
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        tag,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        textAlign: TextAlign.center,
        style: navigatorKey.currentContext!.textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: Colors.black,
        ),
      ),
    );
  }
}
