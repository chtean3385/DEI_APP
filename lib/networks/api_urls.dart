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


 // search job
  static const searchJob = 'job/filtered-searched-jobs';
  // saved jobs
  static const savedJobs = 'job/my-saved';


  //  job
  static String applyJob(String id) => 'job/apply/$id';
  static String unApplyJob(String id) => 'job/unapply/$id';
  static String saveJob(String id) => 'job/save/$id';
  static String unSaveJob(String id) => 'job/unsave/$id';
  static String jobDetails(String id) => 'job/get-one-public/$id';






}
