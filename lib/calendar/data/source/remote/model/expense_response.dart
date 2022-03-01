
import 'package:json_annotation/json_annotation.dart';

part 'expense_response.g.dart';

@JsonSerializable()
class ExpenseResponse {
  @JsonKey(name: 'date')
  final String? categoryName;
  @JsonKey(name: 'value')
  final double? amount;

  ExpenseResponse(this.categoryName, this.amount);

  factory ExpenseResponse.fromJson(Map<String, dynamic> json) =>
      _$ExpenseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseResponseToJson(this);
}