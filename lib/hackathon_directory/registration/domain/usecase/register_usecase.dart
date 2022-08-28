import 'package:wallet_app/core/usecases/usecase.dart';
import 'package:wallet_app/hackathon_directory/registration/domain/entity/user.dart';
import 'package:wallet_app/hackathon_directory/registration/domain/gateway/registration_gateway.dart';

class RegisterUseCase extends UseCase<User, void> {
  final RegistrationGateway registrationGateway;

  const RegisterUseCase({required this.registrationGateway});

  @override
  Future<void> execute(User params) {
    return registrationGateway.register(
      params.login,
      params.password,
      params.role,
    );
  }
}
