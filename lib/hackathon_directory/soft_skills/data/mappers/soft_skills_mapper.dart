import 'package:wallet_app/core/mappers/mapper.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/data/source/remote/models/soft_skill_response.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/domain/entity/recruiter.dart';

class SoftSkillsMapper extends Mapper<Recruiter, SoftSkillResponse> {
  @override
  Recruiter mapFromBean(SoftSkillResponse src) {
    return Recruiter(
      firstName: src.firstName ?? '',
      lastName: src.lastName ?? '',
      experience: src.experience ?? 0,
      description: src.description ?? '',
      rating: src.rating ?? 0.0,
      position: src.position ?? '',
      interviewCount: src.interviewCount ?? 0,
      blackoutDates:
          src.blackoutDates?.map((e) => DateTime.parse(e)).toList() ?? [],
      rate: src.rate ?? 0.0,
    );
  }

  @override
  SoftSkillResponse mapToBean(Recruiter src) {
    // TODO: implement mapToBean
    throw UnimplementedError();
  }
}
