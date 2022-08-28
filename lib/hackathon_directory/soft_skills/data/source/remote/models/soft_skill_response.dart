import 'package:json_annotation/json_annotation.dart';

part 'soft_skill_response.g.dart';

@JsonSerializable()
class SoftSkillResponse {
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  @JsonKey(name: 'experience')
  final int? experience;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'rating')
  final double? rating;
  @JsonKey(name: 'position')
  final String? position;
  @JsonKey(name: 'interviews_count')
  final int? interviewCount;
  @JsonKey(name: 'busy_days')
  final List<String>? blackoutDates;
  @JsonKey(name: 'rate')
  final double? rate;

  const SoftSkillResponse({
    required this.firstName,
    required this.lastName,
    required this.experience,
    required this.description,
    required this.rating,
    required this.position,
    required this.interviewCount,
    required this.blackoutDates,
    required this.rate,
  });

  factory SoftSkillResponse.fromJson(Map<String, dynamic> json) =>
      _$SoftSkillResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SoftSkillResponseToJson(this);
}
