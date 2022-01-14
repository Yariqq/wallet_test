import 'package:cherrypick/cherrypick.dart';
import 'package:wallet_app/calendar/data/mapper/expense_mapper.dart';
import 'package:wallet_app/calendar/data/mapper/total_day_expenses_mapper.dart';
import 'package:wallet_app/calendar/data/repository/expenses_repository_impl.dart';
import 'package:wallet_app/calendar/data/source/expenses_data_source.dart';
import 'package:wallet_app/calendar/data/source/mock/mock_expenses_data_source.dart';
import 'package:wallet_app/calendar/domain/repository/expenses_repository.dart';
import 'package:wallet_app/calendar/domain/usecase/get_one_day_expenses_usecase.dart';

class ExpensesModule extends Module {
  @override
  void builder(Scope currentScope) {
    bind<ExpenseMapper>().toInstance(ExpenseMapper());
    bind<TotalDayExpensesMapper>().toProvide(
        () => TotalDayExpensesMapper(currentScope.resolve<ExpenseMapper>()));

    bind<ExpensesDataSource>().toInstance(MockExpensesDataSource()).singleton();

    bind<ExpensesRepository>().toProvide(() => ExpensesRepositoryImpl(
        currentScope.resolve<TotalDayExpensesMapper>(),
        currentScope.resolve<ExpensesDataSource>()));

    bind<GetOneDayExpensesUseCase>().toProvide(() => GetOneDayExpensesUseCase(
        repository: currentScope.resolve<ExpensesRepository>()));
  }
}
