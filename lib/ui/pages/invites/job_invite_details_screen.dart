import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/models/job/job_model.dart';
import 'package:dei_champions/widgets/others/custom_decorated_box.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../widgets/others/custom_theme_button.dart';
import 'component/invite_job_details_appbar.dart';

class JobInviteDetailsScreen extends StatelessWidget {
  final JobModel jobModel;

  const JobInviteDetailsScreen({Key? key, required this.jobModel})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: JobDetailsAppBar(jobModel: jobModel),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildJobDetailsCard(),
                    const SizedBox(height: 16),
                    _buildTimeVenueCard(),
                    const SizedBox(height: 16),
                    _buildJobDescriptionCard(),
                    const SizedBox(height: 16),
                    _buildKeyResponsibilitiesCard(),
                    const SizedBox(height: 16),
                    _buildPreferredSkillsCard(),
                    const SizedBox(height: 16),
                    _buildRequirementsCard(),
                    const SizedBox(height: 100), // Space for bottom buttons
                  ],
                ),
              ),
            ),
            _buildBottomActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildJobDetailsCard() {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;
    return CustomDecoratedBox(
      color: AppColors.bg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                jobModel.postedTime,
                style: theme.bodyMedium?.copyWith(color: Colors.black54),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  child: Text(
                    'Walk-in',
                    style: theme.displaySmall?.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            jobModel.title,
            style: theme.titleMedium?.copyWith(color: Colors.black87),
          ),
          const SizedBox(height: 12),
          _buildDetailRow(
            Icons.location_on,
            'Mumbai, Navi Mumbai, Mumbai (All Areas)',
          ),
          const SizedBox(height: 12),
          _buildDetailRow(Icons.work_outline, jobModel.experience),
          const SizedBox(height: 12),
          _buildDetailRow(Icons.currency_rupee, jobModel.salary),
          const SizedBox(height: 12),
          _buildDetailRow(Icons.business, 'In office'),
          const SizedBox(height: 12),
          _buildDetailRow(Icons.verified, jobModel.skills.join(",")),
        ],
      ),
    );
  }

  Widget _buildTimeVenueCard() {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;
    return CustomDecoratedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Time and venue',
            style: theme.titleMedium?.copyWith(color: Colors.black87),
          ),
          const SizedBox(height: 12),

          _buildDetailRow(
            Icons.schedule,
            '13 Sep, 10:00 am - 13 Sep, 03:00 pm',
          ),
          const SizedBox(height: 12),
          _buildDetailRow(
            Icons.location_on,
            'Block No. 301/302 Building V, Sector II Millennium Business Park, Mahape, Navi Mumbai, Maharashtra - 400 710',
          ),
        ],
      ),
    );
  }

  Widget _buildJobDescriptionCard() {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;
    return CustomDecoratedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Job description',
            style: theme.titleMedium?.copyWith(color: Colors.black87),
          ),
          const SizedBox(height: 12),
          _buildJobDescriptionRow(
            'Position:',
            'Junior Data Verification Specialist',
          ),
          _buildJobDescriptionRow('Job Shift:', 'Day/ Night'),
          _buildJobDescriptionRow('Experience:', '0 to 2 years'),
          _buildJobDescriptionRow('Job Location:', 'PAN India'),
          _buildJobDescriptionRow('Salary Range:', 'Upto ₹ 3,50,000'),
          const SizedBox(height: 16),
          _buildJobDescriptionRow(
            'Date of WalkIn Drive:',
            '13th september 2025',
          ),
          _buildJobDescriptionRow('Time:', '10.00 AM - 3.00 PM IST'),
          _buildJobDescriptionRow(
            'Venu:',
            'Block No. 301/302 Building V, Sector II Millennium Business Park, Mahape, Navi Mumbai, Maharashtra - 400 710',
          ),
          const SizedBox(height: 16),
          Text(
            'The interview process will take approximately 6-7 hours',
            style: navigatorKey.currentContext!.textTheme.bodyMedium?.copyWith(
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyResponsibilitiesCard() {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;
    return CustomDecoratedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Key Responsibilities:',
            style: theme.titleMedium?.copyWith(color: Colors.black87),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint(
            'Review documents and compare the data extracted by automated tools with the original source to ensure accuracy and completeness.',
          ),
          _buildBulletPoint(
            'Identify and correct any discrepancies, errors, or omissions in the extracted data.',
          ),
          _buildBulletPoint(
            'Verify that all required data fields have been accurately captured and properly formatted.',
          ),
          _buildBulletPoint(
            'Maintain records of verification and correction activities for quality assurance and audit purposes.',
          ),
          _buildBulletPoint(
            'Communicate with team members or supervisors regarding recurring issues or improvements in the extraction process.',
          ),
          _buildBulletPoint(
            'Follow established procedures for data entry, document handling, and data security.',
          ),
          _buildBulletPoint(
            'Meet productivity and accuracy targets as defined by the team lead or manager.',
          ),
        ],
      ),
    );
  }

  Widget _buildPreferredSkillsCard() {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;
    return CustomDecoratedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Preferred Skills:',
            style: theme.titleMedium?.copyWith(color: Colors.black87),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint(
            'Good communication skills for reporting issues and collaborating with colleagues',
          ),
          _buildBulletPoint(
            'Previous experience in data entry, data verification, or clerical work preferred.',
          ),
          _buildBulletPoint(
            'Strong attention to detail and commitment to accuracy.',
          ),
          _buildBulletPoint(
            'Basic proficiency with computers, document management systems, and Microsoft Office applications',
          ),
          _buildBulletPoint(
            'Ability to work independently and as part of a team.',
          ),
          _buildBulletPoint('Good organizational and time management skills.'),
          _buildBulletPoint(
            'Ability to follow instructions and standard operating procedures.',
          ),
        ],
      ),
    );
  }

  Widget _buildRequirementsCard() {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;
    return CustomDecoratedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Note:',
            style: theme.titleMedium?.copyWith(color: Colors.black87),
          ),
          const SizedBox(height: 12),
          const Text(
            'Candidates with the existing backlogs/ATKT (Results Pending) will not be entertained.',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 12),
          const Text(
            'Candidates with notice period of more than 60 days (non-negotiable), are requested not to apply.',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 12),
          const Text(
            'Candidates who have appeared for our selection process in the last 3 months are not eligible for this opening.',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 12),
          const Text(
            'Candidates should be ready to relocate near any of the XLD Center locations.',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 12),
          const Text(
            'Candidates who are pursuing/ or have completed their MBA, CA, CFA, Engineering are not eligible for this position.',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 20),
          const Text(
            'Please carry below things with you:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          _buildNumberedPoint('1. Updated resume'),
          _buildNumberedPoint('2. One passport size photograph'),
          _buildNumberedPoint('3. A pen'),
          const SizedBox(height: 20),
          _buildJobCategoryInfo(),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.grey[600], size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: navigatorKey.currentContext!.textTheme.bodyMedium?.copyWith(
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildJobDescriptionRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: navigatorKey.currentContext!.textTheme.bodyMedium
                  ?.copyWith(color: Colors.black87),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: navigatorKey.currentContext!.textTheme.bodyMedium
                  ?.copyWith(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobCategoryInfo() {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Industry type',
          style: theme.bodyMedium?.copyWith(
            color: Colors.black54,
            fontSize: 13,
          ),
        ),
        Text(
          'IT Services & Consulting',
          style: theme.bodyMedium?.copyWith(
            color: Colors.black87,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Role',
          style: theme.bodyMedium?.copyWith(
            color: Colors.black54,
            fontSize: 13,
          ),
        ),
        Text(
          'Walk-in drive For the Junior Data Verification Specialist position',
          style: theme.bodyMedium?.copyWith(
            color: Colors.black87,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Role category',
          style: theme.bodyMedium?.copyWith(
            color: Colors.black54,
            fontSize: 13,
          ),
        ),
        Text(
          'Data Entry / MIS',
          style: theme.bodyMedium?.copyWith(
            color: Colors.black87,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Employment type',
          style: theme.bodyMedium?.copyWith(
            color: Colors.black54,
            fontSize: 13,
          ),
        ),
        Text(
          'Full Time, Permanent',
          style: theme.bodyMedium?.copyWith(
            color: Colors.black87,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            height: 4,
            width: 4,
            decoration: const BoxDecoration(
              color: Colors.black87,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: navigatorKey.currentContext!.textTheme.bodyMedium
                  ?.copyWith(color: Colors.black87, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberedPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, color: Colors.black87),
      ),
    );
  }

  Widget _buildBottomActionButtons() {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: CustomThemeButton(
                child: Text(
                  'Not interested',
                  style: theme.labelMedium?.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                radius: 30,
                onTap: () => Navigator.pop(navigatorKey.currentContext!),
                isExpanded: true,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomThemeButton(
                child: Text(
                  'Apply',
                  style: theme.labelMedium?.copyWith(color: Colors.white),
                ),
                radius: 30,
                onTap: () {},
                isExpanded: true,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
