
import 'package:wallet_app/calendar/data/source/remote/model/expense_response.dart';

abstract class ExpensesDataSource {
  Future<List<ExpenseResponse>> getExpenses();
}