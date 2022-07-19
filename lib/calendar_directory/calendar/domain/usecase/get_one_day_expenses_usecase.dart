import 'package:wallet_app/core/usecases/usecase.dart';

import '../model/total_day_expenses.dart';
import '../repository/expenses_repository.dart';

class GetOneDayExpensesUseCase extends UseCase<String, TotalDayExpenses> {
  final ExpensesRepository repository;

  GetOneDayExpensesUseCase({required this.repository});

  @override
  Future<TotalDayExpenses> execute(String params) {
    return repository.getOneDayExpenses(params);
  }
}
