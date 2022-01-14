
import 'package:wallet_app/calendar/data/source/remote/model/total_day_expenses_response.dart';

abstract class ExpensesDataSource {
  Future<TotalDayExpensesResponse> getExpenses();
}