import 'package:dei_champions/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_styles.dart';
import '../../home/components/recommended_jobs/components/custom_tab_bar.dart';
import 'components/employer_detail_header.dart';
import 'components/employer_details_view.dart';

class EmployerProfileScreen extends StatefulWidget {


  const EmployerProfileScreen({
    super.key,
  });

  @override
  State<EmployerProfileScreen> createState() => _EmployerProfileScreenState();
}

class _EmployerProfileScreenState extends State<EmployerProfileScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _companyDetailsKey = GlobalKey();
  final GlobalKey _aboutCompanyKey = GlobalKey();
  final _awardsKey = GlobalKey();
  final _verifiedBenefitsKey = GlobalKey();
  final _reviewsKey = GlobalKey();
  final _benefitsKey = GlobalKey();
  final _salaryInsightsKey = GlobalKey();
  final _companyGalleryKey = GlobalKey();
  final GlobalKey _currentOpeningsKey = GlobalKey();

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
      {"id": 1, "title": 'Company Details'},
      {"id": 2, "title": 'About Us'},
      // {"id": 3, "title": 'Awards'},
      // {"id": 4, "title": 'Verified benefits'},
      // {"id": 5, "title": 'Reviews'},
      //  {"id": 6, "title": 'Benefits'},
      // {"id": 7, "title": 'Salary '},
      {"id": 8, "title": 'Company Gallery'},
      {"id": 9, "title": 'Current Openings '},
      // if (widget.jobModel.hasAwards) {"id": 3, "title": 'Awards'},
      // if (widget.jobModel.hasVerifiedBenefits) {"id": 4, "title": 'Verified benefits'},
      // if (widget.jobModel.hasReviews) {"id": 5, "title": 'Reviews'},
      // if (widget.jobModel.hasBenefits) {"id": 6, "title": 'Benefits'},
      // if (widget.jobModel.hasVerifiedBenefits) {"id": 7, "title": 'Salary '},
    ];

    return  ColoredBox(
      color: AppColors.bg,
      child: SafeArea(
        child: Column(
          children: [
            // Expandable content with custom sliver scroll
            Expanded(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  // Job Detail Header that hides on scroll
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        EmployerDetailHeader(),
                        gapH16(),
                      ],
                    ),
                  ),

                  // Sticky Tab Bar
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _StickyTabBarDelegate(

                      child: ColoredBox(
                        color: Colors.white,
                        child: Column(
                          children: [
                            CustomTabBar(
                              filterItems: categories,
                              initialId: 0,
                              onItemSelected: (item) {
                                if (item['id'] == 1) {
                                  _scrollToSection(_companyDetailsKey);
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
                                else if (item['id'] == 8) {
                                  _scrollToSection(_companyGalleryKey);
                                }
                                else if (item['id'] == 9) {
                                  _scrollToSection(_currentOpeningsKey);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Scrollable Content
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: EmployerDetailsView(
                        scrollController: _scrollController,
                        companyDetailsKey: _companyDetailsKey,
                        aboutCompanyKey: _aboutCompanyKey,
                        companyGalleryKey: _companyGalleryKey,
                        currentJobsKey: _currentOpeningsKey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
