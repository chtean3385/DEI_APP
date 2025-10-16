import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/ui/pages/job/components/similar_jobs.dart';
import 'package:dei_champions/widgets/others/custom_decorated_box.dart';
import 'package:dei_champions/widgets/others/custom_theme_button.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../models/job/job_model.dart';
import '../../../job/components/company_gallery_slider.dart';

class EmployerDetailsView extends StatelessWidget {
  final ScrollController scrollController;
  final GlobalKey companyDetailsKey;
  final GlobalKey aboutCompanyKey;
  final GlobalKey currentJobsKey;
  // final GlobalKey awardsKey;
  // final GlobalKey verifiedBenefitsKey;
  // final GlobalKey reviewsKey;
  // final GlobalKey benefitsKey;
  // final GlobalKey salaryInsightsKey;
  final GlobalKey companyGalleryKey;

  const EmployerDetailsView({
    super.key,
    required this.scrollController,
    required this.companyDetailsKey,
    required this.aboutCompanyKey,
    required this.currentJobsKey,
    // required this.awardsKey,
    // required this.verifiedBenefitsKey,
    // required this.reviewsKey,
    // required this.benefitsKey,
    // required this.salaryInsightsKey,
    required this.companyGalleryKey,
  });

  static final List<JobModel> jobs = [
    JobModel(
      title: "45days WFH Malayalam, Telugu",
      companyName: "Teleperformance (TP)",
      location: "Remote",
      experience: "0-1 yrs",
      salary: "50,000 - 1.5 Lacs PA",
      skills: ["Telugu", "Malayalam", "Voice Process", "Voice", "Process"],
      vacancies: "10 vacancies",
      postedTime: "5d ago",
      logoUrl: "https://img.icons8.com/color/96/000000/briefcase.png",
      hasAwards: true,
      hasReviews: false,
      hasBenefits: true,
      hasVerifiedBenefits: false,
      hasSalaryInsights: true,
      rating: 4.2,
    ),
    JobModel(
      title: "WFH - Data Entry",
      companyName: "Creative Hands HR",
      location: "Hybrid - Chennai, Coimbatore, Bengaluru",
      experience: "0-5 yrs",
      salary: "2 - 4.5 Lacs PA",
      skills: ["Typing", "Back office", "Computer Operating", "Data Entry"],
      vacancies: "Multiple",
      postedTime: "4d ago",
      logoUrl: "https://img.icons8.com/color/96/000000/shopping-cart.png",
      hasAwards: false,
      hasReviews: true,
      hasBenefits: false,
      hasVerifiedBenefits: false,
      hasSalaryInsights: true,
      rating: 3.8,
    ),
    JobModel(
      title: "Pharmacist",
      companyName: "Narayana Hrudayalaya Pvt Ltd",
      location: "Bengaluru",
      experience: "0-3 yrs",
      salary: "Not disclosed",
      skills: ["Pharmacist", "Healthcare", "Medicine"],
      vacancies: "Not specified",
      postedTime: "2d ago",
      logoUrl: "https://img.icons8.com/color/96/000000/hospital-room.png",
      hasAwards: true,
      hasReviews: true,
      hasBenefits: false,
      hasVerifiedBenefits: true,
      hasSalaryInsights: false,
      rating: 4.5,
    ),
    JobModel(
      title: "Flutter Developer",
      companyName: "Infosys",
      location: "Coimbatore",
      experience: "1-3 yrs",
      salary: "2 - 3 Lacs PA",
      skills: ["Flutter", "Dart", "Provider", "Firebase"],
      vacancies: "3 vacancies",
      postedTime: "28d ago",
      logoUrl: "https://img.icons8.com/color/96/000000/google-logo.png",
      hasAwards: false,
      hasReviews: true,
      hasBenefits: true,
      hasVerifiedBenefits: false,
      hasSalaryInsights: true,
      rating: 4.0,
    ),
    JobModel(
      title: "Java Backend Developer",
      companyName: "TCS",
      location: "Bengaluru",
      experience: "2-5 yrs",
      salary: "4 - 6 Lacs PA",
      skills: ["Java", "Spring Boot", "Microservices", "MySQL"],
      vacancies: "5 vacancies",
      postedTime: "10d ago",
      logoUrl: "https://img.icons8.com/color/96/000000/microsoft.png",
      hasAwards: true,
      hasReviews: false,
      hasBenefits: true,
      hasVerifiedBenefits: true,
      hasSalaryInsights: false,
      rating: 4.3,
    ),
    JobModel(
      title: "Software Engineer - Node.js",
      companyName: "Wipro",
      location: "Hyderabad",
      experience: "1-4 yrs",
      salary: "3 - 5 Lacs PA",
      skills: ["Node.js", "Express", "MongoDB", "REST API"],
      vacancies: "2 vacancies",
      postedTime: "7d ago",
      logoUrl: "https://img.icons8.com/color/96/000000/ibm.png",
      hasAwards: false,
      hasReviews: true,
      hasBenefits: true,
      hasVerifiedBenefits: false,
      hasSalaryInsights: true,
      rating: 3.9,
    ),
    JobModel(
      title: "React Native Developer",
      companyName: "HCL",
      location: "Chennai",
      experience: "0-2 yrs",
      salary: "2 - 4 Lacs PA",
      skills: ["React Native", "JavaScript", "Redux", "API Integration"],
      vacancies: "4 vacancies",
      postedTime: "3d ago",
      logoUrl: "https://img.icons8.com/color/96/000000/briefcase.png",
      hasAwards: true,
      hasReviews: true,
      hasBenefits: false,
      hasVerifiedBenefits: true,
      hasSalaryInsights: false,
      rating: 4.4,
    ),
    JobModel(
      title: "Customer Support Executive",
      companyName: "Concentrix",
      location: "Remote",
      experience: "0-1 yrs",
      salary: "1.2 - 2 Lacs PA",
      skills: ["English", "Customer Service", "Communication"],
      vacancies: "15 vacancies",
      postedTime: "1d ago",
      logoUrl: "https://img.icons8.com/color/96/000000/shopping-cart.png",
      hasAwards: false,
      hasReviews: true,
      hasBenefits: true,
      hasVerifiedBenefits: false,
      hasSalaryInsights: true,
      rating: 3.7,
    ),
    JobModel(
      title: "Data Analyst",
      companyName: "Cognizant",
      location: "Pune",
      experience: "1-3 yrs",
      salary: "3 - 4.5 Lacs PA",
      skills: ["SQL", "Excel", "Python", "PowerBI"],
      vacancies: "2 vacancies",
      postedTime: "6d ago",
      logoUrl: "https://img.icons8.com/color/96/000000/amazon.png",
      hasAwards: true,
      hasReviews: false,
      hasBenefits: true,
      hasVerifiedBenefits: true,
      hasSalaryInsights: true,
      rating: 4.1,
    ),
    JobModel(
      title: "Android Developer",
      companyName: "Tech Mahindra",
      location: "Mumbai",
      experience: "1-4 yrs",
      salary: "3 - 5 Lacs PA",
      skills: ["Java", "Kotlin", "Android Studio", "Firebase"],
      vacancies: "3 vacancies",
      postedTime: "8d ago",
      logoUrl: "https://img.icons8.com/color/96/000000/meta.png",
      hasAwards: false,
      hasReviews: true,
      hasBenefits: false,
      hasVerifiedBenefits: true,
      hasSalaryInsights: true,
      rating: 3.6,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCompnayDetailsTab(context),
          _buildAboutCompanyTab(),
          gapH16(),
          _buildCompanyGallery(),
         //  AwardsTimeline(key: awardsKey,),
         //  SizedBox(height: 18),
         //  VerifiedBenefits(key:verifiedBenefitsKey ,),
         //  SizedBox(height: 18),
         // ReviewsCarousel(key: reviewsKey,),
         // SizedBox(height: 18),
         //   BenefitsGrid(key: benefitsKey,),
         //  SizedBox(height: 18),
         // SalaryInsightsCard(key: salaryInsightsKey,),
         //  SizedBox(height: 18),
          // if (jobModel.hasAwards) AwardsTimeline(),
          // if (jobModel.hasAwards) SizedBox(height: 18),
          // if (jobModel.hasVerifiedBenefits) VerifiedBenefits(),
          // if (jobModel.hasVerifiedBenefits) SizedBox(height: 18),
          // if (jobModel.hasReviews) ReviewsCarousel(),
          // if (jobModel.hasReviews) SizedBox(height: 18),
          // if (jobModel.hasBenefits) BenefitsGrid(),
          // if (jobModel.hasBenefits) SizedBox(height: 18),
          // if (jobModel.hasSalaryInsights) SalaryInsightsCard(),
          // if (jobModel.hasSalaryInsights) SizedBox(height: 18),
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Send me jobs like this',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          gapH32(),

          Text(
            key: currentJobsKey,
            'Current Job Openings',
            style: context.textTheme.titleMedium,
          ),
          gapH16(),
          SimilarJobsListView(jobs: jobs),
        ],
      ),
    );
  }

  Widget _buildCompnayDetailsTab(BuildContext context) {
    return Column(
      key: companyDetailsKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Job Summary Cards
        gapH16(),
        _detailsCard1(context),
        gapH16(),
        _descriptionCard(context),
        gapH16(),
        _industryCard(),
        gapH16(),
        // Warning Message
        _warning(),
      ],
    );
  }

  Widget _buildAboutCompanyTab() {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;
    return Column(
      key: aboutCompanyKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About company', style: theme.titleMedium),
        gapH16(),
        CustomDecoratedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NVS is a 65 crore 18-year-old people transportation firm that caters to over 30+ schools and corporations that include thousands o... ',
                style: theme.bodyMedium?.copyWith(color: Colors.black54),
              ),
              gapH8(),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                ),
                child: Text(
                  'read more',
                  style: theme.bodyMedium?.copyWith(color: Colors.blue),
                ),
              ),
              gapH8(),
              _buildInfoSection('Company Name', 'NVS Travels'),
            ],
          ),
        ),

      ],
    );
  }
  Widget _buildCompanyGallery() {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;
    return Column(
      key: companyGalleryKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Company Gallery', style: theme.titleMedium),
        gapH16(),
        CustomDecoratedBox(
          child: CompanyGallerySlider(items: ["https://res.cloudinary.com/dv4aury9e/image/upload/v1755079508/blogs/szose5lsflyu8jhadcks.png","https://res.cloudinary.com/dv4aury9e/image/upload/v1755079773/blogs/shvioyrmukgh4gbqa824.png","https://res.cloudinary.com/dv4aury9e/image/upload/v1755083343/blogs/jkp1efnarxmnnnusarve.png",],)
        ),

      ],
    );
  }


  Widget _buildJobPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: navigatorKey.currentContext!.textTheme.bodyMedium,
      ),
    );
  }

  Widget _buildInfoSection(String label, String value) {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: theme.bodyMedium?.copyWith(color: Colors.black54)),
          SizedBox(height: 4),
          Text(value, style: theme.bodyMedium),
        ],
      ),
    );
  }

  Widget _detailsCard1(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return CustomDecoratedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Company Details',
            style: theme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),

          gapH16(),
          // Headquarters
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.location_city_outlined, size: 24, color: Colors.black54),
              gapW16(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Headquarters',
                      style: theme.bodyMedium?.copyWith(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    gapH4(),
                    Text(
                      'Dhanbad, Jharkhand\n611 North Fabien Lane',
                      style: theme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),

          gapH16(),

          // Website
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.language_outlined, size: 24, color: Colors.black54),
              gapW16(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Website',
                      style: theme.bodyMedium?.copyWith(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    gapH4(),
                    GestureDetector(
                      onTap: () {
                        // Optionally open the URL
                        // launchUrl(Uri.parse('https://www.rozecifexacavu.ws'));
                      },
                      child: Text(
                        'https://www.rozecifexacavu.ws',
                        style: theme.bodyMedium?.copyWith(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          gapH16(),

          // Company Size
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.people_outline, size: 24, color: Colors.black54),
              gapW16(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Company Size',
                      style: theme.bodyMedium?.copyWith(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    gapH4(),
                    Text(
                      '51–200 employees',
                      style: theme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),

          gapH16(),

          // Member Since
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.calendar_today_outlined,
                  size: 24, color: Colors.black54),
              gapW16(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Member Since',
                      style: theme.bodyMedium?.copyWith(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    gapH4(),
                    Text(
                      '2000',
                      style: theme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
          gapH16(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomThemeButton(
                radius: 8,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                color: AppColors.primaryColor,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Icon(Icons.language_outlined,color: Colors.white,size: 15,),
                    gapW8(),
                    Text(
                      "Visit Our Website",
                      style: context.textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),

                  ],
                ),
              ),
              gapW16(),
              CustomThemeButton(
                radius: 8,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                color: Colors.white,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Icon(Icons.message,color: AppColors.primaryColor,size: 15,),
                    gapW8(),
                    Text(
                      "Contact Us",
                      style: context.textTheme.displaySmall?.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 11,
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _descriptionCard(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return CustomDecoratedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Job Description
          Text(
            'Job description',
            style: theme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),

          gapH16(),

          Text(
            'What you\'ll do',
            style: theme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          gapH4(),
          Text('The role involves:', style: theme.bodyMedium),
          SizedBox(height: 12),
          _buildJobPoint('Generating leads & managing them on Zoho CRM'),
          _buildJobPoint(
            'Enriching them by browsing the internet/ calling & field visit (Field visit is mandatory for twice a week)',
          ),
          _buildJobPoint('Coordinating with the sales team'),
          _buildJobPoint('Making reports for weekly meetings'),

          SizedBox(height: 24),

          // Additional Info
          Text('Health insurance', style: theme.bodyMedium),
        ],
      ),
    );
  }

  Widget _industryCard() {
    return CustomDecoratedBox(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildInfoSection('Industry type', 'Travel & Tourism'),
            _buildInfoSection('Department', 'Sales & Business Development'),
            _buildInfoSection('Role', 'Business Development Executive (BDE)'),
            _buildInfoSection('Employment type', 'Full Time, Permanent'),
            _buildInfoSection('Education', 'Graduation Not Required'),
          ],
        ),
      ),
    );
  }

  Widget _warning() {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;

    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Naukri does not promise a job or an interview in exchange of money. Fraudsters may ask you to pay in the pretext of registration fee, refundable fee etc.',
            style: theme.displaySmall?.copyWith(color: Colors.black54),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Learn more',
                  style: theme.displaySmall?.copyWith(color: Colors.blue),
                ),
              ),
              Text(
                ' or ',
                style: theme.displaySmall?.copyWith(color: Colors.black54),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Report this job',
                  style: theme.displaySmall?.copyWith(color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}





