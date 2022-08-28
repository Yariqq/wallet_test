import '../../../domain/entity/recruiter.dart';
import '../../../domain/entity/candidate.dart';

class SoftSkillsBlocModel {
  final int index;
  final List<Recruiter> recruiters;
  final Candidate user;

  const SoftSkillsBlocModel({
    required this.index,
    required this.recruiters,
    required this.user,
  });

  SoftSkillsBlocModel copyWith({
    int? index,
    List<Recruiter>? recruiters,
    Candidate? user,
  }) {
    return SoftSkillsBlocModel(
      index: index ?? this.index,
      recruiters: recruiters ?? this.recruiters,
      user: user ?? this.user,
    );
  }

  SoftSkillsBlocModel.empty()
      : index = 0,
        recruiters = [],
        user = Candidate.empty();
}
