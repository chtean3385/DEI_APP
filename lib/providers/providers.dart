// providers.dart
import 'package:dei_champions/models/state_models/about_us/about_us_state.dart';
import 'package:dei_champions/models/state_models/about_us/about_vision_state.dart';
import 'package:dei_champions/models/state_models/about_us/core_value_state.dart';
import 'package:dei_champions/models/state_models/about_us/revolution_state.dart';
import 'package:dei_champions/models/state_models/about_us/what_we_do_state.dart';
import 'package:dei_champions/models/state_models/common/blog_detail_state.dart';
import 'package:dei_champions/models/state_models/common/blog_state.dart';
import 'package:dei_champions/models/state_models/common/csr/csr_banner_state.dart';
import 'package:dei_champions/models/state_models/common/csr/csr_focus_area_state.dart';
import 'package:dei_champions/models/state_models/common/csr/csr_impact_state.dart';
import 'package:dei_champions/models/state_models/common/csr/csr_objectives_state.dart';
import 'package:dei_champions/models/state_models/common/faq_state.dart';
import 'package:dei_champions/models/state_models/common/price_plan_state.dart';
import 'package:dei_champions/models/state_models/employer/candidates_state.dart';
import 'package:dei_champions/models/state_models/employer/emplyer_applications_state.dart';
import 'package:dei_champions/models/state_models/home/friendly_industries_state.dart';
import 'package:dei_champions/models/state_models/home/job_category_state.dart';
import 'package:dei_champions/models/state_models/home/we_are_hiring_state.dart';
import 'package:dei_champions/models/state_models/common/html_page_data_state.dart';
import 'package:dei_champions/models/state_models/job/job_list_state.dart';
import 'package:dei_champions/models/state_models/job/job_type_list_state.dart';
import 'package:dei_champions/models/state_models/notification/notification_state.dart';
import 'package:dei_champions/providers/controllers/auth/verify_otp_controller.dart';
import 'package:dei_champions/providers/controllers/common/blog_controller.dart';
import 'package:dei_champions/providers/controllers/common/csr/csr_banner_section_controller.dart';
import 'package:dei_champions/providers/controllers/common/csr/csr_focus_area_section_controller.dart';
import 'package:dei_champions/providers/controllers/common/csr/csr_impact_section_controller.dart';
import 'package:dei_champions/providers/controllers/common/csr/csr_objectives_section_controller.dart';
import 'package:dei_champions/providers/controllers/common/faq_controller.dart';
import 'package:dei_champions/providers/controllers/home/category/friendly_industry_controller.dart';
import 'package:dei_champions/providers/controllers/home/category/how_it_works_controller.dart';
import 'package:dei_champions/providers/controllers/home/category/job_category_controller.dart';
import 'package:dei_champions/providers/controllers/home/category/job_service_controller.dart';
import 'package:dei_champions/providers/controllers/home/category/we_are_hiring_controller.dart';
import 'package:dei_champions/providers/controllers/notification/notification_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/enums.dart';
import '../models/state_models/applied/applied_job_state.dart';
import '../models/state_models/auth_state.dart';
import '../models/state_models/dash_board/dash_board_state.dart';
import '../models/state_models/disability/disability_bottom_state.dart';
import '../models/state_models/disability/disability_inclusion_steps_state.dart';
import '../models/state_models/disability/disability_title_state.dart';
import '../models/state_models/employer/add_edit_job_state.dart';
import '../models/state_models/empower_women/empower_women_program_state.dart';
import '../models/state_models/empower_women/empower_women_quote_state.dart';
import '../models/state_models/empower_women/empower_women_workforce_state.dart';
import '../models/state_models/genz/genz_advantages_state.dart';
import '../models/state_models/genz/genz_bottom_buttons_state.dart';
import '../models/state_models/genz/genz_growth_state.dart';
import '../models/state_models/genz/genz_title_state.dart';
import '../models/state_models/home/champion_candidates_state.dart';
import '../models/state_models/home/featured_employers_state.dart';
import '../models/state_models/home/how_it_works_state.dart';
import '../models/state_models/home/job_service_state.dart';
import '../models/state_models/job/job_state.dart';
import '../models/state_models/job/salary_range_list_state.dart';
import '../models/state_models/lgbtq/lgbtq_advantages_state.dart';
import '../models/state_models/lgbtq/lgbtq_inclusion_point_state.dart';
import '../models/state_models/lgbtq/lgbtq_quote_state.dart';
import '../models/state_models/lgbtq/lgbtq_title_state.dart';
import '../models/state_models/men_alias/ally_ship_men_state.dart';
import '../models/state_models/men_alias/allyship_matter_state.dart';
import '../models/state_models/men_alias/champion_diversity_state.dart';
import '../models/state_models/men_alias/men_as_alias_title_state.dart';
import '../models/state_models/men_alias/organizational_benefit_state.dart';
import '../models/state_models/on_boarding_state.dart';
import '../models/state_models/otp_state.dart';
import '../models/state_models/out_teeam/our_team_state.dart';
import '../models/state_models/profile/employee_profile_state.dart';
import '../models/state_models/profile/profile_state.dart';
import '../models/state_models/register_state.dart';
import '../models/state_models/signup_flow_state.dart';
import '../models/state_models/veteran/veteran_advantag_state.dart';
import '../models/state_models/veteran/veteran_future_state.dart';
import '../models/state_models/veteran/veteran_organizational_benefit_state.dart';
import '../models/state_models/veteran/veteran_quote_state.dart';
import '../models/state_models/veteran/veteran_title_state.dart';
import 'controllers/EMPLOYER/employer_dashboard/employer_dash_board_controller.dart';
import 'controllers/Employer/candidate/candidate_profile_controller.dart';
import 'controllers/Employer/candidate/candidates_list_controller.dart';
import 'controllers/Employer/employer_job/employer_application_controller.dart';
import 'controllers/Employer/employer_job/post_new_job_controller.dart';
import 'controllers/Employer/employer_profile/edit_employer_profile_controller.dart';
import 'controllers/Employer/manage_jobs/current_jobs_controller.dart';
import 'controllers/Employer/manage_jobs/employer_manage_jobs_controller.dart';
import 'controllers/about_us/about_us_controller.dart';
import 'controllers/about_us/about_vision_controller.dart';
import 'controllers/about_us/core_value_controller.dart';
import 'controllers/about_us/revolution_controller.dart';
import 'controllers/about_us/what_we_do_controller.dart';
import 'controllers/app_controller.dart';
import 'controllers/applied/applied_jobs_controller.dart';
import 'controllers/auth/employee_login_controller.dart';
import 'controllers/auth/employer_register_controller.dart';
import 'controllers/auth/employer_register_page_view_controller.dart';
import 'controllers/auth/employee_register_controller.dart';
import 'controllers/auth/register_page_view_controller.dart';
import 'controllers/common/blog_detail_controller.dart';
import 'controllers/common/csr/csr_impact_stories_section_controller.dart';
import 'controllers/common/html_page_data_list_controller.dart';
import 'controllers/common/lets_connect_controller.dart';
import 'controllers/common/price_plan_controller.dart';
import 'controllers/dash_board/dash_board_controller.dart';
import 'controllers/disability/disability_bottom_section_controller.dart';
import 'controllers/disability/disability_inclusion_setps_controller.dart';
import 'controllers/disability/disability_title_section_controller.dart';
import 'controllers/empower_women/empower_women_program_controller.dart';
import 'controllers/empower_women/empower_women_quote_controller.dart';
import 'controllers/empower_women/empower_women_workforce_controller.dart';
import 'controllers/genz/genz_advantages_section_controller.dart';
import 'controllers/genz/genz_bottom_buttons_section_controller.dart';
import 'controllers/genz/genz_growth_section_controller.dart';
import 'controllers/genz/genz_title_section_controller.dart';
import 'controllers/home/category/champion_candidates_controller.dart';
import 'controllers/home/category/featured_employers_controller.dart';
import 'controllers/job/employee_applied_jobs_controller.dart';
import 'controllers/job/employee_job_details_controller.dart';
import 'controllers/job/employee_manage_job_controller.dart';
import 'controllers/job/employee_recommended_jobs_controller.dart';
import 'controllers/job/employee_saved_jobs_controller.dart';
import 'controllers/job/employee_search_jobs_controller.dart';
import 'controllers/job/employee_similar_jobs_controller.dart';
import 'controllers/job/job_types_controller.dart';
import 'controllers/job/salary_range_type_controller.dart';
import 'controllers/lgbtq/lgbtq_advantage_section_controller.dart';
import 'controllers/lgbtq/lgbtq_inclusion_section_controller.dart';
import 'controllers/lgbtq/lgbtq_quotes_section1_controller.dart';
import 'controllers/lgbtq/lgbtq_quotes_section2_controller.dart';
import 'controllers/lgbtq/lgbtq_title_section_controller.dart';
import 'controllers/men_alias/ally_ship_men_controller.dart';
import 'controllers/men_alias/allyship_matter_controller.dart';
import 'controllers/men_alias/champion_diversity_controller.dart';
import 'controllers/men_alias/men_as_alias_title_controller.dart';
import 'controllers/men_alias/organizational_benefit_controller.dart';
import 'controllers/on_boarding/on_boarding_controller.dart';
import 'controllers/our_team/our_team_controller.dart';
import 'controllers/profile/edit_profile_controller.dart';
import 'controllers/profile/employee_profile_controller.dart';
import 'controllers/veteran/veteran_advantage_controller.dart';
import 'controllers/veteran/veteran_organizational_gorwth_controller.dart';
import 'controllers/veteran/veteran_quote_section_controller.dart';
import 'controllers/veteran/veteran_role_controller.dart';
import 'controllers/veteran/veteran_title_section_controller.dart';

final appProvider = AutoDisposeNotifierProvider<AppController, PageState>(
  () => AppController(),
);
final onBoardingProvider =
    StateNotifierProvider.autoDispose<OnBoardingController, OnBoardingState>((
      ref,
    ) {
      return OnBoardingController();
    });

/// login controller

final loginProvider =
    StateNotifierProvider.autoDispose<LoginController, AuthState>((ref) {
      return LoginController(ref);
    });

/// registration controller
final registerProvider =
    StateNotifierProvider.autoDispose<
      EmployeeRegisterController,
      RegisterState
    >((ref) {
      return EmployeeRegisterController(ref);
    });

/// registration controller
final employerRegisterProvider =
    StateNotifierProvider.autoDispose<
      EmployerRegisterController,
      EmployerRegisterState
    >((ref) {
      return EmployerRegisterController(ref);
    });

/// verify OTP controller
final verifyOtpProvider =
    StateNotifierProvider.autoDispose<VerifyOtpController, OtpState>((ref) {
      return VerifyOtpController(ref);
    });

/// signup Page view Provider
final signupFlowControllerProvider =
    AutoDisposeNotifierProvider<SignupFlowController, SignupFlowState>(
      SignupFlowController.new,
    );

/// signup Page employer
final employerSignupFlowControllerProvider =
    AutoDisposeNotifierProvider<EmployerSignupFlowController, SignupFlowState>(
      EmployerSignupFlowController.new,
    );

///common html content screens
final commonHtmlPageContentsProvider =
    StateNotifierProvider.autoDispose<
      HtmlPageDataListController,
      HtmlPageDataListState
    >((ref) {
      return HtmlPageDataListController();
    });

///dashboard dynamic counts
final dashBoardProvider =
    StateNotifierProvider.autoDispose<DashBoardController, DashBoardState>((
      ref,
    ) {
      return DashBoardController();
    });

///job categories
final jobCategoryProvider =
    StateNotifierProvider.autoDispose<JobCategoryController, JobCategoryState>((
      ref,
    ) {
      return JobCategoryController(ref);
    });

///featured employers
final featuredEmployersProvider =
    StateNotifierProvider.autoDispose<
      FeaturedEmployersController,
      FeaturedEmployersState
    >((ref) {
      return FeaturedEmployersController();
    });

///friendly industries
final friendlyIndustryProvider =
    StateNotifierProvider.autoDispose<
      FriendlyIndustryController,
      FriendlyIndustryState
    >((ref) {
      return FriendlyIndustryController();
    });

///job services
final jobServiceProvider =
    StateNotifierProvider.autoDispose<JobServiceController, JobServiceState>((
      ref,
    ) {
      return JobServiceController(ref);
    });

///hiring banner
final hiringBannerProvider =
    StateNotifierProvider.autoDispose<WeAreHiringController, WeAreHiringState>((
      ref,
    ) {
      return WeAreHiringController(ref);
    });

///howItWorks
final howItWorksProvider =
    StateNotifierProvider.autoDispose<HowItWorksController, HowItWorkState>((
      ref,
    ) {
      return HowItWorksController(ref);
    });

///championCandidates
final championCandidatesProvider =
    StateNotifierProvider.autoDispose<
      ChampionCandidatesController,
      ChampionCandidatesState
    >((ref) {
      return ChampionCandidatesController(ref);
    });

///what we do -about us
final whatWeDoProvider =
    StateNotifierProvider.autoDispose<WhatWeDoController, WhatWeDoState>((ref) {
      return WhatWeDoController();
    });

///what we do -about us
final aboutUsProvider =
    StateNotifierProvider.autoDispose<AboutUsController, AboutUsState>((ref) {
      return AboutUsController();
    });

///what we do -vision
final aboutVisionProvider =
    StateNotifierProvider.autoDispose<AboutVisionController, AboutVisionState>((
      ref,
    ) {
      return AboutVisionController();
    });

///core values
final coreValuesProvider =
    StateNotifierProvider.autoDispose<CoreValueController, CoreValueState>((
      ref,
    ) {
      return CoreValueController();
    });

///revolution
final aboutUsRevolutionProvider =
    StateNotifierProvider.autoDispose<
      AboutUsRevolutionController,
      RevolutionState
    >((ref) {
      return AboutUsRevolutionController();
    });

///empower women
final womenWorkForceProvider =
    StateNotifierProvider.autoDispose<
      EmpowerWomenWorkForceController,
      EmpowerWomenWorkforceState
    >((ref) {
      return EmpowerWomenWorkForceController();
    });
final womenQuoteControllerProvider =
    StateNotifierProvider.autoDispose<
      EmpowerWomenQuoteController,
      EmpowerWomenQuoteState
    >((ref) {
      return EmpowerWomenQuoteController();
    });
final womenProgramControllerProvider =
    StateNotifierProvider.autoDispose<
      EmpowerWomenProgramController,
      EmpowerWomenProgramState
    >((ref) {
      return EmpowerWomenProgramController();
    });

///men alias
final menAllyShipProvider =
    StateNotifierProvider.autoDispose<AllyShipMenController, AllyShipMenState>((
      ref,
    ) {
      return AllyShipMenController();
    });
final allyShipMatterProvider =
    StateNotifierProvider.autoDispose<
      AllyShipMatterController,
      AllyShipMatterState
    >((ref) {
      return AllyShipMatterController();
    });
final championDiversityProvider =
    StateNotifierProvider.autoDispose<
      MenChampionDiversityController,
      ChampionDiversityState
    >((ref) {
      return MenChampionDiversityController();
    });
final menAliasTitleProvider =
    StateNotifierProvider.autoDispose<
      MenAsAliasTitleController,
      MenAsAliasTitleState
    >((ref) {
      return MenAsAliasTitleController();
    });
final organizationalBenefitProvider =
    StateNotifierProvider.autoDispose<
      OrganizationalBenefitController,
      OrganizationalBenefitState
    >((ref) {
      return OrganizationalBenefitController();
    });

///not defined by disability
final disabilityTitleSectionProvider =
    StateNotifierProvider.autoDispose<
      DisabilityTitleSectionController,
      DisabilityTitleState
    >((ref) {
      return DisabilityTitleSectionController();
    });
final disabilityBottomSectionProvider =
    StateNotifierProvider.autoDispose<
      DisabilityBottomSectionController,
      DisabilityBottomState
    >((ref) {
      return DisabilityBottomSectionController();
    });
final disabilityInclusionStepsProvider =
    StateNotifierProvider.autoDispose<
      DisabilityInclusionStepsController,
      DisabilityInclusionStepsState
    >((ref) {
      return DisabilityInclusionStepsController();
    });

///gen z
final genZTitleSectionProvider =
    StateNotifierProvider.autoDispose<
      GenZTitleSectionController,
      GenZTitleState
    >((ref) {
      return GenZTitleSectionController();
    });
final genZGrowthSectionProvider =
    StateNotifierProvider.autoDispose<
      GenZGrowthSectionController,
      GenZGrowthState
    >((ref) {
      return GenZGrowthSectionController();
    });
final genZBottomButtonSectionProvider =
    StateNotifierProvider.autoDispose<
      GenZBottomButtonSectionController,
      GenZBottomButtonState
    >((ref) {
      return GenZBottomButtonSectionController();
    });
final genZAdvantagesSectionControllerProvider =
    StateNotifierProvider.autoDispose<
      GenZAdvantagesSectionController,
      GenZAdvantagesState
    >((ref) {
      return GenZAdvantagesSectionController();
    });

/// veteran
final veteranTitleSectionProvider =
    StateNotifierProvider.autoDispose<
      VeteranTitleSectionController,
      VeteranTitleState
    >((ref) {
      return VeteranTitleSectionController();
    });
final veteranRoleSectionProvider =
    StateNotifierProvider.autoDispose<
      VeteranRoleSectionController,
      VeteranRoleState
    >((ref) {
      return VeteranRoleSectionController();
    });

final veteranOrganizationalBenefitSectionProvider =
    StateNotifierProvider.autoDispose<
      VeteranOrganizationalBenefitSectionController,
      VeteranOrganizationalBenefitState
    >((ref) {
      return VeteranOrganizationalBenefitSectionController();
    });
final veteranAdvantageSectionProvider =
    StateNotifierProvider.autoDispose<
      VeteranAdvantageSectionController,
      VeteranAdvantageState
    >((ref) {
      return VeteranAdvantageSectionController();
    });
final veteranQuoteSectionProvider =
    StateNotifierProvider.autoDispose<
      VeteranQuoteSectionController,
      VeteranQuoteState
    >((ref) {
      return VeteranQuoteSectionController();
    });

/// LGBTQ
final lgbtqTitleSectionProvider =
    StateNotifierProvider.autoDispose<
      LgbtqTitleSectionController,
      LgbtqTitleState
    >((ref) {
      return LgbtqTitleSectionController();
    });
final lgbtqAdvantagesController =
    StateNotifierProvider.autoDispose<
      LgbtqAdvantagesSectionController,
      LgbtqAdvantagesState
    >((ref) {
      return LgbtqAdvantagesSectionController();
    });

final lgbtqQuoteSection1Provider =
    StateNotifierProvider.autoDispose<
      LgbtqQuoteSection1Controller,
      LgbtqQuoteState
    >((ref) {
      return LgbtqQuoteSection1Controller();
    });

final lgbtqQuoteSection2Provider =
    StateNotifierProvider.autoDispose<
      LgbtqQuoteSection2Controller,
      LgbtqQuoteState
    >((ref) {
      return LgbtqQuoteSection2Controller();
    });
final lgbtqInclusionPointsProvider =
    StateNotifierProvider.autoDispose<
      LgbtqInclusionPointsController,
      LgbtqInclusionPointState
    >((ref) {
      return LgbtqInclusionPointsController();
    });
final ourTeamProvider =
    StateNotifierProvider.autoDispose<OurTeamController, OurTeamState>((ref) {
      return OurTeamController(ref);
    });
final letsConnectProvider =
    StateNotifierProvider.autoDispose<LetsConnectController, PageState>((ref) {
      return LetsConnectController(ref);
    });
final faqProvider = StateNotifierProvider.autoDispose<FaqController, FaqState>((
  ref,
) {
  return FaqController();
});
final blogProvider =
    StateNotifierProvider.autoDispose<BlogController, BlogState>((ref) {
      return BlogController();
    });
final blogDetailProvider = StateNotifierProvider.autoDispose
    .family<BlogDetailController, BlogDetailState, String>((ref, id) {
      return BlogDetailController(id);
    });
final planPriceProvider =
    StateNotifierProvider.autoDispose<PricePlanController, PricePlanState>((
      ref,
    ) {
      return PricePlanController();
    });

/// csr
final csrBannerSectionProvider =
    StateNotifierProvider.autoDispose<
      CsrBannerSectionController,
      CsrBannerState
    >((ref) {
      return CsrBannerSectionController();
    });
final csrObjectivesController =
    StateNotifierProvider.autoDispose<
      CsrObjectivesSectionController,
      CsrObjectivesState
    >((ref) {
      return CsrObjectivesSectionController();
    });

final csrFocusPointsSection1Provider =
    StateNotifierProvider.autoDispose<
      CsrFocusAreaSectionController,
      CsrFocusAreaState
    >((ref) {
      return CsrFocusAreaSectionController();
    });
final csrImpactSectionProvider =
    StateNotifierProvider.autoDispose<
      CsrImpactSectionController,
      CsrImpactState
    >((ref) {
      return CsrImpactSectionController();
    });
final csrImpactStoriesSectionProvider =
    StateNotifierProvider.autoDispose<
      CsrImpactStoriesSectionController,
      CsrImpactState
    >((ref) {
      return CsrImpactStoriesSectionController();
    });

final drawerProfileProvider =
    StateNotifierProvider<DrawerProfileController, EmployeeProfileState>((ref) {
      return DrawerProfileController();
    });

/// employee profile
final employeeProfileProvider =
    StateNotifierProvider.autoDispose<
      EmployeeProfileController,
      EmployeeProfileState
    >((ref) {
      return EmployeeProfileController(ref);
    });

/// edit employee profile
final editEmployeeProfileProvider =
    StateNotifierProvider.autoDispose<
      EditEmployeeProfileController,
      EmployeeProfileState
    >((ref) {
      return EditEmployeeProfileController(ref);
    });

///job types
final jobTypesProvider =
    StateNotifierProvider.autoDispose<JobTypesController, JobTypeListState>((
      ref,
    ) {
      return JobTypesController(ref);
    });

///job salary range types
final salaryRangeTypesProvider =
    StateNotifierProvider.autoDispose<
      SalaryRangeTypesController,
      SalaryRangeListState
    >((ref) {
      return SalaryRangeTypesController(ref);
    });

/// applied jobs
final appliedJobsProvider =
    StateNotifierProvider.autoDispose<AppliedJobsController, AppliedJobState>((
      ref,
    ) {
      return AppliedJobsController();
    });
final employeeAppliedJobsProvider =
    StateNotifierProvider.autoDispose<
      EmployeeAppliedJobsController,
      JobListState
    >((ref) {
      return EmployeeAppliedJobsController();
    });

final employeeSavedJobsProvider =
    StateNotifierProvider.autoDispose<EmployeeSavedJobController, JobListState>(
      (ref) {
        return EmployeeSavedJobController();
      },
    );

/// search jobs list
final searchJobListProvider =
    StateNotifierProvider.autoDispose<
      EmployeeSearchJobController,
      JobListState
    >((ref) {
      return EmployeeSearchJobController();
    });
/// recommended jobs list
final recommendedJobListProvider =
StateNotifierProvider.autoDispose<
    EmployeeRecommendedJobController,
    JobListState
>((ref) {
  return EmployeeRecommendedJobController();
});

/// employee manage job
final employeeManageJobProvider =
    StateNotifierProvider<EmployeeManageJobController, JobState>((ref) {
      return EmployeeManageJobController(ref);
    });

/// employee get  job details
final employeeJobDetailsProvider =
    StateNotifierProvider<EmployeeJobDetailsController, JobState>((ref) {
      return EmployeeJobDetailsController();
    });
/// similar jobs list
final similarJobListProvider =
StateNotifierProvider.autoDispose.family<
    EmployeeSimilarJobController,
    JobListState,
    String?
>((ref,jobId) {
  return EmployeeSimilarJobController(jobId);
});
/// employee notifications
final employeeNotificationProvider =
    StateNotifierProvider.autoDispose<
      NotificationController,
      NotificationsState
    >((ref) {
      return NotificationController();
    });


//////*****///////////******* EMPLOYER //////*****///////////*******
//////*****///////////******* EMPLOYER //////*****///////////*******
//////*****///////////******* EMPLOYER //////*****///////////*******
//////*****///////////******* EMPLOYER //////*****///////////*******
//////*****///////////******* EMPLOYER //////*****///////////*******

/// manage jobs
final manageJobsProvider =
    StateNotifierProvider.autoDispose<
      EmployerManageJobsController,
      AppliedJobState
    >((ref) {
      return EmployerManageJobsController();
    });

/// current jobs
final currentJobOpeningsProvider =
    StateNotifierProvider.autoDispose<
      CurrentJobOpeningController,
      AppliedJobState
    >((ref) {
      return CurrentJobOpeningController();
    });

/// edit employer profile
final editEmployerProfileProvider =
    StateNotifierProvider.autoDispose<
      EditEmployerProfileController,
      ProfileState
    >((ref) {
      return EditEmployerProfileController();
    });
final employerApplicationsProvider =
    StateNotifierProvider.autoDispose<
      EmployerApplicationsController,
      EmployerApplicationState
    >((ref) {
      return EmployerApplicationsController();
    });
final addEditJobProvider =
    StateNotifierProvider.autoDispose<
      EmployerPostNewJobController,
      AddEditJobState
    >((ref) {
      return EmployerPostNewJobController(ref);
    });

/// view candidate profile
final candidateProfileProvider =
    StateNotifierProvider.autoDispose<CandidateProfileController, ProfileState>(
      (ref) {
        return CandidateProfileController();
      },
    );

/// view all candidate list
final candidatesListProvider =
    StateNotifierProvider.autoDispose<CandidatesController, CandidatesState>((
      ref,
    ) {
      return CandidatesController();
    });
///employer dashboard dynamic counts
final employerDashBoardProvider =
StateNotifierProvider.autoDispose<EmployerDashBoardController, DashBoardState>((
    ref,
    ) {
  return EmployerDashBoardController();
});