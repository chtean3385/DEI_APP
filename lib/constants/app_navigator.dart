import 'package:dei_champions/ui/pages/about_us/about_us.dart';
import 'package:dei_champions/ui/pages/auth/signup/employee_signup_screen.dart';
import 'package:dei_champions/ui/pages/empower_women/empower_women_screen.dart';
import 'package:dei_champions/ui/pages/home/components/top_companies/top_companies_list_screen.dart';
import 'package:dei_champions/ui/pages/lgbtq/Shine%20with%20Pride_screen.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../models/auth/auth_model.dart';
import '../models/job/job_model.dart';
import '../repo/shared_preference_repository.dart';
import '../ui/pages/All/sections/saved_jobs/saved_jobs_screen.dart';
import '../ui/pages/auth/forgot_password/forgot_password_screen.dart';
import '../ui/pages/auth/login_screen.dart';
import '../ui/pages/auth/otp/otp_screen.dart';
import '../ui/pages/auth/signup/choose_signup_type.dart';
import '../ui/pages/auth/signup_employer/signup_employer_screen.dart';
import '../ui/pages/career_explorers/career_explorers_screen.dart';
import '../ui/pages/company/company_profile_screen.dart';
import '../ui/pages/genz/genz_screen.dart';
import '../ui/pages/home/components/recommended_jobs/recommended_jobs.dart';
import '../ui/pages/invites/job_invite_details_screen.dart';
import '../ui/pages/job/job_details_screen.dart';
import '../ui/pages/main/bottom_bar.dart';
import '../ui/pages/main/similar_jobs_list_screen.dart';
import '../ui/pages/men_alias/men_alias_screen.dart';
import '../ui/pages/not_defined_by_disability/not_defined_by_disability_screen.dart';
import '../ui/pages/on_board/onboard_screen.dart';
import '../ui/pages/profile/edit_profile_screen.dart';
import '../ui/pages/profile/upload_profile_pic.dart';
import '../ui/pages/search/job_search_result_screen.dart';
import '../ui/pages/search/job_search_screen.dart';
import '../ui/pages/veteran/veteran_screen.dart';

class AppNavigator {
  static Future<void> saveAuthDataAndLoadBottomBar({
    AuthModel? authModel,
  }) async {
    await SharedPreferenceRepository.setToken(authModel!.token);
    await SharedPreferenceRepository.setUserId(authModel.userId);
    Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => BottomBar()),
      (route) => false,
    );
  }

  static void toBottomBar({int initialPage = 0}) {
    Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (_) => BottomBar(
          initialPage: initialPage,
        ),
      ),
      (route) => false,
    );
  }

  static loadSignInScreen({bool isFromLogout = false}) {
    Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => SignInScreen()),
      (route) => false,
    );
  }

  static loadCommonSignUp() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => ChooseSignupType()),
      // (route) => false,
    );
  }

  static loadSignUpScreen({bool isFromLogout = false}) {
    // if(!isFromLogout) initController();
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => EmployeeSignupScreen()),
      // (route) => false,
    );
  }

  static loadEmployerSignUpScreen({bool isFromLogout = false}) {
    // if(!isFromLogout) initController();
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => SignupEmployerScreen()),
      // (route) => false,
    );
  }

  static Future<bool> loadOtpScreenForSignup({
    bool isFromEmployeeSignup = false,
    bool isFromEmployerSignup = false,
    required String email,
  }) async {
    final result = await Navigator.push<bool>(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (_) => OTPVerificationScreen(
          isFromEmployeeSignup: isFromEmployeeSignup,
          isFromEmployerSignup: isFromEmployerSignup,
          email: email,
        ),
      ),
    );

    return result ?? false; // default false if user backs out
  }

  static loadOtpScreen(String email) async {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (_) => OTPVerificationScreen(isFromLogin: true, email: email),
      ),
    );
  }

  static loadForgotPasswordScreen({bool isFromLogout = false}) {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => ForgotPasswordScreen()),
    );
  }

  static loadJobSearchResultScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => JobSearchResultScreen()),
    );
  }

  static loadJobSearchScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => JobSearchScreen()),
    );
  }

  static loadTopCompaniesListScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => TopCompanyListScreen()),
    );
  }

  static loadRecommendedJobsScreen({int initialCategoryId = 1}) {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (_) =>
            RecommendedJobsScreen(initialCategoryId: initialCategoryId),
      ),
    );
  }

  static loadUploadProfilePicScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => UploadProfilePic()),
    );
  }

  static loadJobDetailsScreen(JobModel jobModel, {bool isFromSearch = false}) {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (_) =>
            JobDetailsScreen(jobModel: jobModel, isFromSearch: isFromSearch),
      ),
    );
  }

  static loadJobInviteDetailsScreen(JobModel jobModel) {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (_) => JobInviteDetailsScreen(jobModel: jobModel),
      ),
    );
  }

  static loadSimilarJobsListScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => SimilarJobsListScreen()),
    );
  }

  static loadCompanyProfileScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => CompanyProfileScreen()),
    );
  }
  static loadAboutUsScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => AboutUsScreen()),
    );
  }
  static loadEmpowerWomenScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => EmpowerWomenScreen()),
    );
  }
  static loadMenAsAliasScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => MenAliasScreen()),
    );
  }
  static loadNotDefinedByDisabilityScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => NotDefinedByDisabilityScreen()),
    );
  }
  static loadGenZScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => GenZScreen()),
    );
  }
  static loadVeteranScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => VeteranScreen()),
    );
  }
  static loadLgbtqScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => LgbtqScreen()),
    );
  }
  static loadCareerExplorersScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => CareerExplorersScreen()),
    );
  }
  static loadEditProfileScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => EditProfileScreen()),
    );
  }
  static loadSavedJobsScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => SavedJobsScreen()),
    );
  }
  static Map<String, VoidCallback> routeMap = {
    "saved": AppNavigator.loadSavedJobsScreen,
    // "applied": AppNavigator.loadAppliedJobsScreen,
    // "cv": AppNavigator.loadCvScreen,
    // "bids": AppNavigator.loadBidsScreen,
    // "interview": AppNavigator.loadInterviewSchedulesScreen,
    // "application": AppNavigator.loadApplicationSentScreen,
    // "profile": AppNavigator.loadProfileViewsScreen,
    // "messages": AppNavigator.loadMessagesScreen,
    // "articles": AppNavigator.loadArticlesScreen,
  };
  static loadOnBoarding() {
    Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => OnBoardScreen()),
          (route) => false,
    );
  }
}
