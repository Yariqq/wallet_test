
import 'package:wallet_app/calendar/domain/model/total_day_expenses.dart';

abstract class ExpensesRepository {
  Future<TotalDayExpenses> getOneDayExpenses();
}