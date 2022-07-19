import 'package:cherrypick/cherrypick.dart';
import 'package:dio_http/dio_http.dart';

import '../../data/repository/settings_repository_impl.dart';
import '../../data/source/remote/api/settings_service_api.dart';
import '../../data/source/remote/remote_settings_data_source.dart';
import '../../data/source/settings_data_source.dart';
import '../../domain/repository/settings_repository.dart';
import '../../domain/usecase/add_category_usecase.dart';
import '../../domain/usecase/delete_category_usecase.dart';
import '../../domain/usecase/edit_category_usecase.dart';

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

    bind<DeleteCategoryUseCase>().toProvide(() => DeleteCategoryUseCase(
        settingsRepository: currentScope.resolve<SettingsRepository>()));

    bind<EditCategoryUseCase>().toProvide(() => EditCategoryUseCase(
        settingsRepository: currentScope.resolve<SettingsRepository>()));
  }
}
