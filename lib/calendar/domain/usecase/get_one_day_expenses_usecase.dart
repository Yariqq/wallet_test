
import 'package:wallet_app/calendar/domain/model/total_day_expenses.dart';
import 'package:wallet_app/calendar/domain/repository/expenses_repository.dart';
import 'package:wallet_app/core/usecases/usecase.dart';

class GetOneDayExpensesUseCase extends UseCase<String, TotalDayExpenses> {
  final ExpensesRepository repository;

  GetOneDayExpensesUseCase({required this.repository});

  @override
  Future<TotalDayExpenses> execute(String params) {
    return repository.getOneDayExpenses(params);
  }

}