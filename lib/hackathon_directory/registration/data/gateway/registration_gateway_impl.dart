import 'package:wallet_app/hackathon_directory/registration/data/source/remote/api/registration_api.dart';
import 'package:wallet_app/hackathon_directory/registration/data/source/remote/model/registration_request_body.dart';
import 'package:wallet_app/hackathon_directory/registration/domain/gateway/registration_gateway.dart';

class RegistrationGatewayImpl extends RegistrationGateway {
  final RegistrationApi registrationApi;

  const RegistrationGatewayImpl({required this.registrationApi});

  @override
  Future<void> register(String login, String password, bool role) {
    return registrationApi.register(
      RegistrationRequestBody(
        email: login,
        password: password,
        isHr: role,
      ),
    );
  }
}
