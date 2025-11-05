import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/models/job/job_model_api.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:intl/intl.dart';

import '../../../../../../constants/app_styles.dart';
import '../../../../../../main.dart';
import '../../../../../../widgets/others/rounded_network_image.dart';
import '../../../../widgets/others/custom_theme_button.dart';
import '../../job/components/save_hide_button.dart';

class SearchJobCard extends StatelessWidget {
  final JobModelApi jobModel;
  final GestureTapCallback? onTap;
  final bool hideSaveButton;
  final bool hideApplyButton;
  final bool showWithdrawButton;
  final bool showMyApplicationStatusButton;

  const SearchJobCard({
    super.key,
    required this.jobModel,
    this.onTap,
    this.hideSaveButton = false,
    this.hideApplyButton = false,
    this.showWithdrawButton = false,
    this.showMyApplicationStatusButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final plainText = html_parser.parse(jobModel.description).body?.text ?? '';
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
                        style: theme.labelMedium?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        jobModel.salary ?? "",
                        style: theme.displaySmall?.copyWith(
                          color: Colors.black54,
                        ),
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
                plainText,
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
                  if (showWithdrawButton)
                    CustomDynamicButton(
                      activeIcon: Icons.send_rounded,
                      inActiveIcon: Icons.cancel_outlined,
                      activeTitle: "Apply",
                      inActiveTitle: "Withdraw",
                      activeColor: AppColors.primaryColor,
                      inActiveColor: Colors.red.withValues(alpha: .8),
                      size: 20,
                      smaller: true,
                      initialValue: !jobModel.isApplied,
                      onPressed: (isWithdrawnNow) async {
                        final jobId = jobModel.id ?? "";
                        final notifier = ProviderScope.containerOf(
                          context,
                        ).read(employeeManageJobProvider.notifier);

                        if (isWithdrawnNow) {
                          final success = await notifier.unApplyJob(
                            context,
                            jobId,
                          );
                          return success; // true = toggle, false = no change
                        } else {
                          final success = await notifier.applyJob(
                            context,
                            jobId,
                          );
                          return success;
                        }
                      },
                    ),
                  if (!hideApplyButton)
                    CustomDynamicButton(
                      activeIcon: Icons.send_rounded,
                      inActiveIcon: Icons.check_circle_rounded,
                      activeTitle: "Apply",
                      inActiveTitle: "Applied",
                      size: 20,
                      smaller: true,
                      initialValue: !jobModel.isApplied,
                      onPressed: (isAppliedNow) async {
                        final jobId = jobModel.id ?? "";
                        final notifier = ProviderScope.containerOf(
                          context,
                        ).read(employeeManageJobProvider.notifier);

                        if (isAppliedNow) {
                          final success = await notifier.unApplyJob(
                            context,
                            jobId,
                          );
                          return success; // true = toggle, false = no change
                        } else {
                          final success = await notifier.applyJob(
                            context,
                            jobId,
                          );
                          return success;
                        }
                      },
                    ),

                  if (!hideSaveButton)
                    CustomDynamicButton(
                      activeIcon: Icons.bookmark_border,
                      inActiveIcon: Icons.bookmark,
                      activeTitle: "Save",
                      inActiveTitle: "Saved",
                      size: 20,
                      smaller: true,
                      initialValue: !jobModel.isSaved,
                      onPressed: (isSavedNow) async {
                        // 🔹 Add API call here
                        print("Save/Hide tapped!  -- $isSavedNow");
                        final jobId = jobModel.id ?? "";
                        final notifier = ProviderScope.containerOf(
                          context,
                        ).read(employeeManageJobProvider.notifier);

                        if (isSavedNow) {
                          notifier.unSaveJob(jobId);
                          print("❌ unSaveJob from job $jobId");
                          return true;
                        } else {
                          notifier.saveJob(jobId);
                          print("✅ saveJob for job $jobId");
                          return true;
                        }
                      },
                    ),
                  if (showMyApplicationStatusButton)
                    _buildStatusButton(jobModel.myStatus ?? ""),
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

  Widget _buildStatusButton(String status) {
    final theme = navigatorKey.currentContext!.textTheme;

    // Normalize input
    final s = status.toLowerCase().trim();
    // Define color and text mapping
    late final Color buttonColor;
    late final String buttonText;

    switch (s) {
      case "pending":
        buttonText = "Application Pending";
        buttonColor = Colors.orange;
        break;

      case "accepted":
        buttonText = "Application Accepted";
        buttonColor = Colors.green;
        break;

      case "rejected":
        buttonText = "Application Rejected";
        buttonColor = Colors.red;
        break;

      case "interviewing":
        buttonText = "Interview Scheduled";
        buttonColor = Colors.blue;
        break;

      case "negotiation":
        buttonText = "Under Discussion";
        buttonColor = Colors.purple;
        break;

      case "hired":
        buttonText = "Hired";
        buttonColor = Colors.teal;
        break;

      default:
        buttonText = "Status Unknown"; // optional helper if you have one
        buttonColor = Colors.grey;
    }

    return CustomThemeButton(
      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(
            Icons.send_and_archive_outlined,
            size: 20,
            color: Colors.black54,
          ),
          gapW8(),
          Text(
            buttonText,
            style: theme.labelSmall?.copyWith(
              color: buttonColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      color: buttonColor.withValues(alpha: 0.1),
      borderColor: buttonColor.withValues(alpha: 0.1),
      radius: 30,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      onTap: null, // disable tap, purely informational
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

String formatPostedDate(DateTime date) {
  return DateFormat('MMMM d, y').format(date); // e.g., October 16, 2025
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
                        ShimmerBox(height: 14, width: 160),
                        const SizedBox(height: 6),
                        ShimmerBox(height: 12, width: 100),
                        const SizedBox(height: 6),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  ShimmerBox(height: 50, width: 50, radius: 8),
                ],
              ),
              const SizedBox(height: 10),

              // Location
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: Colors.black26,
                  ),
                  const SizedBox(width: 6),
                  ShimmerBox(height: 10, width: 80),
                ],
              ),
              const SizedBox(height: 6),

              // Job type
              Row(
                children: [
                  Icon(
                    Icons.work_history_outlined,
                    size: 16,
                    color: Colors.black26,
                  ),
                  const SizedBox(width: 6),
                  ShimmerBox(height: 10, width: 60),
                ],
              ),
              const SizedBox(height: 6),

              // Salary
              Row(
                children: [
                  const SizedBox(width: 5),
                  Icon(Icons.currency_rupee, size: 14, color: Colors.black26),
                  const SizedBox(width: 6),
                  ShimmerBox(height: 10, width: 50),
                ],
              ),
              const SizedBox(height: 10),

              // Skills chips
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(
                  3,
                  (index) => ShimmerBox(height: 20, width: 60, radius: 6),
                ),
              ),
              const SizedBox(height: 10),

              // Description
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerBox(height: 10, width: double.infinity),
                  const SizedBox(height: 4),
                  ShimmerBox(height: 10, width: double.infinity),
                  const SizedBox(height: 4),
                  ShimmerBox(height: 10, width: 150),
                ],
              ),
              const SizedBox(height: 12),

              // Footer with calendar and button placeholder
              Row(
                children: [
                  Icon(Icons.calendar_month, size: 14, color: Colors.black26),
                  const SizedBox(width: 6),
                  ShimmerBox(height: 10, width: 60),
                  const Spacer(),
                  ShimmerBox(height: 26, width: 60, radius: 8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerBox extends StatelessWidget {
  final double height;
  final double width;
  final double radius;

  const ShimmerBox({
    super.key,
    required this.height,
    required this.width,
    this.radius = 4,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: SizedBox(height: height, width: width),
    );
  }
}
