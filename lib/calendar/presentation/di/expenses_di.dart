import 'package:cherrypick/cherrypick.dart';
import 'package:dio_http/dio_http.dart';
import 'package:wallet_app/calendar/data/mapper/categories_mapper.dart';
import 'package:wallet_app/calendar/data/mapper/expense_mapper.dart';
import 'package:wallet_app/calendar/data/mapper/total_day_expenses_mapper.dart';
import 'package:wallet_app/calendar/data/repository/expenses_repository_impl.dart';
import 'package:wallet_app/calendar/data/source/expenses_data_source.dart';
import 'package:wallet_app/calendar/data/source/mock/mock_expenses_data_source.dart';
import 'package:wallet_app/calendar/data/source/remote/api/expenses_service_api.dart';
import 'package:wallet_app/calendar/data/source/remote/remote_expenses_data_source.dart';
import 'package:wallet_app/calendar/domain/repository/expenses_repository.dart';
import 'package:wallet_app/calendar/domain/usecase/add_expense_usecase.dart';
import 'package:wallet_app/calendar/domain/usecase/get_available_categories_usecase.dart';
import 'package:wallet_app/calendar/domain/usecase/get_one_day_expenses_usecase.dart';

class ExpensesModule extends Module {
  @override
  void builder(Scope currentScope) {
    bind<ExpenseMapper>().toInstance(ExpenseMapper());
    bind<TotalDayExpensesMapper>().toProvide(
        () => TotalDayExpensesMapper(currentScope.resolve<ExpenseMapper>()));
    bind<CategoriesMapper>().toInstance(CategoriesMapper());

    bind<ExpensesDataSource>().toProvide(() {
      if (currentScope.resolve<bool>(named: 'isMockMode')) {
        return MockExpensesDataSource();
      } else {
        final baseUrl = currentScope.resolve<String>(named: 'baseUrl');
        return RemoteExpensesDataSource(
          expensesServiceApi: ExpensesServiceApi(
            currentScope.resolve<Dio>(),
            baseUrl: baseUrl,
          ),
        );
      }
    }).singleton();

    bind<ExpensesRepository>().toProvide(
      () => ExpensesRepositoryImpl(
        currentScope.resolve<TotalDayExpensesMapper>(),
        currentScope.resolve<CategoriesMapper>(),
        currentScope.resolve<ExpensesDataSource>(),
      ),
    );

    bind<GetOneDayExpensesUseCase>().toProvide(() => GetOneDayExpensesUseCase(
        repository: currentScope.resolve<ExpensesRepository>()));

    bind<GetAvailableCategoriesUseCase>().toProvide(() =>
        GetAvailableCategoriesUseCase(
            repository: currentScope.resolve<ExpensesRepository>()));

    bind<AddExpenseUseCase>().toProvide(() => AddExpenseUseCase(
        repository: currentScope.resolve<ExpensesRepository>()));
  }
}
