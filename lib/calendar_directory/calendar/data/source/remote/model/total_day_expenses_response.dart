import 'package:json_annotation/json_annotation.dart';
import 'expense_response.dart';

part 'total_day_expenses_response.g.dart';

@JsonSerializable()
class TotalDayExpensesResponse {
  @JsonKey(name: 'expenses')
  final List<ExpenseResponse> expenses;
  @JsonKey(name: 'total_amount')
  final double? totalDayAmount;

  TotalDayExpensesResponse(this.expenses, this.totalDayAmount);

  factory TotalDayExpensesResponse.fromJson(Map<String, dynamic> json) =>
      _$TotalDayExpensesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TotalDayExpensesResponseToJson(this);
}
