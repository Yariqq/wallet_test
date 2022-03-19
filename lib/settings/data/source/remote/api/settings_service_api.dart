import 'package:dio_http/dio_http.dart';
import 'package:retrofit/http.dart';
import 'package:wallet_app/settings/data/source/remote/model/add_category_request_body.dart';
import 'package:wallet_app/settings/data/source/remote/model/edit_category_request_body.dart';

part 'settings_service_api.g.dart';

@RestApi(baseUrl: 'https://moneytracker001.herokuapp.com/')
abstract class SettingsServiceApi {
  factory SettingsServiceApi(Dio dio, {String baseUrl}) = _SettingsServiceApi;

  @POST('api/categories/')
  Future<void> addCategory(
    @Body() AddCategoryRequestBody body,
  );

  @DELETE('api/categories/{categoryId}/')
  Future<void> deleteCategory(
    @Path('categoryId') int categoryId,
  );

  @PATCH('api/categories/{categoryId}')
  Future<void> editCategory(
    @Path('categoryId') int categoryId,
    @Body() EditCategoryRequestBody body,
  );
}
