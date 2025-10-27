import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/models/job/job_model.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../../constants/app_styles.dart';
import '../../../../../../main.dart';
import '../../../../../../widgets/others/rounded_network_image.dart';
import '../../../../job/components/save_hide_button.dart';

class RecommendedJobCard extends StatelessWidget {
  final JobModel jobModel;
  final bool showSave;
  final GestureTapCallback? onTap;

  const RecommendedJobCard({super.key, required this.jobModel, this.onTap,this.showSave = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
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
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(jobModel.title, style: theme.labelMedium),
                              const SizedBox(height: 6),
                              Text(
                                jobModel.companyName,
                                style: theme.displaySmall?.copyWith(
                                  color: AppColors.primaryColor
                                ),
                              ),
                              const SizedBox(height: 6),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  gapW8(),
                  RoundedNetworkImage(
                    imageUrl: jobModel.logoUrl,
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
                    size: 16,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 4),
                  Text(
                    jobModel.location,
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
                    jobModel.experience,
                    style: theme.displaySmall?.copyWith(color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  SizedBox(width: 5),
                  Text(
                    "₹",
                    style: theme.labelMedium?.copyWith(color: Colors.black54),
                  ),
                  SizedBox(width: 6),
                  Text(
                    jobModel.salary,
                    style: theme.displaySmall?.copyWith(color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              _skillsRow(jobModel.skills),
              const SizedBox(height: 6),

              Text(
                "A company description is a concise overview that summarizes your business's key aspects, such as its history, legal structure, products or services, t...",
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 3,
                style: theme.displaySmall?.copyWith(color: Colors.black54),
              ),
              const SizedBox(height: 6),

              Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            jobModel.vacancies,
                            style: theme.displaySmall?.copyWith(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        gapW16(),
                        Text(
                          jobModel.postedTime,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: theme.displaySmall?.copyWith(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SaveHideButton(
                    showSave: showSave, // or false for Hide
                    onPressed: () {
                      // 🔹 Add API call here
                      print("Save/Hide tapped!");
                    },
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _skillsRow(List<String>? skills) {
    if (skills == null || skills.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 8, // horizontal space between chips
      runSpacing: 8, // vertical space between lines
      children: skills.map((s) => _tagChip(s)).toList(),
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
