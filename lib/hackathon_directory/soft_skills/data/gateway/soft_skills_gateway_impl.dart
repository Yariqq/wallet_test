import 'package:wallet_app/hackathon_directory/soft_skills/data/mappers/soft_skills_mapper.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/data/source/soft_skills_data_source.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/domain/entity/soft_skill.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/domain/gateway/soft_skills_gateway.dart';

class SoftSkillsGatewayImpl extends SoftSkillsGateway {
  final SoftSkillsDataSource softSkillsDataSource;
  final SoftSkillsMapper softSkillsMapper;

  const SoftSkillsGatewayImpl({
    required this.softSkillsDataSource,
    required this.softSkillsMapper,
  });

  @override
  Future<List<SoftSkill>> getSoftSkills() async {
    final response = await softSkillsDataSource.getSoftSkills();

    return response
        .map((responseItem) => softSkillsMapper.mapFromBean(responseItem))
        .toList();
  }
}
