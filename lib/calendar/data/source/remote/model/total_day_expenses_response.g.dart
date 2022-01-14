// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_day_expenses_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalDayExpensesResponse _$TotalDayExpensesResponseFromJson(
        Map<String, dynamic> json) =>
    TotalDayExpensesResponse(
      (json['expenses'] as List<dynamic>)
          .map((e) => ExpenseResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['totalDayAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TotalDayExpensesResponseToJson(
        TotalDayExpensesResponse instance) =>
    <String, dynamic>{
      'expenses': instance.expenses,
      'totalDayAmount': instance.totalDayAmount,
    };
