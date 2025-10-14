import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';
import '../../../models/job/job_model.dart';
import '../../../widgets/others/custom_theme_button.dart';
import '../home/components/recommended_jobs/components/custom_tab_bar.dart';
import 'components/job_detail_header.dart';
import 'components/job_details_view.dart';
import 'components/save_share_bottom_sheet.dart';

class JobDetailsScreen extends StatefulWidget {
  final JobModel jobModel;
  final int initialCategoryId;
  final bool isFromSearch;

  const JobDetailsScreen({
    super.key,
    this.initialCategoryId = 0,
    this.isFromSearch = false,
    required this.jobModel,
  });

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _jobDetailsKey = GlobalKey();
  final GlobalKey _aboutCompanyKey = GlobalKey();
  final _awardsKey = GlobalKey();
  final _verifiedBenefitsKey = GlobalKey();
  final _reviewsKey = GlobalKey();
  final _benefitsKey = GlobalKey();
  final _salaryInsightsKey = GlobalKey();
  final GlobalKey _similarJobsKey = GlobalKey();
  bool _showApplyButton = true;

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
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final aboutCompanyContext = _similarJobsKey.currentContext;
    if (aboutCompanyContext != null) {
      final renderBox = aboutCompanyContext.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final position = renderBox.localToGlobal(Offset.zero);
        final screenHeight = MediaQuery.of(context).size.height;

        // Hide button when About Company section reaches middle of screen
        bool shouldShowButton = position.dy > screenHeight * 0.9;

        if (shouldShowButton != _showApplyButton) {
          setState(() {
            _showApplyButton = shouldShowButton;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      {"id": 1, "title": 'Job Details'},
      {"id": 2, "title": 'About Company'},
      {"id": 3, "title": 'Awards'},
      {"id": 4, "title": 'Verified benefits'},
      {"id": 5, "title": 'Reviews'},
       {"id": 6, "title": 'Benefits'},
      {"id": 7, "title": 'Salary '},
      // if (widget.jobModel.hasAwards) {"id": 3, "title": 'Awards'},
      // if (widget.jobModel.hasVerifiedBenefits) {"id": 4, "title": 'Verified benefits'},
      // if (widget.jobModel.hasReviews) {"id": 5, "title": 'Reviews'},
      // if (widget.jobModel.hasBenefits) {"id": 6, "title": 'Benefits'},
      // if (widget.jobModel.hasVerifiedBenefits) {"id": 7, "title": 'Salary '},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Expandable content with custom sliver scroll
            Expanded(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  // Custom App Bar that hides on scroll
                  SliverAppBar(
                    expandedHeight: 0,
                    floating: false,
                    pinned: false,
                    snap: false,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.grey[600]),
                      onPressed: () => Navigator.pop(context),
                    ),

                    actions: [
                      GestureDetector(
                        onTap: () => _scrollToSection(_similarJobsKey),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.work_outline,
                              color: AppColors.primaryColor,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Similar jobs',
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.more_vert, color: Colors.grey[600]),
                        onPressed: () => showJobOptionsSheet(context),
                      ),
                    ],
                    centerTitle: true,
                  ),

                  // Job Detail Header that hides on scroll
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          JobDetailHeader(jobModel: widget.jobModel),
                          gapH16(),
                        ],
                      ),
                    ),
                  ),

                  // Sticky Tab Bar
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _StickyTabBarDelegate(
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            CustomTabBar(
                              filterItems: categories,
                              initialId: widget.initialCategoryId,
                              onItemSelected: (item) {
                                if (item['id'] == 1) {
                                  _scrollToSection(_jobDetailsKey);
                                } else if (item['id'] == 2) {
                                  _scrollToSection(_aboutCompanyKey);
                                }
                                else if (item['id'] == 3) {
                                  _scrollToSection(_awardsKey);
                                }
                                else if (item['id'] == 4) {
                                  _scrollToSection(_verifiedBenefitsKey);
                                }
                                else if (item['id'] == 5) {
                                  _scrollToSection(_reviewsKey);
                                }
                                else if (item['id'] == 6) {
                                  _scrollToSection(_benefitsKey);
                                }
                                else if (item['id'] == 7) {
                                  _scrollToSection(_salaryInsightsKey);
                                }
                              },
                            ),
                            gapH16(),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Scrollable Content
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: JobDetailsView(
                        scrollController: _scrollController,
                        // We're using CustomScrollView now
                        jobDetailsKey: _jobDetailsKey,
                        aboutCompanyKey: _aboutCompanyKey,
                        similarJobsKey: _similarJobsKey,
                        awardsKey: _awardsKey,
                        benefitsKey:_benefitsKey ,
                        reviewsKey:_reviewsKey,
                        salaryInsightsKey: _salaryInsightsKey,
                        verifiedBenefitsKey: _verifiedBenefitsKey,
                        jobModel: widget.jobModel,
                      ),
                    ),
                  ),

                  // Bottom padding for apply button
                  SliverToBoxAdapter(
                    child: SizedBox(height: _showApplyButton ? 80 : 20),
                  ),
                ],
              ),
            ),

            // Fixed Apply Button at bottom
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: _showApplyButton ? 80 : 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _showApplyButton ? 1.0 : 0.0,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: _applyNow(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _applyNow(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return CustomThemeButton(
      child: Text(
        "Apply now",
        style: theme.labelMedium?.copyWith(color: Colors.white),
      ),
      radius: 30,
      onTap: (){
        if(widget.isFromSearch)AppNavigator.toBottomBar(initialPage: 1);
      },
      isExpanded: true,
      color: AppColors.primaryColor,
    );
  }
}

// Custom delegate for sticky tab bar
class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyTabBarDelegate({required this.child});

  @override
  double get minExtent => 70; // Height when pinned

  @override
  double get maxExtent => 70; // Height when expanded

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
