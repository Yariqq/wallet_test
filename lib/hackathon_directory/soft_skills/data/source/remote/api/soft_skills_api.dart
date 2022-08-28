import 'package:dio_http/dio_http.dart';
import 'package:retrofit/http.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/data/source/remote/models/soft_skill_response.dart';

import '../models/candidate_response.dart';

part 'soft_skills_api.g.dart';

@RestApi(baseUrl: 'http://172.104.131.215:8000/')
abstract class SoftSkillsApi {
  factory SoftSkillsApi(Dio dio, {String baseUrl}) = _SoftSkillsApi;

  @GET('api/v1/recruiter')
  Future<List<SoftSkillResponse>> getRecruiters();

  @GET('api/v1/user/1')
  Future<CandidateResponse> getUser();
}
