
import 'package:wallet_app/calendar/domain/model/expense.dart';
import 'package:wallet_app/calendar/domain/repository/expenses_repository.dart';
import 'package:wallet_app/core/usecases/usecase.dart';

class GetOneDayExpensesUseCase extends UseCase<void, List<Expense>> {
  final ExpensesRepository repository;

  GetOneDayExpensesUseCase({required this.repository});

  @override
  Future<List<Expense>> execute(void params) {
    return repository.getOneDayExpenses();
  }

}