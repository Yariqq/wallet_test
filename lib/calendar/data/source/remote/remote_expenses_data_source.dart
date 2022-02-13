
import 'package:wallet_app/calendar/data/source/expenses_data_source.dart';
import 'package:wallet_app/calendar/data/source/remote/api/expenses_service_api.dart';
import 'package:wallet_app/calendar/data/source/remote/model/categories_response.dart';
import 'package:wallet_app/calendar/data/source/remote/model/total_day_expenses_response.dart';

class RemoteExpensesDataSource extends ExpensesDataSource {
  final ExpensesServiceApi expensesServiceApi;

  RemoteExpensesDataSource({required this.expensesServiceApi});

  @override
  Future<List<CategoriesResponse>> getCategories() {
    return expensesServiceApi.getCategories();
  }

  @override
  Future<TotalDayExpensesResponse> getExpenses() {
    return expensesServiceApi.getDayExpenses();
  }

}