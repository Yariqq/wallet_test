import '../model/category.dart';
import '../model/total_day_expenses.dart';

abstract class ExpensesRepository {
  Future<TotalDayExpenses> getOneDayExpenses(String date);

  Future<List<Category>> getAvailableCategories();

  Future<void> addExpense(
    String date,
    double amount,
    int categoryId,
  );
}
