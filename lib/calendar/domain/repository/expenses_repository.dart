
import 'package:wallet_app/calendar/domain/model/category.dart';
import 'package:wallet_app/calendar/domain/model/total_day_expenses.dart';

abstract class ExpensesRepository {
  Future<TotalDayExpenses> getOneDayExpenses();

  Future<List<Category>> getAvailableCategories();
}