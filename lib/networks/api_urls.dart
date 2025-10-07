class ApiUrls {
  static const baseUrl = 'https://dei-backend.onrender.com/api/';


  //auth
  static const verifyOtp = 'users/employee/verify-otp';
  static const resendOtp = 'resend-otp';
  static const signIn = 'users/employee/login';
  static const employeeSignup = 'users/employee/register';
  static const employerSignup = 'users/employer/register';

// home

  static const jobCategoryData = 'home/exploreCategory/get-all';
  static const jobServicesData = 'home/jobServicesSection/get-all';
  static const weAreHiringData = 'home/weareHiring/get-all';
  static const howItWorksData = 'home/howItWorksSection/get-all';
  static const championCandidatesData = 'home/deiCandidateSection/get-all';

  // about us

  static const whatWeDoData = 'about-us/what-we-do/get-all';
  static const aboutUs = 'about-us/about-hero/get-all';
  static const aboutVisionMission = 'about-us/mission-vision/get-all';

}
