import 'package:wallet_app/hackathon_directory/registration/presentation/bloc/registration_bloc_model.dart';

abstract class RegistrationState {
  final RegistrationBlocModel model;

  const RegistrationState(this.model);

  factory RegistrationState.initial() = InitState;

  const factory RegistrationState.loading(RegistrationBlocModel model) =
      LoadingState;

  const factory RegistrationState.success(RegistrationBlocModel model) =
      SuccessState;

  const factory RegistrationState.successRegistration(
      RegistrationBlocModel model) = SuccessRegistrationState;
}

class InitState extends RegistrationState {
  InitState() : super(RegistrationBlocModel.empty());
}

class LoadingState extends RegistrationState {
  const LoadingState(RegistrationBlocModel model) : super(model);
}

class SuccessState extends RegistrationState {
  const SuccessState(RegistrationBlocModel model) : super(model);
}

class SuccessRegistrationState extends RegistrationState {
  const SuccessRegistrationState(RegistrationBlocModel model) : super(model);
}
