import 'package:wallet_app/core/usecases/usecase.dart';

import '../repository/expenses_repository.dart';

class AddExpenseUseCase extends UseCase<AddExpenseUseCaseParams, void> {
  final ExpensesRepository repository;

  AddExpenseUseCase({required this.repository});

  @override
  Future<void> execute(AddExpenseUseCaseParams params) {
    return repository.addExpense(
      params.date,
      params.amount,
      params.categoryId,
    );
  }
}

class AddExpenseUseCaseParams {
  final String date;
  final double amount;
  final int categoryId;

  AddExpenseUseCaseParams({
    required this.date,
    required this.amount,
    required this.categoryId,
  });
}
