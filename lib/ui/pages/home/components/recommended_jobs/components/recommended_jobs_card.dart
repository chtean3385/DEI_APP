import 'package:dei_champions/models/job/job_model.dart';
import 'package:flutter/material.dart';

import '../../../../../../constants/app_styles.dart';
import '../../../../../../widgets/others/check_box.dart';
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
                        CustomCheckbox(
                          label: "",
                          initialValue: false,
                          onChanged: (label, isSelected) {
                            print("$label changed to $isSelected");
                          },
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(jobModel.title, style: theme.labelMedium),
                            const SizedBox(height: 6),
                            Text(
                              jobModel.companyName,
                              style: theme.displaySmall?.copyWith(
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 6),
                          ],
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
              Text(
                jobModel.skills.join(","),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
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
}
