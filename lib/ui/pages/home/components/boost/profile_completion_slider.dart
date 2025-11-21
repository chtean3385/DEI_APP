import 'dart:async';

import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/ui/pages/home/components/boost/resume_boost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/app_navigator.dart';
import '../../../../../constants/enums.dart';
import '../../../../../models/profile/profile_completion/profile_completion_model.dart';
import '../../../../../models/state_models/profile/employee_profile_completion_state.dart';
import '../../../main/components/drawer/custom_drawer.dart';
import '../../../main/components/drawer/promotion_alert.dart';
import '../../../main/components/drawer/verify_email_alert.dart';

/// 🔄 PageView slider for ResumeBoostCards
class ProfileCompletionSlider extends ConsumerStatefulWidget {
  const ProfileCompletionSlider({super.key});

  @override
  ConsumerState<ProfileCompletionSlider> createState() =>
      _ProfileCompletionSliderState();
}

class _ProfileCompletionSliderState
    extends ConsumerState<ProfileCompletionSlider> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  Timer? _autoSlideTimer;
  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _autoSlideTimer?.cancel();

    _autoSlideTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!mounted) return;

      final state = ref.read(profileCompletionProvider);
      final itemCount = state.profileData?.missingFields?.length ?? 0;

      if (itemCount == 0) return;

      // If at last page → jump to first & stop timer
      if (_currentPage == itemCount - 1) {
        _controller.animateToPage(
          0,
          duration: const Duration(milliseconds: 450),
          curve: Curves.fastOutSlowIn,
        );

        _autoSlideTimer?.cancel(); // ❌ stop sliding
        return;
      }

      // Otherwise slide to next
      final nextPage = _currentPage + 1;

      _controller.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 450),
        curve: Curves.fastOutSlowIn,
      );
    });
  }


  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileCompletionProvider);
    final hasData = ((state.profileData?.missingFieldsCount ?? 0) > 0);
    if (!hasData && state.pageState != PageState.loading) {
      return const SizedBox.shrink();
    }
    return state.pageState == PageState.loading
        ? _loadingItems()
        : _data(state);
  }

  Widget _data(EmployeeProfileCompletionState state) {
    final profile = state.profileData;
    if(profile?.profileCompletion == 100) return const SizedBox.shrink();
    final List<MissingField> data = profile?.missingFields ?? [];
    return Column(
      children: [
        Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 100, width: double.infinity),
                ColoredBox(
                  color: context.colors.themBasedWhite,
                  child: SizedBox(height: 50, width: double.infinity),
                ),
                SizedBox(
                  height: 80,
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: data.length,
                    onPageChanged: (index) {
                      setState(() => _currentPage = index);
                    },
                    itemBuilder: (context, index) {
                      final item = data[index];

                      final action = () {
                        _handleAction(item.field ?? "");
                      };

                      return ResumeBoostCard(
                        title: getBoostDescription(item.field ?? ""),
                        buttonTitle: getButtonText(item.field ?? ""),
                        boostPercentage: (item.percentage ?? 0).toDouble(),
                        currentPage: _currentPage,
                        totalPages: data.length,
                        onButtonTap: action,
                      );
                    },
                  ),
                ),

                // indicator row (outside card)
                ColoredBox(
                  color: context.colors.themBasedWhite,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8, left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        data.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          width: _currentPage == index ? 20 : 10,
                          height: 6,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? Colors.red
                                :  context.colors.grey300,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ProfileSection(
              showMissingData: true,
            ),
          ],
        ),
        coloredGap()
      ],
    );
  }

  Widget _loadingItems() {
    return SizedBox.shrink();
  }
}

String getButtonText(String? field) {
  switch (field) {
    case "emailVerified":
      return "Verify email";

    case "city":
      return "Add city";

    case "state":
      return "Add state";

    case "resume":
      return "Upload resume";

    case "skills":
      return "Add skills";

    case "education":
      return "Add education";

    case "employeeDescription":
      return "Add about me";

    default:
      return "Update";
  }
}

void _handleAction(String field) {
  switch (field) {
    case "emailVerified":
      // Navigate or show verify flow
      showEmailVerificationAlert();
      // showPromotionAlert(
      //   PromotionModel(
      //     imageUrl: "https://freeimage.host/i/fJdZGwJ",
      //     heading: "Special Offer!",
      //     content: "Get 40% discount on premium membership.",
      //     buttonText: "Upgrade Now",
      //     buttonUrl: "myapp://premium",
      //   ),
      // );

      // showJobStatusUpdateAlert(
      //   jobTitle: "Figma Developer",
      //   oldStatus: "pending",
      //   newStatus: "accepted",
      // );


      //   AppNavigator.loadEditEmployeeSelectedSectionScreen(params:EmployeeProfileFieldsParams(email: true) );
      break;

    case "city":
      AppNavigator.loadEditEmployeeSelectedSectionScreen(params:EmployeeProfileFieldsParams(city: true) );
      break;

    case "state":
      AppNavigator.loadEditEmployeeSelectedSectionScreen(params:EmployeeProfileFieldsParams(state: true) );
      break;

    case "resume":
      AppNavigator.loadEditEmployeeSelectedSectionScreen(params:EmployeeProfileFieldsParams(resume: true) );
      break;

    case "skills":
      AppNavigator.loadEditEmployeeSelectedSectionScreen(params:EmployeeProfileFieldsParams(skills: true) );
      break;

    case "education":
      AppNavigator.loadEditEmployeeSelectedSectionScreen(params:EmployeeProfileFieldsParams(education: true) );
      break;

    case "employeeDescription":
      AppNavigator.loadEditEmployeeSelectedSectionScreen(params:EmployeeProfileFieldsParams(employeeDescription: true) );
      break;

    default:
      AppNavigator.loadEditEmployeeSelectedSectionScreen( );
  }
}

String getBoostDescription(String? field) {
  switch (field) {
    case "emailVerified":
      return "Verifying email helps recruiters trust your profile";

    case "city":
      return "Adding your city helps recruiters find you for local openings";

    case "state":
      return "Adding your state improves your location-based job matches";

    case "resume":
      return "A complete resume helps recruiters evaluate your experience";

    case "skills":
      return "Adding skills helps recruiters understand your strengths";

    case "education":
      return "Adding education details helps recruiters verify your background";

    case "employeeDescription":
      return "A short bio helps recruiters know more about you";

    default:
      return "Complete this detail to improve your profile visibility";
  }
}
class EmployeeProfileFieldsParams {
  final bool? city;
  final bool? state;
  final bool? resume;
  final bool? skills;
  final bool? education;
  final bool? employeeDescription;
  final bool? email;

  EmployeeProfileFieldsParams({
    this.city,
    this.state,
    this.email,
    this.employeeDescription,
    this.resume,
    this.skills,
    this.education,


  });
}
