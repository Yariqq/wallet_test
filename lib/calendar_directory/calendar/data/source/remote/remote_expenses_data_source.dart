
import '../expenses_data_source.dart';
import 'api/expenses_service_api.dart';
import 'model/add_expense_request_body.dart';
import 'model/categories_response.dart';
import 'model/total_day_expenses_response.dart';

class RemoteExpensesDataSource extends ExpensesDataSource {
  final ExpensesServiceApi expensesServiceApi;

  RemoteExpensesDataSource({required this.expensesServiceApi});

  @override
  Future<List<CategoriesResponse>> getCategories() {
    return expensesServiceApi.getCategories();
  }

  @override
  Future<TotalDayExpensesResponse> getExpenses(String date) {
    return expensesServiceApi.getDayExpenses(date);
  }

  @override
  Future<void> addExpense(String date, double amount, int categoryId) {
    return expensesServiceApi.addExpense(
      AddExpenseRequestBody(
        amount: amount,
        date: date,
        categoryId: categoryId,
      ),
    );
  }

}