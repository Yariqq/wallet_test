import 'package:wallet_app/calendar/data/source/remote/model/categories_response.dart';
import 'package:wallet_app/calendar/domain/model/category.dart';
import 'package:wallet_app/core/mappers/mapper.dart';

class CategoriesMapper
    extends Mapper<List<Category>, List<CategoriesResponse>> {

  @override
  List<Category> mapFromBean(List<CategoriesResponse> src) {
    return src
        .map((category) =>
            Category(name: category.name ?? '', id: category.id ?? 0))
        .toList();
  }

  @override
  List<CategoriesResponse> mapToBean(List<Category> src) {
    // TODO: implement mapToBean
    throw UnimplementedError();
  }
}
