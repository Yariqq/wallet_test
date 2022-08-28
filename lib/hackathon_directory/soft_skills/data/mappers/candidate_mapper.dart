import 'package:wallet_app/core/mappers/mapper.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/data/source/remote/models/candidate_response.dart';

import '../../domain/entity/candidate.dart';

class CandidateMapper extends Mapper<Candidate, CandidateResponse> {
  @override
  Candidate mapFromBean(CandidateResponse src) {
    return Candidate(
      name: src.name ?? '',
      position: src.position ?? '',
    );
  }

  @override
  CandidateResponse mapToBean(Candidate src) {
    // TODO: implement mapToBean
    throw UnimplementedError();
  }
}
