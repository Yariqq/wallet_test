import 'package:wallet_app/settings/data/source/remote/api/settings_service_api.dart';
import 'package:wallet_app/settings/data/source/remote/model/add_category_request_body.dart';
import 'package:wallet_app/settings/data/source/remote/model/edit_category_request_body.dart';
import 'package:wallet_app/settings/data/source/settings_data_source.dart';

class RemoteSettingsDataSource extends SettingsDataSource {
  final SettingsServiceApi settingsServiceApi;

  RemoteSettingsDataSource({required this.settingsServiceApi});

  @override
  Future<void> addCategory(String name) {
    return settingsServiceApi.addCategory(
      AddCategoryRequestBody(name: name),
    );
  }

  @override
  Future<void> deleteCategory(int categoryId) {
    return settingsServiceApi.deleteCategory(categoryId);
  }

  @override
  Future<void> editCategory(int categoryId, String newName) {
    return settingsServiceApi.editCategory(
      categoryId,
      EditCategoryRequestBody(name: newName),
    );
  }

}