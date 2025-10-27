class CandidateModel {
  final String title;
  final String companyName;
  final String logoUrl;
  final String location;
  final String jobType;
  final String postedTime;
  final double hourlyRate;
  final List<String> skills;

  CandidateModel({
    required this.title,
    required this.companyName,
    required this.logoUrl,
    required this.location,
    required this.jobType,
    required this.postedTime,
    required this.hourlyRate,
    required this.skills,
  });
}
