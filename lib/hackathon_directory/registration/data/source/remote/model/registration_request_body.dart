import 'package:json_annotation/json_annotation.dart';

part 'registration_request_body.g.dart';

@JsonSerializable()
class RegistrationRequestBody {
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'password')
  final String? password;
  @JsonKey(name: 'is_recruiter')
  final bool? isHr;

  const RegistrationRequestBody({
    required this.email,
    required this.password,
    required this.isHr,
  });

  factory RegistrationRequestBody.fromJson(Map<String, dynamic> json) =>
      _$RegistrationRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationRequestBodyToJson(this);
}
