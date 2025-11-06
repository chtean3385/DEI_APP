import 'package:dei_champions/ui/pages/about_us/about_us.dart';
import 'package:dei_champions/ui/pages/auth/signup/employee_signup_screen.dart';
import 'package:dei_champions/ui/pages/corporates_championing/corporates_championing_screen.dart';
import 'package:dei_champions/ui/pages/empower_women/empower_women_screen.dart';
import 'package:dei_champions/ui/pages/home/components/top_companies/top_companies_list_screen.dart';
import 'package:dei_champions/ui/pages/lgbtq/Shine%20with%20Pride_screen.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../models/auth/auth_model.dart';
import '../models/job/job_model.dart';
import '../repo/shared_preference_repository.dart';
import '../ui/pages/auth/forgot_password/forgot_password_screen.dart';
import '../ui/pages/auth/login_screen.dart';
import '../ui/pages/auth/otp/otp_screen.dart';
import '../ui/pages/auth/signup/choose_signup_type.dart';
import '../ui/pages/auth/signup_employer/signup_employer_screen.dart';
import '../ui/pages/career_explorers/career_explorers_screen.dart';
import '../ui/pages/common_screens/blog/blog_detail_screen.dart';
import '../ui/pages/common_screens/blog/blog_screen.dart';
import '../ui/pages/common_screens/faq/faq_screen.dart';
import '../ui/pages/common_screens/html_detail_page.dart';
import '../ui/pages/common_screens/our_team/our_team_screen.dart';
import '../ui/pages/common_screens/plan_pricing/plan_pricing_screen.dart';
import '../ui/pages/company/company_profile_screen.dart';
import '../ui/pages/employer/candidate/candidate_list_screen.dart';
import '../ui/pages/employer/candidate/candidate_profile_details_screen.dart';
import '../ui/pages/employer/employer_job_details/employer_job_details_screen.dart';
import '../ui/pages/employer/employer_main/employer_bottom_bar.dart';
import '../ui/pages/employer/employer_profile/edit_employer_profile.dart';
import '../ui/pages/employer/post_job/edit_job_post_screen.dart';
import '../ui/pages/genz/genz_screen.dart';
import '../ui/pages/home/components/recommended_jobs/recommended_jobs.dart';
import '../ui/pages/invites/job_invite_details_screen.dart';
import '../ui/pages/job/job_details_screen.dart';
import '../ui/pages/lets_connect/lets_connect_screen.dart';
import '../ui/pages/main/bottom_bar.dart';
import '../ui/pages/main/similar_jobs_list_screen.dart';
import '../ui/pages/men_alias/men_alias_screen.dart';
import '../ui/pages/not_defined_by_disability/not_defined_by_disability_screen.dart';
import '../ui/pages/notification/employee_notification_screen.dart';
import '../ui/pages/on_board/onboard_screen.dart';
import '../ui/pages/profile/edit_profile_screen.dart';
import '../ui/pages/profile/employee_profile_details_screen.dart';
import '../ui/pages/profile/upload_profile_pic.dart';
import '../ui/pages/saved_jobs/saved_jobs_screen.dart';
import '../ui/pages/search/job_search_result_screen.dart';
import '../ui/pages/search/job_search_screen.dart';
import '../ui/pages/veteran/veteran_screen.dart';

class AppNavigator {
  static Future<void> saveAuthDataAndLoadBottomBar({
    AuthModel? authModel,
  }) async {
    await SharedPreferenceRepository.setToken(authModel!.token);
    await SharedPreferenceRepository.setUserId(authModel.userId);
    await SharedPreferenceRepository.setRoleId(authModel.roleId);
    await SharedPreferenceRepository.setHasUploadedResume(authModel.resumeUrl.isNotEmpty);
    if (authModel.roleId == 2) {
      Navigator.pushAndRemoveUntil(
        navigatorKey.currentContext!,
        MaterialPageRoute(builder: (_) => EmployerBottomBar()),
        (route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        navigatorKey.currentContext!,
        MaterialPageRoute(builder: (_) => BottomBar()),
        (route) => false,
      );
    }
  }

  static Future<void> toBottomBar({int initialPage = 0,Map<String, dynamic>? params}) async {
    final roleId = await SharedPreferenceRepository.getRoleId();
    if (roleId == 2) {
      Navigator.pushAndRemoveUntil(
        navigatorKey.currentContext!,
        MaterialPageRoute(
          builder: (_) => EmployerBottomBar(initialPage: initialPage),
        ),
        (route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        navigatorKey.currentContext!,
        MaterialPageRoute(builder: (_) => BottomBar(initialPage: initialPage,params: params,)),
        (route) => false,
      );
    }
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

  static loadHtmlDetailPage( String pageTitle) {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => HtmlDetailPage(title: pageTitle),
      ),
    );
  }
  static loadOurTeams() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => OurTeamScreen(),
      ),
    );
  }
  static loadLetsConnect() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => LetsConnectScreen(),
      ),
    );
  }
  static loadFaqScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => FaqScreen(),
      ),
    );
  }
  static loaBlogScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => BlogScreen(),
      ),
    );
  }
  static loaBlogDetailsScreen(String id) {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => BlogDetailScreen(id: id),
      ),
    );
  }
  static loaPricePlanScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => PlanPricingScreen(),
      ),
    );
  }
  static loadJobSearchResultScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => JobSearchResultScreen()),
    );
  }
  static loadEmployeeNotificationsScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => EmployeeNotificationsScreen()),
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

  static loadJobDetailsScreen( {JobModel? jobModel,String? jobId}) {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (_) =>
            JobDetailsScreen(jobModel: jobModel,jobId: jobId,),
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

  static loadCorporatesChampioningScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => CorporatesChampioningScreen()),
    );
  }

  static loadEditProfileScreen({bool isEmployer = false}) {
    isEmployer
        ? Navigator.push(
            navigatorKey.currentContext!,
            MaterialPageRoute(builder: (_) => EditEmployerProfileScreen()),
          )
        : Navigator.push(
            navigatorKey.currentContext!,
            MaterialPageRoute(builder: (_) => EditProfileScreen()),
          );
  }

  static loadEditEmployeeResumeScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => EmployeeProfileDetailsScreen()),
    );
  }

  static loadSavedJobsScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => SavedJobsScreen()),
    );
  }

  static Map<String, Function(Map<String, dynamic>? params)> routeMap = {
    "allApplications": (params) => AppNavigator.toBottomBar(initialPage: 1, params: params),
    "savedJobs": (params) => AppNavigator.toBottomBar(initialPage: 2),
    "pending": (params) => AppNavigator.toBottomBar(initialPage: 1, params: params),
    "accepted": (params) => AppNavigator.toBottomBar(initialPage: 1, params: params),
    "interviewing": (params) => AppNavigator.toBottomBar(initialPage: 1, params: params),
    "negotiation": (params) => AppNavigator.toBottomBar(initialPage: 1, params: params),
    "hired": (params) => AppNavigator.toBottomBar(initialPage: 1, params: params),
    "rejected": (params) => AppNavigator.toBottomBar(initialPage: 1, params: params),
  };

  static loadOnBoarding() {
    Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => OnBoardScreen()),
      (route) => false,
    );
  }

  /////////***********employer**********////////
  static loadEmployerJobDetailsScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => EmployerJobDetailsScreen()),
    );
  }
  static loadCandidateProfileDetailsScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => CandidateProfileDetailsScreen()),
    );
  }


  static loadEditJobPostScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => EditJobPostScreen()),
    );
  }
  static loadCandidatesScreen() {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (_) => CandidatesScreen()),
    );
  }
}
