import 'package:wallet_app/core/usecases/usecase.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/domain/gateway/soft_skills_gateway.dart';

import '../entity/candidate.dart';

class GetUserUseCase extends UseCase<void, Candidate> {
  final SoftSkillsGateway softSkillsGateway;

  const GetUserUseCase({required this.softSkillsGateway});

  @override
  Future<Candidate> execute([void params]) {
    return softSkillsGateway.getUser();
  }
}
