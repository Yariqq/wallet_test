import 'package:dio_http/dio_http.dart';
import 'package:retrofit/http.dart';
import 'package:wallet_app/calendar/data/source/remote/model/add_expense_request_body.dart';
import 'package:wallet_app/calendar/data/source/remote/model/categories_response.dart';
import 'package:wallet_app/calendar/data/source/remote/model/total_day_expenses_response.dart';

part 'expenses_service_api.g.dart';

@RestApi(baseUrl: 'https://moneytracker001.herokuapp.com/')
abstract class ExpensesServiceApi {
  factory ExpensesServiceApi(Dio dio, {String baseUrl}) = _ExpensesServiceApi;

  @GET('api/expenses/')
  Future<TotalDayExpensesResponse> getDayExpenses(
    @Query('date') String date,
  );

  @GET('api/categories/')
  Future<List<CategoriesResponse>> getCategories();

  @POST('api/expenses/')
  Future<void> addExpense(
    @Body() AddExpenseRequestBody body,
  );
}
