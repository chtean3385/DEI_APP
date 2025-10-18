import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';

import '../../home/components/recommended_jobs/components/custom_tab_bar.dart';
import 'components/employer_job_details_view.dart';

class EmployerJobDetailsScreen extends StatefulWidget {
  const EmployerJobDetailsScreen({super.key});

  @override
  State<EmployerJobDetailsScreen> createState() =>
      _EmployerJobDetailsScreenState();
}

class _EmployerJobDetailsScreenState extends State<EmployerJobDetailsScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _jobDetailsKey = GlobalKey();
  final GlobalKey _jobStatisticsKey = GlobalKey();
  final GlobalKey _applicantsKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      {"id": 1, "title": 'Job Details'},
      {"id": 2, "title": 'Job Statistics'},
      {"id": 3, "title": 'Applicants'},
    ];

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: appBarCommon(),
      body: SafeArea(
        child: Column(
          children: [
            ColoredBox(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CustomTabBar(
                      filterItems: categories,
                      initialId: 0,
                      onItemSelected: (item) {
                        if (item['id'] == 1) {
                          _scrollToSection(_jobDetailsKey);
                        } else if (item['id'] == 2) {
                          _scrollToSection(_jobStatisticsKey);
                        } else if (item['id'] == 3) {
                          _scrollToSection(_applicantsKey);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Expandable content with custom sliver scroll
            Expanded(
              child: EmployerJobDetailsView(
                scrollController: _scrollController,
                jobDetailsKey: _jobDetailsKey,
                jobStatisticsKey: _jobStatisticsKey,
                applicantsKey: _applicantsKey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
