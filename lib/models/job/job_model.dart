class JobModel {
  final String title;
  final String companyName;
  final String location;
  final String experience;
  final String salary;
  final List<String> skills;
  final String vacancies;
  final String postedTime;
  final String logoUrl;
  final double? rating;
  final bool hasReviews;
  final bool hasBenefits;
  final bool hasVerifiedBenefits;
  final bool hasSalaryInsights;
  final bool hasAwards;
  final String? reviews;
  final String? postedDate;
  final bool? isWalkIn;

  JobModel({
    required this.title,
    required this.companyName,
    required this.location,
    required this.experience,
    required this.salary,
    required this.skills,
    required this.vacancies,
    required this.postedTime,
    required this.logoUrl,
    required this.hasAwards,
    required this.hasReviews,
    required this.hasBenefits,
    required this.hasVerifiedBenefits,
    required this.hasSalaryInsights,
     this.rating,
     this.reviews,
     this.postedDate,
     this.isWalkIn,
  });
}
