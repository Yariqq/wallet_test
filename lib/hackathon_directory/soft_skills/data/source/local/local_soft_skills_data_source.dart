import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/data/source/remote/models/soft_skill_response.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/data/source/soft_skills_data_source.dart';

class LocalSoftSkillsDataSource extends SoftSkillsDataSource {
  @override
  Future<List<SoftSkillResponse>> getSoftSkills() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final data =
        await rootBundle.loadString('assets/requests/soft_skills_body.json');
    var json = jsonDecode(data);
    return (json as List)
        .map((skill) => SoftSkillResponse.fromJson(skill))
        .toList();
  }
}
