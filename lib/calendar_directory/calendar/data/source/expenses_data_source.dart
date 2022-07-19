
import 'package:wallet_app/calendar_directory/calendar/data/source/remote/model/categories_response.dart';
import 'package:wallet_app/calendar_directory/calendar/data/source/remote/model/total_day_expenses_response.dart';

abstract class ExpensesDataSource {
  Future<TotalDayExpensesResponse> getExpenses(String date);

  Future<List<CategoriesResponse>> getCategories();

  Future<void> addExpense(
    String date,
    double amount,
    int categoryId,
  );
}
