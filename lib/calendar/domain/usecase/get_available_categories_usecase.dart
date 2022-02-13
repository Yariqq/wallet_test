
import 'package:wallet_app/calendar/domain/model/category.dart';
import 'package:wallet_app/calendar/domain/repository/expenses_repository.dart';
import 'package:wallet_app/core/usecases/usecase.dart';

class GetAvailableCategoriesUseCase extends UseCase<void, List<Category>> {
  final ExpensesRepository repository;

  GetAvailableCategoriesUseCase({required this.repository});

  @override
  Future<List<Category>> execute(void params) {
    return repository.getAvailableCategories();
  }

}