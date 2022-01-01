import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:wallet_app/calendar/data/source/expenses_data_source.dart';
import 'package:wallet_app/calendar/data/source/remote/model/expense_response.dart';

class MockExpensesDataSource extends ExpensesDataSource {

  @override
  Future<List<ExpenseResponse>> getExpenses() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final data =
        await rootBundle.loadString('assets/requests/expenses_body.json');
    var json = jsonDecode(data) as List<dynamic>;
    return json.map((json) => ExpenseResponse.fromJson(json)).toList();
  }

}
