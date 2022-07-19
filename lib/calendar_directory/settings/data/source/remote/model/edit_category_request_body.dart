
import 'package:json_annotation/json_annotation.dart';

part 'edit_category_request_body.g.dart';

@JsonSerializable()
class EditCategoryRequestBody {
  @JsonKey(name: 'name')
  String? name;

  EditCategoryRequestBody({this.name});

  factory EditCategoryRequestBody.fromJson(Map<String, dynamic> json) =>
      _$EditCategoryRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$EditCategoryRequestBodyToJson(this);
}