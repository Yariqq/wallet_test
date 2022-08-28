import 'package:wallet_app/hackathon_directory/soft_skills/domain/entity/recruiter.dart';

import '../entity/candidate.dart';

abstract class SoftSkillsGateway {
  const SoftSkillsGateway();

  Future<List<Recruiter>> getRecruiters();

  Future<Candidate> getUser();
}
