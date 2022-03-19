
abstract class SettingsRepository {
  Future<void> addCategory(String name);

  Future<void> deleteCategory(int categoryId);

  Future<void> editCategory(int categoryId, String newName);
}