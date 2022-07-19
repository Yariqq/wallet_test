import 'package:wallet_app/core/usecases/usecase.dart';

import '../repository/settings_repository.dart';

class EditCategoryUseCase extends UseCase<EditCategoryUseCaseParams, void> {
  final SettingsRepository settingsRepository;

  EditCategoryUseCase({required this.settingsRepository});

  @override
  Future<void> execute(EditCategoryUseCaseParams params) {
    return settingsRepository.editCategory(params.categoryId, params.newName);
  }
}

class EditCategoryUseCaseParams {
  final int categoryId;
  final String newName;

  EditCategoryUseCaseParams({required this.categoryId, required this.newName});
}
