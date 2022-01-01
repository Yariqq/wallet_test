
abstract class Mapper<Entity, Bean> {
  Entity mapFromBean(Bean src);
  Bean mapToBean(Entity src);
}