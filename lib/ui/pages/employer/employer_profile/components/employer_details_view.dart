import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/widgets/others/custom_decorated_box.dart';
import 'package:dei_champions/widgets/others/custom_theme_button.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../job/components/company_gallery_slider.dart';
import 'current_job_openings.dart';

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCompanyDetailsTab(context),
          _buildAboutCompanyTab(),
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
          SizedBox(key: currentJobsKey, height: 16),

          Text('Current Job Openings', style: context.textTheme.titleMedium),
          gapH16(),
          CurrentJobOpenings(),
        ],
      ),
    );
  }

  Widget _buildCompanyDetailsTab(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(key: companyDetailsKey, height: 16),
        Text('Company Details', style: context.textTheme.titleMedium),
        // Job Summary Cards
        gapH16(),
        _detailsCard1(context),
        gapH16(),
        _descriptionCard(context),
      ],
    );
  }

  Widget _buildCompanyGallery() {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(key: companyGalleryKey, height: 16),
        Text('Company Gallery', style: theme.titleMedium),
        gapH16(),
        CustomDecoratedBox(
          child: CompanyGallerySlider(
            items: [
              "https://res.cloudinary.com/dv4aury9e/image/upload/v1755079508/blogs/szose5lsflyu8jhadcks.png",
              "https://res.cloudinary.com/dv4aury9e/image/upload/v1755079773/blogs/shvioyrmukgh4gbqa824.png",
              "https://res.cloudinary.com/dv4aury9e/image/upload/v1755083343/blogs/jkp1efnarxmnnnusarve.png",
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAboutCompanyTab() {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(key: aboutCompanyKey, height: 16),
        Text('About company', style: theme.titleMedium),
        gapH16(),

        CustomDecoratedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Us',
                style: theme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              gapH8(),
              // About Text
              Text(
                'Vedhasekaran and Akalya Inc 123 is a dynamic organization headquartered in Dhanbad, Jharkhand. '
                'We specialize in providing innovative business solutions across multiple industries, '
                'helping clients optimize operations and achieve sustainable growth.',
                style: theme.bodyMedium?.copyWith(color: Colors.black54),
              ),
              gapH8(),

              // Read more button
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

              gapH16(),
              _buildInfoSection(
                'Company Name',
                'Vedhasekaran and Akalya Inc 123',
              ),

              gapH16(),

              // Our People Section
              Text(
                'Our People',
                style: theme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              gapH8(),
              _buildBulletPoint(
                'Ut odit delectus animi — our team thrives on collaboration and creativity.',
              ),
              _buildBulletPoint(
                'We foster an inclusive work environment that values every individual’s contribution.',
              ),
              _buildBulletPoint(
                'Continuous learning and mutual respect form the backbone of our culture.',
              ),

              gapH16(),

              // Recruitment Approach Section
              Text(
                'Recruitment Approach',
                style: theme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              gapH8(),
              _buildBulletPoint(
                'We focus on hiring individuals with both technical excellence and cultural alignment.',
              ),
              _buildBulletPoint(
                'Our recruitment process ensures transparency, fairness, and opportunity for all.',
              ),
              _buildBulletPoint(
                'We invest in long-term employee growth through mentorship and skill development.',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ', style: theme.bodyMedium?.copyWith(color: Colors.black54)),
          Expanded(
            child: Text(
              text,
              style: theme.bodyMedium?.copyWith(color: Colors.black54),
            ),
          ),
        ],
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
            'Company Overview',
            style: theme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),

          gapH16(),
          // Headquarters
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_city_outlined,
                size: 24,
                color: Colors.black54,
              ),
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
                    Text('51–200 employees', style: theme.bodyMedium),
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
              Icon(
                Icons.calendar_today_outlined,
                size: 24,
                color: Colors.black54,
              ),
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
                    Text('2000', style: theme.bodyMedium),
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
                    Icon(
                      Icons.language_outlined,
                      color: Colors.white,
                      size: 15,
                    ),
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
                    Icon(
                      Icons.message,
                      color: AppColors.primaryColor,
                      size: 15,
                    ),
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
          Text(
            'Our Mission',
            style: theme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          gapH4(),
          Text(
            'To empower businesses through technology-driven strategies and personalized consulting services.',
            style: theme.bodyMedium,
          ),

          SizedBox(height: 16),

          Text(
            'Our Vision',
            style: theme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          gapH4(),
          Text(
            'To be a trusted partner in innovation, enabling global organizations to reach their full potential.',
            style: theme.bodyMedium,
          ),

          SizedBox(height: 16),

          Text(
            'Core Values',
            style: theme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          gapH8(),
          _buildCompanyPoint('Integrity and transparency in all our actions.'),
          _buildCompanyPoint('Customer-centric approach.'),
          _buildCompanyPoint('Commitment to innovation and excellence.'),
          _buildCompanyPoint('Teamwork and continuous learning.'),

          SizedBox(height: 24),

          Text(
            'Company Type',
            style: theme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          gapH4(),
          Text('Private Limited Company', style: theme.bodyMedium),
        ],
      ),
    );
  }

  // Helper for bullet points
  Widget _buildCompanyPoint(String text) {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ', style: theme.bodyMedium),
          Expanded(child: Text(text, style: theme.bodyMedium)),
        ],
      ),
    );
  }
}
