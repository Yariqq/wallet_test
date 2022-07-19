
import 'package:wallet_app/core/usecases/usecase.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/domain/entity/soft_skill.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/domain/gateway/soft_skills_gateway.dart';

class GetSoftSkillsUseCase extends UseCase<void, List<SoftSkill>> {
  final SoftSkillsGateway softSkillsGateway;

  const GetSoftSkillsUseCase({required this.softSkillsGateway});

  @override
  Future<List<SoftSkill>> execute(void params) {
    return softSkillsGateway.getSoftSkills();
  }
}