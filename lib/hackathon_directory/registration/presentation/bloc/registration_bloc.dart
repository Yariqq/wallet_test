import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/hackathon_directory/registration/domain/entity/user.dart';
import 'package:wallet_app/hackathon_directory/registration/presentation/bloc/registration_event.dart';
import 'package:wallet_app/hackathon_directory/registration/presentation/bloc/registration_state.dart';

import '../../domain/usecase/register_usecase.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegisterUseCase registerUseCase;

  RegistrationBloc(this.registerUseCase) : super(RegistrationState.initial()) {
    on<ChangeCheckboxValueEvent>(_onChangeCheckboxValueEvent);
    on<RegisterEvent>(_onRegisterEvent);
  }

  void _onChangeCheckboxValueEvent(
    ChangeCheckboxValueEvent event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(RegistrationState.success(state.model.copyWith(isHr: event.newValue)));
  }

  void _onRegisterEvent(
    RegisterEvent event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(RegistrationState.loading(state.model));
    await registerUseCase.execute(
      User(
        login: event.login,
        password: event.password,
        role: event.role,
      ),
    );
    emit(RegistrationState.successRegistration(state.model));
  }
}
