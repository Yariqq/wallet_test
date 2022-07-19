import 'package:wallet_app/core/usecases/usecase.dart';

import '../model/category.dart';
import '../repository/expenses_repository.dart';

class GetAvailableCategoriesUseCase extends UseCase<void, List<Category>> {
  final ExpensesRepository repository;

  GetAvailableCategoriesUseCase({required this.repository});

  @override
  Future<List<Category>> execute(void params) {
    return repository.getAvailableCategories();
  }

}