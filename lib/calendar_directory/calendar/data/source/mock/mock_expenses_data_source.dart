import 'dart:convert';
import 'package:flutter/services.dart';

import '../expenses_data_source.dart';
import '../remote/model/categories_response.dart';
import '../remote/model/total_day_expenses_response.dart';

class MockExpensesDataSource extends ExpensesDataSource {
  @override
  Future<TotalDayExpensesResponse> getExpenses(String date) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final data =
        await rootBundle.loadString('assets/requests/expenses_body.json');
    var json = jsonDecode(data);
    return TotalDayExpensesResponse.fromJson(json);
  }

  @override
  Future<List<CategoriesResponse>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final data =
        await rootBundle.loadString('assets/requests/categories_body.json');
    var json = jsonDecode(data);
    return (json as List)
        .map((category) => CategoriesResponse.fromJson(category))
        .toList();
  }

  @override
  Future<void> addExpense(String date, double amount, int categoryId) {
    // TODO: implement addExpense
    throw UnimplementedError();
  }
}
