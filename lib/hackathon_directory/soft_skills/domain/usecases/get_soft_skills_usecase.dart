import 'package:wallet_app/core/usecases/usecase.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/domain/entity/recruiter.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/domain/gateway/soft_skills_gateway.dart';

class GetSoftSkillsUseCase extends UseCase<void, List<Recruiter>> {
  final SoftSkillsGateway softSkillsGateway;

  const GetSoftSkillsUseCase({required this.softSkillsGateway});

  @override
  Future<List<Recruiter>> execute([void params]) {
    return softSkillsGateway.getRecruiters();
  }
}
