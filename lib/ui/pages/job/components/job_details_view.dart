import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/models/job/job_model_api.dart';
import 'package:dei_champions/ui/pages/job/components/similar_jobs.dart';
import 'package:dei_champions/widgets/others/custom_decorated_box.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../constants/app_colors.dart';
import '../../../../models/job/job_model.dart';
import '../../../../widgets/others/custom_theme_button.dart';
import '../../../../widgets/others/rounded_network_image.dart';
import '../../search/components/search_job_card.dart';
import 'company_gallery_slider.dart';
import 'company_info_card.dart';

class JobDetailsView extends StatelessWidget {
  final ScrollController scrollController;
  final GlobalKey jobDetailsKey;
  final GlobalKey aboutCompanyKey;
  final GlobalKey similarJobsKey;
  final GlobalKey awardsKey;
  final GlobalKey verifiedBenefitsKey;
  final GlobalKey reviewsKey;
  final GlobalKey benefitsKey;
  final GlobalKey salaryInsightsKey;
  final GlobalKey companyGalleryKey;
  final JobModelApi jobModel;

  const JobDetailsView({
    super.key,
    required this.scrollController,
    required this.jobDetailsKey,
    required this.aboutCompanyKey,
    required this.similarJobsKey,
    required this.awardsKey,
    required this.verifiedBenefitsKey,
    required this.reviewsKey,
    required this.benefitsKey,
    required this.salaryInsightsKey,
    required this.companyGalleryKey,
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
          _buildJobDetailsTab(context),
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
          gapH16(),
          _applyNow(),
          gapH32(),

          Text(
            key: similarJobsKey,
            'Similar jobs',
            style: context.textTheme.titleMedium,
          ),
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
        _tagsCard(context),
        gapH16(),
        _jobInfoCard(),
        gapH16(),
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
          child: CompanyInfoCard(
            companyName: jobModel.employer?.company ?? "",
            companyLogo: jobModel.employer?.companyLogo ?? "",
            location: jobModel.employer?.city ?? "",
            joinedText: jobModel.employer?.memberSince,
            openJobsText: '02 Open Jobs',
            address: jobModel.employer?.address ?? "",
            phone: jobModel.employer?.phone ?? "",
            email: jobModel.employer?.email ?? "",
            website: jobModel.employer?.companyWebsite ?? "",
          ),
        ),
        gapH16(),
        _certificatesCard(),
        gapH16(),
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
        (jobModel.employer?.certifiedTags == null ||
                jobModel.employer?.certifiedTags?.isEmpty == true)
            ? SizedBox.shrink()
            : // no tags, no widget
              CustomDecoratedBox(
                child: CompanyGallerySlider(
                  items:
                      jobModel.employer?.companyGallery
                          ?.map((e) => e.imageUrl ?? '')
                          .where((url) => url.isNotEmpty)
                          .toList() ??
                      [],
                ),
              ),
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
          gapH8(),
          Row(
            children: [
              Icon(Icons.apartment_outlined, size: 24, color: Colors.black54),
              gapW16(),
              Text(
                jobModel.category ?? "",
                style: theme.bodyMedium?.copyWith(color: Colors.black54),
              ),
            ],
          ),
          gapH8(),
          Row(
            children: [
              Icon(Icons.badge_outlined, size: 24, color: Colors.black54),
              // userTie
              gapW16(),
              Text(
                "Experienced (Non - Manager)",
                style: theme.bodyMedium?.copyWith(color: Colors.black54),
              ),
            ],
          ),
          gapH8(),
          Row(
            children: [
              Icon(Icons.currency_rupee, size: 24, color: Colors.black54),
              // rupeeSign
              gapW16(),
              Text(
                jobModel.salary ?? "",
                style: theme.bodyMedium?.copyWith(color: Colors.black54),
              ),
            ],
          ),
          gapH8(),
          Row(
            children: [
              Icon(
                Icons.business_center_outlined,
                size: 24,
                color: Colors.black54,
              ), // briefcase
              gapW16(),
              Text(
                "1 - 2 years",
                style: theme.bodyMedium?.copyWith(color: Colors.black54),
              ),
            ],
          ),
          gapH8(),
          Row(
            children: [
              Icon(Icons.work_outline, size: 24, color: Colors.black54),
              // mugSaucer
              gapW16(),
              Text(
                jobModel.jobType ?? "",
                style: theme.bodyMedium?.copyWith(color: Colors.black54),
              ),
            ],
          ),
          gapH8(),
          Row(
            children: [
              Icon(Icons.access_time, size: 24, color: Colors.black54), // clock
              gapW16(),
              Text(
                "Open until filled",
                style: theme.bodyMedium?.copyWith(color: Colors.black54),
              ),
            ],
          ),
          gapH8(),
          Row(
            children: [
              Icon(Icons.update, size: 24, color: Colors.black54), // rotate
              gapW16(),
              Text(
                '${getTimeAgo(jobModel.updatedAt ?? DateTime.now())}',
                style: theme.bodyMedium?.copyWith(color: Colors.black54),
              ),
            ],
          ),
          gapH8(),
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 24, color: Colors.black54),
              // locationDot
              gapW16(),
              Text(
                "${jobModel.city ?? ""}, ${jobModel.state ?? ""}, ${jobModel.country ?? ""}",
                style: theme.bodyMedium?.copyWith(color: Colors.black54),
              ),
            ],
          ),
          gapH8(),
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
          JobDescriptionView(jobDescription: jobModel.description ?? ""),
        ],
      ),
    );
  }

  Widget _tagsCard(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    if (jobModel.skills == null || jobModel.skills?.isEmpty == true) {
      return const SizedBox.shrink(); // no tags, no widget
    }
    return CustomDecoratedBox(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Job Description
            Text(
              'Tags',
              style: theme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),

            gapH16(),
            TagList(tags: jobModel.skills),
          ],
        ),
      ),
    );
  }

  Widget _jobInfoCard() {
    return CustomDecoratedBox(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildInfoSection(
              'Posted',
              formatPostedDate(jobModel.createdAt ?? DateTime.now()),
            ),
            _buildInfoSection(
              'Last Updated',
              '${getTimeAgo(jobModel.updatedAt ?? DateTime.now())}',
            ),
            _buildInfoSection('Status', jobModel.status ?? ""),
          ],
        ),
      ),
    );
  }

  Widget _certificatesCard() {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;

    if (jobModel.employer?.certifiedTags == null ||
        jobModel.employer?.certifiedTags?.isEmpty == true) {
      return const SizedBox.shrink(); // no tags, no widget
    }

    return CustomDecoratedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Certifications",
            style: theme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          gapH8(),
          Column(
            children: jobModel.employer!.certifiedTags!.map((tag) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    RoundedNetworkImage(
                      imageUrl: tag.image ?? "",
                      width: 28,
                      height: 28,
                      borderRadius: 6,
                    ),
                    gapW16(),
                    Expanded(
                      child: Text(
                        tag.name ?? "",
                        style: theme.bodyMedium?.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class JobDescriptionView extends StatelessWidget {
  final String jobDescription;

  const JobDescriptionView({super.key, required this.jobDescription});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Html(
        data: jobDescription,
        style: {
          "body": Style(
            fontSize: FontSize(14),
            color: Colors.black87,
            lineHeight: LineHeight(1.5),
          ),
          "p": Style(margin: Margins.only(bottom: 8)),
          "ul": Style(
            margin: Margins.only(left: 0, right: 0, top: 0, bottom: 0),
          ),
          "strong": Style(fontWeight: FontWeight.bold),
        },
        onLinkTap: (url, _, __) {
          // Optional: handle links like mailto
          if (url != null && url.startsWith("mailto:")) {
            // Launch email app
          }
        },
      ),
    );
  }
}

/// A reusable widget to display a list of tags or skills in a wrapped layout.
class TagList extends StatelessWidget {
  final List<String>? tags;
  final Color? backgroundColor;
  final Color? textColor;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  const TagList({
    super.key,
    required this.tags,
    this.backgroundColor,
    this.textColor,
    this.fontSize = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    this.borderRadius = 4,
  });

  @override
  Widget build(BuildContext context) {
    if (tags == null || tags!.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: tags!
          .map(
            (tag) => _TagChip(
              tag: tag,
              backgroundColor: backgroundColor ?? AppColors.bg,
              textColor: textColor ?? Colors.black,
              fontSize: fontSize,
              padding: padding,
              borderRadius: borderRadius,
            ),
          )
          .toList(),
    );
  }
}

/// Internal single tag chip widget
class _TagChip extends StatelessWidget {
  final String tag;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  const _TagChip({
    required this.tag,
    required this.backgroundColor,
    required this.textColor,
    required this.fontSize,
    required this.padding,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        tag,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        textAlign: TextAlign.center,
        style: context.textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: fontSize,
          color: textColor,
        ),
      ),
    );
  }
}
