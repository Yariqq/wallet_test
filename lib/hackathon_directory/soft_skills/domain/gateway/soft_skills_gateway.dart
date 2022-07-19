import 'package:wallet_app/hackathon_directory/soft_skills/domain/entity/soft_skill.dart';

abstract class SoftSkillsGateway {
  const SoftSkillsGateway();

  Future<List<SoftSkill>> getSoftSkills();
}
