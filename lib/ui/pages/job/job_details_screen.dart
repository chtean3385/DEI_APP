import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';
import '../../../constants/enums.dart';
import '../../../models/job/job_model.dart';
import '../../../providers/providers.dart';
import '../../../widgets/others/custom_loader.dart';
import '../home/components/recommended_jobs/components/custom_tab_bar.dart';
import 'components/apply_job_button.dart';
import 'components/job_detail_header.dart';
import 'components/job_details_view.dart';
import 'components/save_share_bottom_sheet.dart';

class JobDetailsScreen extends ConsumerStatefulWidget {
  final JobModel? jobModel;
  final String? jobId;

  const JobDetailsScreen({super.key, this.jobId, required this.jobModel});

  @override
  ConsumerState<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends ConsumerState<JobDetailsScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _jobDetailsKey = GlobalKey();
  final GlobalKey _aboutCompanyKey = GlobalKey();
  final _deiCertificates = GlobalKey();
  final _verifiedBenefitsKey = GlobalKey();
  final _reviewsKey = GlobalKey();
  final _benefitsKey = GlobalKey();
  final _salaryInsightsKey = GlobalKey();
  final _companyGalleryKey = GlobalKey();
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
    final controller = ref.read(employeeJobDetailsProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getJobDetails(widget.jobId ?? "");
    });
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
        bool shouldShowButton = position.dy > screenHeight * 0.98;

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
    final state = ref.watch(employeeJobDetailsProvider);
    final categories = [
      {"id": 1, "title": 'Job Details'},
      {"id": 2, "title": 'About Company'},
      {"id": 3, "title": 'Certifications'},
      // {"id": 4, "title": 'Verified benefits'},
      // {"id": 5, "title": 'Reviews'},
      //  {"id": 6, "title": 'Benefits'},
      // {"id": 7, "title": 'Salary '},
      {"id": 8, "title": 'Company Gallery '},

      // if (widget.jobModel.hasAwards) {"id": 3, "title": 'Awards'},
      // if (widget.jobModel.hasVerifiedBenefits) {"id": 4, "title": 'Verified benefits'},
      // if (widget.jobModel.hasReviews) {"id": 5, "title": 'Reviews'},
      // if (widget.jobModel.hasBenefits) {"id": 6, "title": 'Benefits'},
      // if (widget.jobModel.hasVerifiedBenefits) {"id": 7, "title": 'Salary '},
    ];
final colorTheme = context.colors;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Builder(
        builder: (context) {
          if (state.pageState == PageState.loading) {
            return Center(child: const CustomLoader());
          }
          if (state.pageState == PageState.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.errorMessage ?? "Something went wrong"),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                    ),
                    child: Text(
                      "Go Back",
                      style: context.textTheme.labelMedium?.copyWith(
                        color: colorTheme.themBasedWhite,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          if (state.data == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("No details found"),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorTheme.buttonPrimaryColor,
                    ),
                    child: Text(
                      "Go Back",
                      style: context.textTheme.labelMedium?.copyWith(
                        color: colorTheme.themBasedWhite,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          final jobDetails = state.data!;
          return SafeArea(
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
                        backgroundColor: colorTheme.themBasedWhite,
                        elevation: 0,
                        leading: IconButton(
                          icon: Icon(Icons.arrow_back, color: colorTheme.grey600),
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
                                  color: colorTheme.buttonPrimaryColor,
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Similar jobs',
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    color: colorTheme.buttonPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.more_vert,
                              color: colorTheme.grey600,
                            ),
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
                              JobDetailHeader(jobModel: jobDetails),
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
                            color: colorTheme.themBasedWhite,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                CustomTabBar(
                                  filterItems: categories,
                                  initialId: 0,
                                  onItemSelected: (item) {
                                    if (item['id'] == 1) {
                                      _scrollToSection(_jobDetailsKey);
                                    } else if (item['id'] == 2) {
                                      _scrollToSection(_aboutCompanyKey);
                                    } else if (item['id'] == 3) {
                                      _scrollToSection(_deiCertificates);
                                    } else if (item['id'] == 4) {
                                      _scrollToSection(_verifiedBenefitsKey);
                                    } else if (item['id'] == 5) {
                                      _scrollToSection(_reviewsKey);
                                    } else if (item['id'] == 6) {
                                      _scrollToSection(_benefitsKey);
                                    } else if (item['id'] == 7) {
                                      _scrollToSection(_salaryInsightsKey);
                                    } else if (item['id'] == 8) {
                                      _scrollToSection(_companyGalleryKey);
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
                            companyGalleryKey: _companyGalleryKey,
                            similarJobsKey: _similarJobsKey,
                            deiCertificates: _deiCertificates,
                            benefitsKey: _benefitsKey,
                            reviewsKey: _reviewsKey,
                            salaryInsightsKey: _salaryInsightsKey,
                            verifiedBenefitsKey: _verifiedBenefitsKey,
                            jobModel: jobDetails,
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
                        color: colorTheme.themBasedWhite,
                        boxShadow: [
                          BoxShadow(
                            color: colorTheme.themBasedBlack.withValues(alpha: 0.1),
                            blurRadius: 8,
                            offset: const Offset(0, -2),
                          ),
                        ],
                      ),
                      child:  ApplyJobButton(jobId: jobDetails.id ?? "",),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
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


