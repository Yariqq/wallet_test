
import 'package:wallet_app/core/usecases/usecase.dart';
import 'package:wallet_app/settings/domain/repository/settings_repository.dart';

class AddCategoryUseCase extends UseCase<AddCategoryUseCaseParams, void> {
  final SettingsRepository settingsRepository;

  AddCategoryUseCase({required this.settingsRepository});

  @override
  Future<void> execute(AddCategoryUseCaseParams params) {
    return settingsRepository.addCategory(params.name);
  }

}

class AddCategoryUseCaseParams {
  final String name;

  AddCategoryUseCaseParams({required this.name});
}