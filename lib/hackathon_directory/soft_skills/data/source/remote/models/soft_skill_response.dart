
import 'package:json_annotation/json_annotation.dart';

part 'soft_skill_response.g.dart';

@JsonSerializable()
class SoftSkillResponse {
  @JsonKey(name: 'name')
  final String? name;

  const SoftSkillResponse({required this.name});

  factory SoftSkillResponse.fromJson(Map<String, dynamic> json) =>
      _$SoftSkillResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SoftSkillResponseToJson(this);
}