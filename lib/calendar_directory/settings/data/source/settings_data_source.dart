
abstract class SettingsDataSource {
  Future<void> addCategory(String name);

  Future<void> deleteCategory(int categoryId);

  Future<void> editCategory(int categoryId, String newName);
}