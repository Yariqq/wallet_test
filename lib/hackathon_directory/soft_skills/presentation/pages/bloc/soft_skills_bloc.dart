import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/presentation/pages/bloc/soft_skills_event.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/presentation/pages/bloc/soft_skills_state.dart';

import '../../../domain/usecases/get_soft_skills_usecase.dart';
import '../../../domain/usecases/get_user_usecase.dart';

class SoftSkillsBloc extends Bloc<SoftSkillsEvent, SoftSkillsState> {
  final GetSoftSkillsUseCase getSoftSkillsUseCase;
  final GetUserUseCase getUserUseCase;

  SoftSkillsBloc(
    this.getSoftSkillsUseCase,
    this.getUserUseCase,
  ) : super(SoftSkillsState.initial()) {
    on<ChangeTabEvent>(_onChangeTabEvent);
    on<GetDataEvent>(_onGetDataEvent);
    //on<GetUserEvent>(_onGetUserEvent);
  }

  void _onChangeTabEvent(
    ChangeTabEvent event,
    Emitter<SoftSkillsState> emit,
  ) async {
    emit(SoftSkillsState.success(state.model.copyWith(index: event.index)));
  }

  void _onGetDataEvent(
    GetDataEvent event,
    Emitter<SoftSkillsState> emit,
  ) async {
    emit(SoftSkillsState.loading(state.model));

    final recruiters = await getSoftSkillsUseCase.execute();
    final user = await getUserUseCase.execute();

    emit(SoftSkillsState.success(state.model.copyWith(
      recruiters: recruiters,
      user: user,
    )));
  }

  // void _onGetUserEvent(
  //   GetUserEvent event,
  //   Emitter<SoftSkillsState> emit,
  // ) async {
  //   emit(SoftSkillsState.loading(state.model));
  //
  //   final user = await getUserUseCase.execute();
  //
  //   emit(SoftSkillsState.success(state.model.copyWith(user: user)));
  // }
}
