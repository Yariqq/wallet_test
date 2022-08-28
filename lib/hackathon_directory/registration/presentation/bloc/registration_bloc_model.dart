
class RegistrationBlocModel {
  final bool isHr;

  const RegistrationBlocModel({required this.isHr});

  RegistrationBlocModel copyWith({bool? isHr}) {
    return RegistrationBlocModel(isHr: isHr ?? this.isHr);
  }

  RegistrationBlocModel.empty() : isHr = false;
}