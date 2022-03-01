import 'package:wallet_app/calendar/domain/model/category.dart';
import 'package:wallet_app/calendar/domain/model/total_day_expenses.dart';

abstract class ExpensesRepository {
  Future<TotalDayExpenses> getOneDayExpenses(String date);

  Future<List<Category>> getAvailableCategories();

  Future<void> addExpense(
    String date,
    double amount,
    int categoryId,
  );
}
