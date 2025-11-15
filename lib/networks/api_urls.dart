class ApiUrls {
  static const baseUrl = 'https://dei-backend.onrender.com/api/';


  //on board
  static const onBoarding = 'onboarding-screen/get-all';

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
  static const friendlyIndustries = 'home/recruiterSection/get-all';

  // about us

  static const whatWeDoData = 'about-us/what-we-do/get-all';
  static const aboutUs = 'about-us/about-hero/get-all';
  static const aboutVisionMission = 'about-us/mission-vision/get-all';
  static const aboutCoreValues = 'about-us/core-value-section/get-all';
  static const revolutionData = 'about-us/dei-revolution/get-all';

  // empower women

  static const empowerWomenImpact = 'empower-women/impact/get-all';
  static const empowerWomenHero = 'empower-women/emp-women-hero/get-all';
  static const empowerWomenWorkForce = 'empower-women/emp-women-Workforce/get-all';

  // men alias
  static const allyShipMan = 'men-as-allies/ally-ship-man-as-allies/get-all';
  static const heroManAsAlies = 'men-as-allies/hero-man-as-allies/get-all';
  static const championDiversityMan = 'men-as-allies/champion-diversity-man-as-allies/get-all';
  static const organizationalBenefits = 'men-as-allies/organizational-benefits-man-as-allies/get-all';
  static const whyAllShipMan = 'men-as-allies/why-allShip-man-as-allies/get-all';

 // Not defined by Disability
  static const disabilityTitleDetails = 'not-defined-by-disability/hero-ndpd/get-all';
  static const disabilityInclusionSteps = 'not-defined-by-disability/inclusion-ndpd/get-all';
  static const disabilityBottomDetails = 'not-defined-by-disability/parallax-ndpd/get-all';

  // Gen Z
  static const genZTitleDetails = 'gen-z-debutant/gen-z-debutant-hero/get-all';
  static const  genZGrowthPoints = 'gen-z-debutant/gen-z-debutant-growth/get-all';
  static const genZAdvantages = 'gen-z-debutant/gen-z-debutant-parallax/get-all';
  static const genZBottomButtons = 'gen-z-debutant/gen-z-debutant-closing/get-all';

  // Defense Veteran
  static const veteranAdvantages = 'defense-veteran/vetx-assets/get-all';
  static const veteranQuotes = 'defense-veteran/vetx-quote/get-all';
  static const  veteranOrganizationalBenefits = 'defense-veteran/vetx-organizational/get-all';
  static const veteranTitleDetails = 'defense-veteran/vetx-hero/get-all';
  static const veteranRoles = 'defense-veteran/vetx-roles/get-all';

  // LGBTQ
  static const lgbtqAdvantages = 'shine-with-pride/why-it-matters/get-all';
  static const lgbtqQuotes = 'shine-with-pride/people-pride/get-all';
  static const  lgbtqInclusionPoints = 'shine-with-pride/inclusion-wrap/get-all';
  static const lgbtqTitleDetails = 'shine-with-pride/hero/get-all';
  static const lgbtqQuotes2 = 'shine-with-pride/colsing-pride/get-all';

  // CSR
  static const csrBannerDetails = 'csr/banner/get-all';
  static const  csrObjectives = 'csr/objective/get-all';
  static const csrFocusPoints = 'csr/focus-area/get-all';




  // search job
  static const searchJob = 'job/filtered-searched-jobs';
  // saved jobs
  static const savedJobs = 'job/my-saved';
  // my jobs
  static const appliedJobs = 'job/my-applications';
  // similar jobs
  static String similarJobs(String id) => 'job/similar/$id';
  // recommended jobs
  static const recommendedJobs = 'job/recommended-jobs';



  //  job
  static String applyJob(String id) => 'job/apply/$id';
  static String unApplyJob(String id) => 'job/unapply/$id';
  static String saveJob(String id) => 'job/save/$id';
  static String unSaveJob(String id) => 'job/unsave/$id';
  static String jobDetails(String id) => 'job/get-one-public/$id';
  static const jobTypes = 'jobType/get-all';
  static const salaryTypes = 'salary/get-all';
  static const countryList = 'job/get-country-json';

 //   employee profile
  static String employeeProfileDetails = 'users/get-one-user';
  static String updateEmployeeProfileDetails = 'users/update-profile-with-resume';
  static String employeeProfilePercentage = 'users/profile/percentage';


// common
  static String commonFooterPageData = 'footer-page/get-all';
  static String getHtmlPageData(String pageName) => 'footer-page/get-by-name/$pageName';
  static String employeeOurTeam = 'our-team/get-all';
  static String faq = 'faq/get-all';
  static String blog = 'blog/get-all';
  static String getBlogDetails(String id) => 'blog/get-one/$id';
  static String exploreOurServices = 'career-explorer/career-explorer-service/get-all';


  // DashBoard
  static String employeeDashBoardData = 'job/employee-dashboard-counts';

  ///EMPLOYER APIs///

  // DashBoard
  static String employerDashBoardData = 'job/employer-dashboard-counts';
  // manage jobs
  static String employerManageJobs = 'job/get-all';

  //verify email

  static String resendEmailVerification = 'users/resend-email';





}
