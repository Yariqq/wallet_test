
class Category {
  final String name;
  final int id;

  Category({required this.name, required this.id});

  factory Category.empty() {
    return Category(
      name: '',
      id: -1,
    );
  }
}