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
  });
}
