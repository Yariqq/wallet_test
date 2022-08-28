import 'package:dio_http/dio_http.dart';
import 'package:retrofit/http.dart';
import 'package:wallet_app/hackathon_directory/registration/data/source/remote/model/registration_request_body.dart';

part 'registration_api.g.dart';

@RestApi(baseUrl: 'http://172.104.131.215:8000/')
abstract class RegistrationApi {
  factory RegistrationApi(Dio dio, {String baseUrl}) = _RegistrationApi;

  @POST('api/v1/user')
  Future<void> register(
    @Body() RegistrationRequestBody body,
  );
}
