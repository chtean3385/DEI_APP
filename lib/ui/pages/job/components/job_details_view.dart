import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/ui/pages/job/components/similar_jobs.dart';
import 'package:dei_champions/widgets/others/custom_decorated_box.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../models/job/job_model.dart';
import '../../../../widgets/others/custom_theme_button.dart';

class JobDetailsView extends StatelessWidget {
  final ScrollController scrollController;
  final GlobalKey jobDetailsKey;
  final GlobalKey aboutCompanyKey;
  final JobModel jobModel;

  const JobDetailsView({
    super.key,
    required this.scrollController,
    required this.jobDetailsKey,
    required this.aboutCompanyKey,
    required this.jobModel,
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
      logoUrl:
          "https://img.icons8.com/color/96/000000/briefcase.png", // Brillio placeholder
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
      logoUrl:
          "https://img.icons8.com/color/96/000000/shopping-cart.png", // Bigbasket placeholder
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
      logoUrl:
          "https://img.icons8.com/color/96/000000/hospital-room.png", // Pristyn Care placeholder
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
      logoUrl:
          "https://img.icons8.com/color/96/000000/google-logo.png", // Tech Mahindra placeholder
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
      logoUrl:
          "https://img.icons8.com/color/96/000000/ibm.png", // Tech Mahindra placeholder
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
      logoUrl:
          "https://img.icons8.com/color/96/000000/briefcase.png", // Brillio placeholder
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
      logoUrl:
          "https://img.icons8.com/color/96/000000/shopping-cart.png", // Bigbasket placeholder
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
      logoUrl:
          "https://img.icons8.com/color/96/000000/amazon.png", // Tech Mahindra placeholder
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
      logoUrl:
          "https://img.icons8.com/color/96/000000/meta.png", // Tech Mahindra logo
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
          _buildJobDetailsTab(context),
          _buildAboutCompanyTab(),
          Text('Similar jobs', style: context.textTheme.titleMedium),
          gapH16(),
          SimilarJobsListView(jobs: jobs),
        ],
      ),
    );
  }

  Widget _buildJobDetailsTab(BuildContext context) {
    return Column(
      key: jobDetailsKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Job Summary Cards
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
        gapH16(),
        _applyNow(),
        gapH32(),
      ],
    );
  }

  Widget _applyNow() {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;
    return CustomThemeButton(
      child: Text(
        "Apply now",
        style: theme.labelMedium?.copyWith(color: Colors.white),
      ),
      radius: 30,
      onTap: () {},
      isExpanded: true,
      color: AppColors.primaryColor,
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
          // Job Summary Cards
          gapH8(),
          Row(
            children: [
              Icon(
                Icons.work_history_outlined,
                size: 24,
                color: Colors.black54,
              ),
              gapW16(),
              Text(
                jobModel.experience,
                style: theme.bodyMedium?.copyWith(color: Colors.black54),
              ),
            ],
          ),
          gapH8(),
          Row(
            children: [
              Icon(Icons.people_outline, size: 24, color: Colors.black54),
              gapW16(),
              Text(
                jobModel.vacancies,
                style: theme.bodyMedium?.copyWith(color: Colors.black54),
              ),
            ],
          ),
          gapH8(),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.location_on_outlined, size: 24, color: Colors.black54),
              gapW16(),
              Text(
                jobModel.location,
                style: theme.bodyMedium?.copyWith(color: Colors.black54),
              ),
            ],
          ),

          gapH8(),
          Row(
            children: [
              Icon(
                Icons.account_balance_wallet_outlined,
                size: 24,
                color: Colors.black54,
              ),
              gapW16(),
              Text(
                jobModel.salary,
                style: theme.bodyMedium?.copyWith(color: Colors.black54),
              ),
            ],
          ),
          gapH8(),
          gapH8(),
          // Skills Section
          Text(
            'Must have skills',
            style: theme.bodyMedium?.copyWith(color: Colors.black54),
          ),
          gapH8(),
          Text('Communication Skills', style: theme.bodyMedium),

          SizedBox(height: 16),

          Text(
            'Good to have skills',
            style: theme.bodyMedium?.copyWith(color: Colors.black54),
          ),
          SizedBox(height: 8),
          Text('English, Lead Generation, B2B Sales', style: theme.bodyMedium),
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
