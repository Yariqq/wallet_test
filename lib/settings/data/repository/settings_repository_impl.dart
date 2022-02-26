
import 'package:wallet_app/settings/data/source/settings_data_source.dart';
import 'package:wallet_app/settings/domain/repository/settings_repository.dart';

class SettingsRepositoryImpl extends SettingsRepository {
  final SettingsDataSource _settingsDataSource;

  SettingsRepositoryImpl(this._settingsDataSource);

  @override
  Future<void> addCategory(String name) {
    return _settingsDataSource.addCategory(name);
  }

}