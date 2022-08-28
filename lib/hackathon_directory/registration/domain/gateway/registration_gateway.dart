
abstract class RegistrationGateway {
  const RegistrationGateway();

  Future<void> register(String login, String password, bool role);
}