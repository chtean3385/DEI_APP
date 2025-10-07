// providers.dart
import 'package:dei_champions/models/state_models/about_us/about_us_state.dart';
import 'package:dei_champions/models/state_models/about_us/about_vision_state.dart';
import 'package:dei_champions/models/state_models/about_us/what_we_do_state.dart';
import 'package:dei_champions/models/state_models/home/friendly_industries_state.dart';
import 'package:dei_champions/models/state_models/home/job_category_state.dart';
import 'package:dei_champions/models/state_models/home/we_are_hiring_state.dart';
import 'package:dei_champions/providers/controllers/auth/verify_otp_controller.dart';
import 'package:dei_champions/providers/controllers/home/category/friendly_industry_controller.dart';
import 'package:dei_champions/providers/controllers/home/category/how_it_works_controller.dart';
import 'package:dei_champions/providers/controllers/home/category/job_category_controller.dart';
import 'package:dei_champions/providers/controllers/home/category/job_service_controller.dart';
import 'package:dei_champions/providers/controllers/home/category/we_are_hiring_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/enums.dart';
import '../models/state_models/auth_state.dart';
import '../models/state_models/home/champion_candidates_state.dart';
import '../models/state_models/home/featured_employers_state.dart';
import '../models/state_models/home/how_it_works_state.dart';
import '../models/state_models/home/job_service_state.dart';
import '../models/state_models/otp_state.dart';
import '../models/state_models/register_state.dart';
import '../models/state_models/signup_flow_state.dart';
import 'controllers/about_us/about_us_controller.dart';
import 'controllers/about_us/about_vision_controller.dart';
import 'controllers/about_us/what_we_do_controller.dart';
import 'controllers/app_controller.dart';
import 'controllers/auth/employee_login_controller.dart';
import 'controllers/auth/employer_register_controller.dart';
import 'controllers/auth/employer_register_page_view_controller.dart';
import 'controllers/auth/employee_register_controller.dart';
import 'controllers/auth/register_page_view_controller.dart';
import 'controllers/home/category/champion_candidates_controller.dart';
import 'controllers/home/category/featured_employers_controller.dart';


final appProvider =
    AutoDisposeNotifierProvider<AppController, PageState>(
      () => AppController(),
    );


/// login controller

final loginProvider  = StateNotifierProvider.autoDispose<LoginController, AuthState>((ref) {
  return LoginController(ref);
});

/// registration controller
final registerProvider  = StateNotifierProvider.autoDispose<EmployeeRegisterController, RegisterState>((ref) {
  return EmployeeRegisterController(ref);
});
/// registration controller
final employerRegisterProvider  = StateNotifierProvider.autoDispose<EmployerRegisterController, EmployerRegisterState>((ref) {
  return EmployerRegisterController(ref);
});
/// verify OTP controller
final verifyOtpProvider  = StateNotifierProvider.autoDispose<VerifyOtpController, OtpState>((ref) {
  return VerifyOtpController(ref);
});

/// signup Page view Provider
final signupFlowControllerProvider =
AutoDisposeNotifierProvider<SignupFlowController, SignupFlowState>(
    SignupFlowController.new);

/// signup Page employer
final employerSignupFlowControllerProvider =
AutoDisposeNotifierProvider<EmployerSignupFlowController, SignupFlowState>(
    EmployerSignupFlowController.new);

///job categories
final jobCategoryProvider =
StateNotifierProvider.autoDispose<JobCategoryController, JobCategoryState>((ref) {
  return JobCategoryController(ref);
});


///featured employers
final featuredEmployersProvider =
StateNotifierProvider.autoDispose<FeaturedEmployersController, FeaturedEmployersState>((ref) {
  return FeaturedEmployersController();
});

///friendly industries
final friendlyIndustryProvider =
StateNotifierProvider.autoDispose<FriendlyIndustryController, FriendlyIndustryState>((ref) {
  return FriendlyIndustryController();
});
///job services
final jobServiceProvider =
StateNotifierProvider.autoDispose<JobServiceController, JobServiceState>((ref) {
  return JobServiceController(ref);
});
///hiring banner
final hiringBannerProvider =
StateNotifierProvider.autoDispose<WeAreHiringController, WeAreHiringState>((ref) {
  return WeAreHiringController(ref);
});
///howItWorks
final howItWorksProvider =
StateNotifierProvider.autoDispose<HowItWorksController, HowItWorkState>((ref) {
  return HowItWorksController(ref);
});

///championCandidates
final championCandidatesProvider =
StateNotifierProvider.autoDispose<ChampionCandidatesController, ChampionCandidatesState>((ref) {
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
StateNotifierProvider.autoDispose<AboutVisionController, AboutVisionState>((ref) {
  return AboutVisionController();
});



