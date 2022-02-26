import 'package:cherrypick/cherrypick.dart';
import 'package:dio_http/dio_http.dart';
import 'package:wallet_app/settings/data/repository/settings_repository_impl.dart';
import 'package:wallet_app/settings/data/source/remote/api/settings_service_api.dart';
import 'package:wallet_app/settings/data/source/remote/remote_settings_data_source.dart';
import 'package:wallet_app/settings/data/source/settings_data_source.dart';
import 'package:wallet_app/settings/domain/repository/settings_repository.dart';
import 'package:wallet_app/settings/domain/usecase/add_category_usecase.dart';

class SettingsModule extends Module {
  @override
  void builder(Scope currentScope) {
    bind<SettingsDataSource>().toProvide(() {
      final baseUrl = currentScope.resolve<String>(named: 'baseUrl');
      return RemoteSettingsDataSource(
        settingsServiceApi: SettingsServiceApi(
          currentScope.resolve<Dio>(),
          baseUrl: baseUrl,
        ),
      );
    }).singleton();

    bind<SettingsRepository>().toProvide(() =>
        SettingsRepositoryImpl(currentScope.resolve<SettingsDataSource>()));

    bind<AddCategoryUseCase>().toProvide(() => AddCategoryUseCase(
        settingsRepository: currentScope.resolve<SettingsRepository>()));
  }
}
