import 'package:json_annotation/json_annotation.dart';

part 'candidate_response.g.dart';

@JsonSerializable()
class CandidateResponse {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'position')
  final String? position;

  const CandidateResponse({
    required this.name,
    required this.position,
  });

  factory CandidateResponse.fromJson(Map<String, dynamic> json) =>
      _$CandidateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CandidateResponseToJson(this);
}
