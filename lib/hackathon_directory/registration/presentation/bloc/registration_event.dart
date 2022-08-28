abstract class RegistrationEvent {
  const RegistrationEvent();

  const factory RegistrationEvent.changeCheckboxValue(bool newValue) =
      ChangeCheckboxValueEvent;

  const factory RegistrationEvent.register({
    required String login,
    required String password,
    required bool role,
  }) = RegisterEvent;
}

class ChangeCheckboxValueEvent extends RegistrationEvent {
  final bool newValue;

  const ChangeCheckboxValueEvent(this.newValue);
}

class RegisterEvent extends RegistrationEvent {
  final String login;
  final String password;
  final bool role;

  const RegisterEvent({
    required this.login,
    required this.password,
    required this.role,
  });
}
