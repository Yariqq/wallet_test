import 'package:wallet_app/hackathon_directory/soft_skills/presentation/pages/bloc/soft_skills_bloc_model.dart';

abstract class SoftSkillsState {
  final SoftSkillsBlocModel model;

  const SoftSkillsState(this.model);

  factory SoftSkillsState.initial() = InitState;

  const factory SoftSkillsState.loading(SoftSkillsBlocModel model) =
      LoadingState;

  const factory SoftSkillsState.success(SoftSkillsBlocModel model) =
      SuccessState;
}

class InitState extends SoftSkillsState {
  InitState() : super(SoftSkillsBlocModel.empty());
}

class LoadingState extends SoftSkillsState {
  const LoadingState(SoftSkillsBlocModel model) : super(model);
}

class SuccessState extends SoftSkillsState {
  const SuccessState(SoftSkillsBlocModel model) : super(model);
}
