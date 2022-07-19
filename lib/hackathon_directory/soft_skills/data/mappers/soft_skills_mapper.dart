import 'package:wallet_app/core/mappers/mapper.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/data/source/remote/models/soft_skill_response.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/domain/entity/soft_skill.dart';

class SoftSkillsMapper extends Mapper<SoftSkill, SoftSkillResponse> {
  @override
  SoftSkill mapFromBean(SoftSkillResponse src) {
    return SoftSkill(
      name: src.name ?? '',
    );
  }

  @override
  SoftSkillResponse mapToBean(SoftSkill src) {
    // TODO: implement mapToBean
    throw UnimplementedError();
  }
}
