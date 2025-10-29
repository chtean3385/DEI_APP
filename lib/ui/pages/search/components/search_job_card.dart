import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/models/job/job_model_api.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../constants/app_styles.dart';
import '../../../../../../main.dart';
import '../../../../../../widgets/others/rounded_network_image.dart';
import '../../../../repo/shared_preference_repository.dart';
import '../../../../widgets/others/show_custom_alert_dialog.dart';
import '../../job/components/save_hide_button.dart';

class SearchJobCard extends StatelessWidget {
  final JobModelApi jobModel;
  final GestureTapCallback? onTap;

  const SearchJobCard({
    super.key,
    required this.jobModel,
    this.onTap,
  });

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
                              Text(
                                jobModel.title ?? "",
                                style: theme.labelMedium,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                jobModel.employer?.company ?? "",
                                style: theme.displaySmall?.copyWith(
                                  color: AppColors.primaryColor,
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
                    imageUrl: jobModel.employer?.companyLogo ?? "",
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
                    jobModel.state ?? "",
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
                    jobModel.jobType ?? "",
                    style: theme.displaySmall?.copyWith(color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 5),
                      Text(
                        "₹",
                        style: theme.labelMedium?.copyWith(color: Colors.black54),
                      ),
                      SizedBox(width: 6),
                      Text(
                        jobModel.salary ?? "",
                        style: theme.displaySmall?.copyWith(color: Colors.black54),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.calendar_month,
                        size: 14,
                        color: Colors.black54,
                      ),
                      gapW4(),
                      Text(
                        " ${getTimeAgo(jobModel.createdAt ?? DateTime.now())}",
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: theme.displaySmall?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 6),
              _skillsRow(jobModel.skills),
              const SizedBox(height: 6),

              Text(
                jobModel.description ?? "",
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 3,
                style: theme.displaySmall?.copyWith(color: Colors.black54),
              ),
              const SizedBox(height: 6),
              const SizedBox(height: 6),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomDynamicButton(
                    activeIcon:  Icons.send_rounded,
                    inActiveIcon:Icons.check_circle_rounded ,
                    activeTitle:"Apply" ,
                    inActiveTitle:"Applied" ,
                    size:20 ,
                    smaller: true,
                    initialValue: !jobModel.isApplied,
                    onPressed: (isAppliedNow) async {
                      // 🔹 Add API call here
                      print("Apply/Applied tapped! -- $isAppliedNow");
                      final jobId = jobModel.id ?? "";
                      final notifier = ProviderScope.containerOf(context)
                          .read(employeeManageJobProvider.notifier);

                      if (isAppliedNow) {
                        notifier.unApplyJob(jobId);
                        print("❌ Unapplied from job $jobId");
                        return true;
                      } else {
                        final hasUploadedResume =
                        await SharedPreferenceRepository.getHasUploadedResume();

                        if (!hasUploadedResume) {
                          showCustomAlertDialog(
                            context: context,
                            title: "Please upload resume",
                            message:
                            "You need to upload your resume before applying for this job.",
                            primaryButtonText: "Upload",
                            onPrimaryPressed: () {
                              Navigator.pop(context);
                            },
                            secondaryButtonText: "Cancel",
                            onSecondaryPressed: () => Navigator.pop(context),
                          );
                          return false; // ❌ Don't toggle the button
                        }
                        notifier.applyJob(jobId);
                        print("✅ Applied for job $jobId");
                        return true;

                      }
                    },
                  ),
                  CustomDynamicButton(
                    activeIcon:  Icons.bookmark_border,
                    inActiveIcon:Icons.bookmark ,
                    activeTitle:"Save" ,
                    inActiveTitle:"Saved" ,
                    size:20 ,
                    smaller: true,
                    initialValue: !jobModel.isSaved,
                    onPressed: (isSavedNow) async {
                      // 🔹 Add API call here
                      print("Save/Hide tapped!  -- $isSavedNow");
                      return true;
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

String getTimeAgo(DateTime date) {
  final Duration diff = DateTime.now().difference(date);

  if (diff.inSeconds < 60) {
    return 'just now';
  } else if (diff.inMinutes < 60) {
    return '${diff.inMinutes} minute${diff.inMinutes == 1 ? '' : 's'} ago';
  } else if (diff.inHours < 24) {
    return '${diff.inHours} hour${diff.inHours == 1 ? '' : 's'} ago';
  } else if (diff.inDays < 30) {
    return '${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago';
  } else if (diff.inDays < 365) {
    final months = (diff.inDays / 30).floor();
    return '$months month${months == 1 ? '' : 's'} ago';
  } else {
    final years = (diff.inDays / 365).floor();
    return '$years year${years == 1 ? '' : 's'} ago';
  }
}

class ShimmerSearchJobCard extends StatelessWidget {
  const ShimmerSearchJobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoader(
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(6),
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(16),
          ),
          side: const BorderSide(color: Colors.white, width: 2),
        ),
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row with title + logo
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _shimmerBox(height: 14, width: 160),
                        const SizedBox(height: 6),
                        _shimmerBox(height: 12, width: 100),
                        const SizedBox(height: 6),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  _shimmerBox(height: 50, width: 50, radius: 8),
                ],
              ),
              const SizedBox(height: 10),

              // Location
              Row(
                children: [
                  Icon(Icons.location_on_outlined, size: 16, color: Colors.black26),
                  const SizedBox(width: 6),
                  _shimmerBox(height: 10, width: 80),
                ],
              ),
              const SizedBox(height: 6),

              // Job type
              Row(
                children: [
                  Icon(Icons.work_history_outlined, size: 16, color: Colors.black26),
                  const SizedBox(width: 6),
                  _shimmerBox(height: 10, width: 60),
                ],
              ),
              const SizedBox(height: 6),

              // Salary
              Row(
                children: [
                  const SizedBox(width: 5),
                  Icon(Icons.currency_rupee, size: 14, color: Colors.black26),
                  const SizedBox(width: 6),
                  _shimmerBox(height: 10, width: 50),
                ],
              ),
              const SizedBox(height: 10),

              // Skills chips
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(
                  3,
                      (index) => _shimmerBox(height: 20, width: 60, radius: 6),
                ),
              ),
              const SizedBox(height: 10),

              // Description
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shimmerBox(height: 10, width: double.infinity),
                  const SizedBox(height: 4),
                  _shimmerBox(height: 10, width: double.infinity),
                  const SizedBox(height: 4),
                  _shimmerBox(height: 10, width: 150),
                ],
              ),
              const SizedBox(height: 12),

              // Footer with calendar and button placeholder
              Row(
                children: [
                  Icon(Icons.calendar_month, size: 14, color: Colors.black26),
                  const SizedBox(width: 6),
                  _shimmerBox(height: 10, width: 60),
                  const Spacer(),
                  _shimmerBox(height: 26, width: 60, radius: 8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _shimmerBox({
    required double height,
    required double width,
    double radius = 4,
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: SizedBox(
        height: height,
        width: width,
      ),
    );
  }
}
