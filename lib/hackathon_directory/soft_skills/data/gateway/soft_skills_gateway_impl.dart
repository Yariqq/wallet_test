import 'package:wallet_app/hackathon_directory/soft_skills/data/mappers/soft_skills_mapper.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/data/mappers/candidate_mapper.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/data/source/remote/api/soft_skills_api.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/domain/entity/recruiter.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/domain/gateway/soft_skills_gateway.dart';

import '../../domain/entity/candidate.dart';

class SoftSkillsGatewayImpl extends SoftSkillsGateway {
  final SoftSkillsApi softSkillsApi;
  final SoftSkillsMapper softSkillsMapper;
  final CandidateMapper userMapper;

  const SoftSkillsGatewayImpl({
    required this.softSkillsApi,
    required this.softSkillsMapper,
    required this.userMapper,
  });

  @override
  Future<List<Recruiter>> getRecruiters() async {
    final response = await softSkillsApi.getRecruiters();

    return response.map((e) => softSkillsMapper.mapFromBean(e)).toList();
  }

  @override
  Future<Candidate> getUser() async {
    final response = await softSkillsApi.getUser();

    return userMapper.mapFromBean(response);
  }
}
