import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/ui/pages/invites/component/delete_invite_sheet.dart';
import 'package:flutter/material.dart';

import '../../../../models/job/job_model.dart';

class JobDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final JobModel jobModel;

  const JobDetailsAppBar({super.key, required this.jobModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black87),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(jobModel.companyName, style: theme.labelMedium),
          Row(
            children: [
              Icon(Icons.star, color: Colors.orange[400], size: 16),
              const SizedBox(width: 4),
              Text(
                '${jobModel.rating} (${jobModel.reviews} Reviews)',
                style: theme.displaySmall?.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Text(
            'Posted by XL Dynamics',
            style: theme.displaySmall?.copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.delete_outline, color: Colors.grey, size: 30),
          onPressed: () => showDeleteInviteConfirmationSheet(context),
        ),
      ],
      toolbarHeight: 80,
    );
  }

  /// ✅ This is required for PreferredSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(80);
}
