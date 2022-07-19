
import 'package:wallet_app/hackathon_directory/soft_skills/data/source/remote/models/soft_skill_response.dart';

abstract class SoftSkillsDataSource {
  Future<List<SoftSkillResponse>> getSoftSkills();
}