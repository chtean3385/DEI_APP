import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/widgets/others/custom_decorated_box.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../widgets/others/open_bottom_sheet.dart';
import 'current_job_openings.dart';
import 'employer_application_status_progress_bar.dart';

class EmployerJobDetailsView extends StatelessWidget {
  final ScrollController scrollController;
  final GlobalKey jobDetailsKey;
  final GlobalKey jobStatisticsKey;
  final GlobalKey applicantsKey;

  const EmployerJobDetailsView({
    super.key,
    required this.scrollController,
    required this.jobDetailsKey,
    required this.jobStatisticsKey,
    required this.applicantsKey,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _jobDetailsTab(context),
          _jobStaticsTab(),
          SizedBox(key: applicantsKey, height: 16),
          Text('Applicants (2)', style: context.textTheme.titleMedium),
          gapH16(),
          CurrentJobOpenings(),
        ],
      ),
    );
  }

  Widget _jobDetailsTab(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(key: jobDetailsKey, height: 16),
        Text('Job Details', style: context.textTheme.titleMedium),
        gapH16(),
        _detailsCard1(context),
        gapH16(),
      ],
    );
  }

  Widget _jobStaticsTab() {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(key: jobStatisticsKey, height: 16),
        Text('Job Statistics', style: theme.titleMedium),
        gapH16(),
        CustomDecoratedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _detailItem(
                    Icons.remove_red_eye_outlined,
                    'Views',
                    '1245',
                    false,
                    center: true,
                  ),
                  gapH8(),
                  _detailItem(
                    Icons.group_outlined,
                    'Applicants',
                    '4',
                    false,
                    center: true,
                  ),
                  gapH8(),
                  _detailItem(
                    Icons.share_outlined,
                    'Shares',
                    '87',
                    false,
                    center: true,
                  ),
                ],
              ),
              gapH16(),
              Text(
                'Application Status',
                style: theme.bodyMedium?.copyWith(fontWeight: FontWeight.bold,fontSize: 16),
              ),
              ApplicationStatusProgressBars()
            ],
          ),
        ),
      ],
    );
  }

  Widget _detailsCard1(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return CustomDecoratedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "MERN stack",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: theme.headlineMedium,
                    ),
                    gapH4(),
                    Text(
                      "PWD • Posted on 19 August 2025",
                      style: theme.bodyMedium,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => openEditBottomSheet(
                  context: context,
                  content: const SizedBox(),
                  isDraggable: true,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.edit_outlined,
                    color: AppColors.primaryColor,
                    size: 15,
                  ),
                ),
              ),
            ],
          ),
          gapH16(),
          _detail1(),
          gapH8(),
          _descriptionCard(context),
          gapH8(),
          _tags(context),
        ],
      ),
    );
  }

  Widget _descriptionCard(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Job Description',
          style: theme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        gapH4(),
        Text(
          'We are a passionate team building scalable web applications and seeking a MERN Stack Developer to design, develop, and maintain full-stack solutions using MongoDB, Express.js, React.js, and Node.js. The ideal candidate has 1–3 years of experience (or strong projects as a fresher), solid skills in JavaScript, React, Node, and MongoDB, and a drive to solve real-world problems while collaborating in a supportive, flexible, and innovative environment.',
          style: theme.bodyMedium,
        ),
      ],
    );
  }

  Widget _tags(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Tags',
          style: theme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        gapH4(),
        Text('Repellendus Totam q', style: theme.bodyMedium),
      ],
    );
  }

  Widget _detailItem(
    IconData icon,
    String title,
    String value,
    bool right, {
    bool center = false,
  }) {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;
    return Column(
      crossAxisAlignment: center
          ? CrossAxisAlignment.center
          : right
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: center
              ? MainAxisAlignment.center
              : right
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Icon(icon, size: 15, color: Colors.black54),
            const SizedBox(width: 4),
            Text(
              title,
              style: theme.bodyMedium?.copyWith(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _detail1() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _detailItem(
                  Icons.apartment_outlined,
                  'Department',
                  'Accounting & Finance',
                  false,
                ),
                gapH8(),
                _detailItem(
                  Icons.location_on_outlined,
                  'Location',
                  'Kharagpur',
                  false,
                ),
                gapH8(),
                _detailItem(
                  Icons.people_alt_outlined,
                  'Applicants',
                  '2 candidates',
                  false,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _detailItem(Icons.work_outline, 'Job Type', 'Contract', true),
                gapH8(),
                _detailItem(Icons.currency_rupee, 'Salary', '10–20 lac', true),
                gapH8(),
                _detailItem(
                  Icons.work_history_outlined,
                  'Experience',
                  '0-2 yrs',
                  true,
                ),
              ],
            ),
          ),
        ],

        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Row(
        //       children: [
        //         Expanded(flex:3,child: _detailItem(Icons.apartment_outlined, 'Department', 'Accounting & Finance')),
        //         Expanded(flex: 2,child: _detailItem(Icons.work_outline, 'Job Type', 'Contract')),
        //       ],
        //     ),
        //     gapH8(),
        //     Row(
        //       children: [
        //         Expanded(flex:3 ,child:  _detailItem(Icons.location_on_outlined, 'Location', 'Kharagpur'),),
        //         Expanded(flex: 2,child: _detailItem(Icons.currency_rupee, 'Salary', '10–20 lac')),
        //       ],
        //     ),
        //     gapH8(),
        //
        //     Row(
        //       children: [
        //         Expanded(flex:3 ,child:   _detailItem(Icons.people_alt_outlined, 'Applicants', '2 candidates')),
        //         Expanded(flex: 2,child: _detailItem(Icons.work_history_outlined, 'Experience', '0-2 yrs')),
        //       ],
        //     ),
        //   ],
        // )
      ),
    );
  }
}
