import 'package:json_annotation/json_annotation.dart';

part 'add_expense_request_body.g.dart';

@JsonSerializable()
class AddExpenseRequestBody {
  @JsonKey(name: 'value')
  double? amount;
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'category_id')
  int? categoryId;

  AddExpenseRequestBody({
    this.amount,
    this.date,
    this.categoryId,
  });

  factory AddExpenseRequestBody.fromJson(Map<String, dynamic> json) =>
      _$AddExpenseRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AddExpenseRequestBodyToJson(this);
}
