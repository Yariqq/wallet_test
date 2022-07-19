
import 'package:json_annotation/json_annotation.dart';

part 'add_category_request_body.g.dart';

@JsonSerializable()
class AddCategoryRequestBody {
  @JsonKey(name: 'name')
  String? name;

  AddCategoryRequestBody({this.name});

  factory AddCategoryRequestBody.fromJson(Map<String, dynamic> json) =>
      _$AddCategoryRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$AddCategoryRequestBodyToJson(this);
}