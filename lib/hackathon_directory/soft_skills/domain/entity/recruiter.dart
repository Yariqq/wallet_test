class Recruiter {
  final String firstName;
  final String lastName;
  final int experience;
  final String description;
  final double rating;
  final String position;
  final int interviewCount;
  final List<DateTime> blackoutDates;
  final double rate;

  const Recruiter({
    required this.firstName,
    required this.lastName,
    required this.experience,
    required this.description,
    required this.rating,
    required this.position,
    required this.interviewCount,
    required this.blackoutDates,
    required this.rate,
  });
}
