import '../settings_data_source.dart';
import 'api/settings_service_api.dart';
import 'model/add_category_request_body.dart';
import 'model/edit_category_request_body.dart';

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
