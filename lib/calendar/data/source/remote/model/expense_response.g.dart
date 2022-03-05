// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseResponse _$ExpenseResponseFromJson(Map<String, dynamic> json) =>
    ExpenseResponse(
      json['category'] as String?,
      (json['value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ExpenseResponseToJson(ExpenseResponse instance) =>
    <String, dynamic>{
      'category': instance.categoryName,
      'value': instance.amount,
    };
