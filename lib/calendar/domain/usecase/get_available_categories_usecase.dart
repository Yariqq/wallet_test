
import 'package:wallet_app/calendar/domain/repository/expenses_repository.dart';
import 'package:wallet_app/core/usecases/usecase.dart';

class GetAvailableCategoriesUseCase extends UseCase<void, List<String>> {
  final ExpensesRepository repository;

  GetAvailableCategoriesUseCase({required this.repository});

  @override
  Future<List<String>> execute(void params) {
    return repository.getAvailableCategories();
  }

}