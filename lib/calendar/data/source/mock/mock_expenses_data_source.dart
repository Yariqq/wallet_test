import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:wallet_app/calendar/data/source/expenses_data_source.dart';
import 'package:wallet_app/calendar/data/source/remote/model/total_day_expenses_response.dart';

class MockExpensesDataSource extends ExpensesDataSource {

  @override
  Future<TotalDayExpensesResponse> getExpenses() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final data =
        await rootBundle.loadString('assets/requests/expenses_body.json');
    var json = jsonDecode(data);
    return TotalDayExpensesResponse.fromJson(json);
  }

  @override
  Future<List<String>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final data =
        await rootBundle.loadString('assets/requests/categories_body.json');
    var json = jsonDecode(data);
    return Future.value(json.cast<String>());
  }

}
