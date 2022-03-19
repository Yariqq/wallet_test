
import 'package:wallet_app/core/usecases/usecase.dart';
import 'package:wallet_app/settings/domain/repository/settings_repository.dart';

class DeleteCategoryUseCase extends UseCase<int, void> {
  final SettingsRepository settingsRepository;

  DeleteCategoryUseCase({required this.settingsRepository});

  @override
  Future<void> execute(int params) {
    return settingsRepository.deleteCategory(params);
  }

}